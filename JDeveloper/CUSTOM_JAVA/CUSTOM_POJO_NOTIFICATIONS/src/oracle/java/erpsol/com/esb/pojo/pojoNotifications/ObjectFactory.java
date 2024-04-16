//
// Este archivo ha sido generado por la arquitectura JavaTM para la implantación de la referencia de enlace (JAXB) XML v2.2.8-b130911.1802 
// Visite <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Todas las modificaciones realizadas en este archivo se perderán si se vuelve a compilar el esquema de origen. 
// Generado el: 2020.05.29 a las 05:20:58 PM CDT 
//


package oracle.java.erpsol.com.esb.pojo.pojoNotifications;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.erpsol.xmlns.core.esb.bss.custom.notificationsmanager.v1 package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {


    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.erpsol.xmlns.core.esb.bss.custom.notificationsmanager.v1
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link NotificationTransactionsRequest }
     * 
     */
    public NotificationTransactionsRequest createNotificationTransactionsRequest() {
        return new NotificationTransactionsRequest();
    }

    /**
     * Create an instance of {@link NotificationTransactionsRequest.Transactions }
     * 
     */
    public NotificationTransactionsRequest.Transactions createNotificationTransactionsRequestTransactions() {
        return new NotificationTransactionsRequest.Transactions();
    }

    /**
     * Create an instance of {@link NotificationTransactionsRequest.Transactions.Transaction }
     * 
     */
    public NotificationTransactionsRequest.Transactions.Transaction createNotificationTransactionsRequestTransactionsTransaction() {
        return new NotificationTransactionsRequest.Transactions.Transaction();
    }

    /**
     * Create an instance of {@link NotificationTransactionsRequest.Transactions.Transaction.Attached }
     * 
     */
    public NotificationTransactionsRequest.Transactions.Transaction.Attached createNotificationTransactionsRequestTransactionsTransactionAttached() {
        return new NotificationTransactionsRequest.Transactions.Transaction.Attached();
    }

    /**
     * Create an instance of {@link NotificationTransactionsRequest.Details }
     * 
     */
    public NotificationTransactionsRequest.Details createNotificationTransactionsRequestDetails() {
        return new NotificationTransactionsRequest.Details();
    }

    /**
     * Create an instance of {@link NotificationTransactionsRequest.Transactions.Transaction.Attached.Attachments }
     * 
     */
    public NotificationTransactionsRequest.Transactions.Transaction.Attached.Attachments createNotificationTransactionsRequestTransactionsTransactionAttachedAttachments() {
        return new NotificationTransactionsRequest.Transactions.Transaction.Attached.Attachments();
    }

}
