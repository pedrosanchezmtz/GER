package integra.globalgas.com.esb.ess.util;

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
    private static final String CONNECTION_FACTORY_JNDI_NAME = "jms/globalgas/integra/NotificationConnectionFactory";
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
                        textMessage.setText("<ns1:dpBancomerManagerRequest xmlns:ns1=\"http://integra.globalgas.com/esb/bss/AR/dpBancomerManager/v1/\" xmlns:ns2=\"http://integra.globalgas.com/esb/canonical/InvokeCanonicalModel/v1/\" 	xmlns:ns3=\"http://integra.globalgas.com/esb/data/generic/CommonTypes/v1/\">\n" +
                                            "	<ns2:Payment xmlns:ns4=\"http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2\" xmlns:ns5=\"http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PaymentTerm/V1\" actionCode=\"\">\n" +
                                            "		<ns4:Status>\n" +
                                            "			<ns4:Code listID=\"\" listAgencyID=\"\" listVersionID=\"\"/>\n" +
                                            "		</ns4:Status>\n" + "	</ns2:Payment>\n" +
                                            "</ns1:dpBancomerManagerRequest>");
            
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
