package integra.globalgas.com.esb.ess.scheduler;

import integra.globalgas.com.esb.ess.util.ProcessFilesFTPGlobalGas;

import integra.globalgas.com.esb.ess.util.ProcessSchedulerDPPayments;

import integra.globalgas.com.esb.ess.util.ProcessSchedulerMessage;

import java.sql.CallableStatement;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class EssIntegraGlobalGasCtrlTrxAR implements Executable, Cancellable {

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
        String queue = "";
       // String queue = (String)requestParameters.getValue("process");
        ProcessSchedulerMessage process;
       
        try {
            
            System.err.println();
            System.err.println("-----------------------------------------------");
            System.err.println("Processing Trx AR ....");
            msgOut +=" ESS Job requestID: " + requestId;
            msgOut +=System.lineSeparator();
           // msgOut +=" Send message to Queue: "+queue;
           // msgOut +=System.lineSeparator();
           
           //////////////////
            
           DataSource dataSource;
           String cLob="";
           String status="";
            
            try {


                context = new InitialContext();
                dataSource = (DataSource) context.lookup("jdbc/globalgas/integra/XXConsolidate");
                connection = dataSource.getConnection();
                cstmt =
                    (OracleCallableStatement) connection.prepareCall(" BEGIN  XXGG_CONTROL_TRX_AR_PKG.GET_CONTROL_TRX_AR(:1, :2 , :3 , :4 );    END; ");
                cstmt.registerOutParameter(1, OracleTypes.CLOB);
                cstmt.registerOutParameter(2, OracleTypes.VARCHAR);
                cstmt.registerOutParameter(3, OracleTypes.VARCHAR);
                cstmt.registerOutParameter(4, OracleTypes.VARCHAR);

                cstmt.execute();
                cLob =cstmt.getString(1);
                queue =cstmt.getString(2);
                status =cstmt.getString(3);            

            } catch (NamingException e) {
                e.printStackTrace();
                msgOut +=System.lineSeparator();
                msgOut +=e.getMessage();
                msgOut +=System.lineSeparator();
                
            } catch (SQLException e) {
                e.printStackTrace();
                msgOut +=System.lineSeparator();
                msgOut +=e.getMessage();
                msgOut +=System.lineSeparator();
                
            } finally {
                try {
                    context.close();
                    connection.close();
                    cstmt.close();
                } catch (NamingException e) {
                } catch (SQLException e) {
                }

            }
       //     System.err.println("----------------NEXT------------------------");
            /////////////////
            if(status.equals("START")){
                process = ProcessSchedulerMessage.class.newInstance();
                process.sendMessage(cLob, queue);
                System.err.println("----------------PROCESS TRX AR-------------------------");
                msgOut +=System.lineSeparator();
                msgOut +="Queue: "+queue;
                msgOut +=System.lineSeparator();
                msgOut +=" Message sent: "+cLob;
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

