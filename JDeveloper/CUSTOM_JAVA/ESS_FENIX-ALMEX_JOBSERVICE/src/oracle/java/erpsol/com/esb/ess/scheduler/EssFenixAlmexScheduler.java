package oracle.java.erpsol.com.esb.ess.scheduler;

import java.io.FileInputStream;
import java.io.InputStream;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.Properties;
import java.util.logging.Level;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.sql.DataSource;

import oracle.as.scheduler.Cancellable;
import oracle.as.scheduler.Executable;
import oracle.as.scheduler.ExecutionCancelledException;
import oracle.as.scheduler.ExecutionErrorException;
import oracle.as.scheduler.ExecutionPausedException;
import oracle.as.scheduler.ExecutionWarningException;
import oracle.as.scheduler.RequestExecutionContext;
import oracle.as.scheduler.RequestParameters;
import oracle.as.scheduler.RuntimeService;
import oracle.as.scheduler.RuntimeServiceHandle;
import oracle.as.scheduler.request.ContentFactory;
import oracle.as.scheduler.request.ContentType;
import oracle.as.scheduler.request.RequestLogger;
import oracle.as.scheduler.request.RequestOutput;

import oracle.java.erpsol.com.esb.ess.util.ProcessSchedulerMessage;

public class EssFenixAlmexScheduler implements Executable, Cancellable  {

    private boolean m_cancelled = false;
    private RequestExecutionContext m_requestExecutionContext;
    private RequestParameters m_requestParameters;
    private RequestLogger m_requestLogger = null;
    private RequestOutput m_requestOutput = null;
    
    private  InitialContext context = null;
    private  Connection connection = null;
    private  CallableStatement cstmt = null;


    @Override
    public void execute(RequestExecutionContext requestExecutionContext,
                        RequestParameters requestParameters) throws ExecutionErrorException, ExecutionWarningException,
                                                                    ExecutionCancelledException,
                                                                    ExecutionPausedException {
        m_requestExecutionContext = requestExecutionContext;
        m_requestParameters = requestParameters;
        boolean completedWithoutFailure = false;
        long requestId = requestExecutionContext.getRequestId();
        String msgOut = "";
        String business = (String)requestParameters.getValue("businessName");
        ProcessSchedulerMessage process;
        
       
        try {
            
            System.err.println();
            System.err.println("-----------------------------------------------");
            System.err.println("-----------------------------------------------");
            msgOut +=" ESS Job requestID: " + requestId;
            msgOut +=System.lineSeparator();
            
            Properties prop = new Properties();
            InputStream input = new FileInputStream(System.getProperty("custom.props.esb"));
            prop.load(input);
            String statusServer = prop.getProperty("esb.status.maintenance.soa");
            if(statusServer.equals("true")){
                System.err.println (" ---- Maintenance Policy: If the SOA server is undergoing maintenance, do not carry out any transactions. Please wait ");
                msgOut +=" ---- Maintenance Policy: If the SOA server is undergoing maintenance, do not carry out any transactions. Please wait ";
                writeToRequestOutput(requestId, msgOut, ContentType.Text);
                writeToRequestLog(requestId, msgOut);
                return;
            }
            
            msgOut +=" Message for business: "+business;
            msgOut +=System.lineSeparator();

           DataSource dataSource;
           String status="";
           String queue="";
           String report="";
         //  String t="TERMINATE";
            
           try {

                    
               context = new InitialContext();
               dataSource = (DataSource) context.lookup("jdbc/almex/fenix/XXALConsolidate");
               connection = dataSource.getConnection();
               Statement stmt = connection.createStatement();
               ResultSet rs = stmt.executeQuery("SELECT STATUS,JMS_JNDI_NAME,QUERY_REPORT FROM XXAL_CONTROL_TABLE_T WHERE BUSINESS_NAME='"+business+"'");
               while (rs.next()) {
                   status = rs.getString("STATUS");
                   queue = rs.getString("JMS_JNDI_NAME");
                   report = rs.getString("QUERY_REPORT");
               }
               stmt.close(); 
               System.err.println("----------------STATUS-------------------------");
               System.err.println(status);
               System.err.println("-----------------------------------------------");

           } catch (NamingException e) {
               e.printStackTrace();
              // return;
             
           } catch (SQLException e) {
               e.printStackTrace();
            //   return;
              
           } finally {
               try {
                   context.close();
                   connection.close();
               } catch (NamingException e) {
                   e.printStackTrace();
               } catch (SQLException e) {
                   e.printStackTrace();
               }

           }
       //     System.err.println("----------------NEXT------------------------");
            /////////////////
            if(status.equals("TERMINATE")){

                String response= "<Ejecutar/>";
                process = ProcessSchedulerMessage.class.newInstance();
                msgOut +=" status: "+status;
                msgOut +=System.lineSeparator();
                msgOut +=" queue: "+queue;
                msgOut +=System.lineSeparator();
                msgOut +=" report: "+report;
                msgOut +=System.lineSeparator();
                                
                process.sendMessage(response, queue);
                
                msgOut +=" Message sent ............... ";
            }
            ////////////////
            
            writeToRequestOutput(requestId, msgOut, ContentType.Text);
            writeToRequestLog(requestId, msgOut);
            completedWithoutFailure = true;
        } catch (Exception e) {
           e.printStackTrace();
            try {
                msgOut +=System.lineSeparator();
                msgOut +=e.getMessage();
                writeToRequestOutput(requestId, msgOut, ContentType.Text);
                writeToRequestLog(requestId, msgOut);
            } catch (Exception f) {
            }
            //completedWithoutFailure = false;
        }


    }


    @Override
    public void cancel() {
        m_cancelled = true;
    }


    private void writeToRequestLog(long requestId, String contentToWrite) throws Exception {
        m_requestLogger = ContentFactory.getRequestLogger(requestId);
        m_requestLogger.log(Level.INFO, contentToWrite);
    }

    private void writeToRequestOutput(long requestId, String contentToWrite, ContentType contentType) {
        RuntimeService runtime = null;
        RuntimeServiceHandle rHandle = null;
        try {
            runtime = getRuntimeService();
            rHandle = runtime.open();
            if (rHandle != null) {
                m_requestOutput = ContentFactory.getRequestOutput(rHandle, requestId, contentType, requestId + ".txt");

                if (m_requestOutput != null) {
                    if (contentType == ContentType.Text)
                        m_requestOutput.write("[reqId " + requestId + "] " + contentToWrite);
                    else
                        m_requestOutput.write(contentToWrite.getBytes());
                }
            }
        } catch (Exception e) {
            //ignore
        } finally {
            if (rHandle != null) {
                try {
                    runtime.close(rHandle);
                    rHandle = null;
                } catch (Throwable t) {
                    ; // ignore
                }
            }
        }
    }

    /**
     * Returns runtime service.
     */
    public RuntimeService getRuntimeService() throws Exception {
        Context ctx = new InitialContext();
        RuntimeService rs = (RuntimeService) ctx.lookup("java:comp/env/ess/runtime");
        ctx.close();

        return rs;
    }


    public boolean isCancelled() {
        return m_cancelled;
    }

    public RequestExecutionContext getRequestExecutionContext() {
        return m_requestExecutionContext;
    }

    public RequestParameters getRequestParameters() {
        return m_requestParameters;
    }

}
