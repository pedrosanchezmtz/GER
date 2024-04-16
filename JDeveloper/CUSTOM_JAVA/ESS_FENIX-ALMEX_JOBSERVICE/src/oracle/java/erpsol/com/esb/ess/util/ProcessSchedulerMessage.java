package oracle.java.erpsol.com.esb.ess.util;

import javax.jms.JMSException;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;

import javax.naming.InitialContext;
import javax.naming.NamingException;

public class ProcessSchedulerMessage {
    private static final String CONNECTION_FACTORY_JNDI_NAME = "jms/almex/fenix/NotificationConnectionFactory";
    private static String QUEUE_JNDI_NAME = "";

    private static InitialContext initialContext = null;
    private static QueueConnectionFactory queueConnectionFactory = null;
    private static QueueConnection queueConnection = null;
    private static QueueSession queueSession = null;
    private static Queue queue = null;
    private static QueueSender queueSender = null;
    private static TextMessage textMessage = null;


    public void sendMessage(String msg, String nameQueue) {
        try {
            QUEUE_JNDI_NAME = nameQueue;
            initialContext = new InitialContext();
            queueConnectionFactory = (QueueConnectionFactory) initialContext.lookup(CONNECTION_FACTORY_JNDI_NAME);
            queueConnection = queueConnectionFactory.createQueueConnection();
            queueSession = queueConnection.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
            queue = (Queue) initialContext.lookup(QUEUE_JNDI_NAME);
            queueSender = queueSession.createSender(queue);
            textMessage = queueSession.createTextMessage();
            queueConnection.start();
            if(msg.equals("SYNC"))
                        textMessage.setText("<v1:runReportRequest xmlns:v1=\"http://xmlns.erpsol.com/core/esb/con/erpCloud/reportService/v1/\"/>");
            
            else{
                textMessage.setText(msg);
            }
            queueSender.send(textMessage);

        } catch (NamingException e) {
            e.printStackTrace();
        } catch (JMSException e) {
            e.printStackTrace();
        } finally {

            try {
                queueSender.close();
                queueSession.close();
                queueConnection.close();
                initialContext.close();
            } catch (JMSException e) {
            } catch (NamingException e) {
            }

        }
    }


}
