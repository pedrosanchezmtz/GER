package integra.globalgas.com.esb.ess.scheduler;

import integra.globalgas.com.esb.ess.util.ProcessFilesFTPGlobalGas;
import integra.globalgas.com.esb.ess.util.ProcessSchedulerDPPayments;
import integra.globalgas.com.esb.ess.util.ProcessSchedulerMessage;

import java.io.StringWriter;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;

import java.util.logging.Level;
import java.util.logging.Logger;

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
import oracle.as.scheduler.request.ContentFactory;
import oracle.as.scheduler.request.RequestLogger;
import oracle.as.scheduler.request.RequestOutput;
import oracle.as.scheduler.RuntimeService;
import oracle.as.scheduler.RuntimeServiceHandle;
import oracle.as.scheduler.request.ContentType;

import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;

public class EssIntegraGlobalGasDPSchedulerProcess implements Executable, Cancellable {

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
        String bank = (String)requestParameters.getValue("bankName");
        String queue = (String)requestParameters.getValue("process");
        ProcessSchedulerMessage process;
        ProcessFilesFTPGlobalGas ftp;
        ProcessSchedulerDPPayments pays;
        String path;
        String xml;
       
        try {
            
            System.err.println();
            System.err.println("-----------------------------------------------");
            System.err.println(" ESS Job requestID: " + requestId);
            msgOut +=" ESS Job requestID: " + requestId;
            msgOut +=System.lineSeparator();

            msgOut +=System.lineSeparator();
            msgOut +=" Get Files of FTP Server ... ";
            msgOut +=System.lineSeparator();
            
            //get file FTP----------------------------------------
            ftp = ProcessFilesFTPGlobalGas.class.newInstance();
            path = ftp.getFilesDP(bank);
            msgOut +=" TMP Local Path:  "+path;
            msgOut +=System.lineSeparator();
            // ---------------------------------------------------
            
            //generate XML DP errors
            pays = ProcessSchedulerDPPayments.class.newInstance();
            xml = pays.generateXMLofErrors(path);
            msgOut +=" XML payments errors:  "+xml;
            msgOut +=System.lineSeparator();
            if(!xml.contains("NOT_EXIST")) {
                    // send message ---------------------------------------
                    process = ProcessSchedulerMessage.class.newInstance();
                    process.sendMessage(xml, queue);
                    msgOut +=" Send message to cancel ..";
                    // ----------------------------------------------------         
            }
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

