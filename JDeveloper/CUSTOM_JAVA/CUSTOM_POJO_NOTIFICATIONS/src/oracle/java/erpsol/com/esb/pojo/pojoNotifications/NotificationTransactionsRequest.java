//
// Este archivo ha sido generado por la arquitectura JavaTM para la implantación de la referencia de enlace (JAXB) XML v2.2.8-b130911.1802 
// Visite <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Todas las modificaciones realizadas en este archivo se perderán si se vuelve a compilar el esquema de origen. 
// Generado el: 2020.05.29 a las 05:20:58 PM CDT 
//


package oracle.java.erpsol.com.esb.pojo.pojoNotifications;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para anonymous complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="businessName" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="esbFlowId" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="transactions">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;sequence>
 *                   &lt;element name="transaction" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;sequence>
 *                             &lt;element name="subject" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                             &lt;element name="emisor" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                             &lt;element name="receptor" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                             &lt;element name="email" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                             &lt;element name="group" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                             &lt;element name="compressName" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                             &lt;element name="attached">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;sequence>
 *                                       &lt;element name="attachments" maxOccurs="unbounded">
 *                                         &lt;complexType>
 *                                           &lt;complexContent>
 *                                             &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                               &lt;sequence>
 *                                                 &lt;element name="name" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                                                 &lt;element name="contentType" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                                                 &lt;element name="binaryDoc" type="{http://www.w3.org/2001/XMLSchema}base64Binary"/>
 *                                               &lt;/sequence>
 *                                             &lt;/restriction>
 *                                           &lt;/complexContent>
 *                                         &lt;/complexType>
 *                                       &lt;/element>
 *                                     &lt;/sequence>
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                           &lt;/sequence>
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                 &lt;/sequence>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *         &lt;element name="details">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;sequence>
 *                   &lt;element name="status" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                   &lt;element name="message" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *                 &lt;/sequence>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "businessName",
    "esbFlowId",
    "transactions",
    "details"
})
@XmlRootElement(name = "notificationTransactionsRequest")
public class NotificationTransactionsRequest  implements Serializable {

    @XmlElement(required = true)
    protected String businessName;
    @XmlElement(required = true)
    protected String esbFlowId;
    @XmlElement(required = true)
    protected NotificationTransactionsRequest.Transactions transactions;
    @XmlElement(required = true)
    protected NotificationTransactionsRequest.Details details;

    /**
     * Obtiene el valor de la propiedad businessName.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getBusinessName() {
        return businessName;
    }

    /**
     * Define el valor de la propiedad businessName.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setBusinessName(String value) {
        this.businessName = value;
    }

    /**
     * Obtiene el valor de la propiedad esbFlowId.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getEsbFlowId() {
        return esbFlowId;
    }

    /**
     * Define el valor de la propiedad esbFlowId.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEsbFlowId(String value) {
        this.esbFlowId = value;
    }

    /**
     * Obtiene el valor de la propiedad transactions.
     * 
     * @return
     *     possible object is
     *     {@link NotificationTransactionsRequest.Transactions }
     *     
     */
    public NotificationTransactionsRequest.Transactions getTransactions() {
        return transactions;
    }

    /**
     * Define el valor de la propiedad transactions.
     * 
     * @param value
     *     allowed object is
     *     {@link NotificationTransactionsRequest.Transactions }
     *     
     */
    public void setTransactions(NotificationTransactionsRequest.Transactions value) {
        this.transactions = value;
    }

    /**
     * Obtiene el valor de la propiedad details.
     * 
     * @return
     *     possible object is
     *     {@link NotificationTransactionsRequest.Details }
     *     
     */
    public NotificationTransactionsRequest.Details getDetails() {
        return details;
    }

    /**
     * Define el valor de la propiedad details.
     * 
     * @param value
     *     allowed object is
     *     {@link NotificationTransactionsRequest.Details }
     *     
     */
    public void setDetails(NotificationTransactionsRequest.Details value) {
        this.details = value;
    }


    /**
     * <p>Clase Java para anonymous complex type.
     * 
     * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
     * 
     * <pre>
     * &lt;complexType>
     *   &lt;complexContent>
     *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *       &lt;sequence>
     *         &lt;element name="status" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *         &lt;element name="message" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *       &lt;/sequence>
     *     &lt;/restriction>
     *   &lt;/complexContent>
     * &lt;/complexType>
     * </pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "", propOrder = {
        "status",
        "message"
    })
    public static class Details {

        @XmlElement(required = true)
        protected String status;
        @XmlElement(required = true)
        protected String message;

        /**
         * Obtiene el valor de la propiedad status.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getStatus() {
            return status;
        }

        /**
         * Define el valor de la propiedad status.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setStatus(String value) {
            this.status = value;
        }

        /**
         * Obtiene el valor de la propiedad message.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getMessage() {
            return message;
        }

        /**
         * Define el valor de la propiedad message.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setMessage(String value) {
            this.message = value;
        }

    }


    /**
     * <p>Clase Java para anonymous complex type.
     * 
     * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
     * 
     * <pre>
     * &lt;complexType>
     *   &lt;complexContent>
     *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *       &lt;sequence>
     *         &lt;element name="transaction" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;sequence>
     *                   &lt;element name="subject" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                   &lt;element name="emisor" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                   &lt;element name="receptor" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                   &lt;element name="email" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                   &lt;element name="group" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                   &lt;element name="compressName" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                   &lt;element name="attached">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;sequence>
     *                             &lt;element name="attachments" maxOccurs="unbounded">
     *                               &lt;complexType>
     *                                 &lt;complexContent>
     *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                                     &lt;sequence>
     *                                       &lt;element name="name" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                                       &lt;element name="contentType" type="{http://www.w3.org/2001/XMLSchema}string"/>
     *                                       &lt;element name="binaryDoc" type="{http://www.w3.org/2001/XMLSchema}base64Binary"/>
     *                                     &lt;/sequence>
     *                                   &lt;/restriction>
     *                                 &lt;/complexContent>
     *                               &lt;/complexType>
     *                             &lt;/element>
     *                           &lt;/sequence>
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                 &lt;/sequence>
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *       &lt;/sequence>
     *     &lt;/restriction>
     *   &lt;/complexContent>
     * &lt;/complexType>
     * </pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "", propOrder = {
        "transaction"
    })
    public static class Transactions {

        @XmlElement(required = true)
        protected List<NotificationTransactionsRequest.Transactions.Transaction> transaction;

        /**
         * Gets the value of the transaction property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the transaction property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getTransaction().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link NotificationTransactionsRequest.Transactions.Transaction }
         * 
         * 
         */
        public List<NotificationTransactionsRequest.Transactions.Transaction> getTransaction() {
            if (transaction == null) {
                transaction = new ArrayList<NotificationTransactionsRequest.Transactions.Transaction>();
            }
            return this.transaction;
        }


        /**
         * <p>Clase Java para anonymous complex type.
         * 
         * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
         * 
         * <pre>
         * &lt;complexType>
         *   &lt;complexContent>
         *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *       &lt;sequence>
         *         &lt;element name="subject" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *         &lt;element name="emisor" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *         &lt;element name="receptor" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *         &lt;element name="email" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *         &lt;element name="group" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *         &lt;element name="compressName" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *         &lt;element name="attached">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;sequence>
         *                   &lt;element name="attachments" maxOccurs="unbounded">
         *                     &lt;complexType>
         *                       &lt;complexContent>
         *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                           &lt;sequence>
         *                             &lt;element name="name" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *                             &lt;element name="contentType" type="{http://www.w3.org/2001/XMLSchema}string"/>
         *                             &lt;element name="binaryDoc" type="{http://www.w3.org/2001/XMLSchema}base64Binary"/>
         *                           &lt;/sequence>
         *                         &lt;/restriction>
         *                       &lt;/complexContent>
         *                     &lt;/complexType>
         *                   &lt;/element>
         *                 &lt;/sequence>
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *       &lt;/sequence>
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "", propOrder = {
            "subject",
            "emisor",
            "receptor",
            "email",
            "group",
            "compressName",
            "attached"
        })
        public static class Transaction {

            @XmlElement(required = true)
            protected String subject;
            @XmlElement(required = true)
            protected String emisor;
            @XmlElement(required = true)
            protected String receptor;
            @XmlElement(required = true)
            protected String email;
            @XmlElement(required = true)
            protected String group;
            @XmlElement(required = true, defaultValue = "")
            protected String compressName;
            @XmlElement(required = true)
            protected NotificationTransactionsRequest.Transactions.Transaction.Attached attached;

            /**
             * Obtiene el valor de la propiedad subject.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getSubject() {
                return subject;
            }

            /**
             * Define el valor de la propiedad subject.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setSubject(String value) {
                this.subject = value;
            }

            /**
             * Obtiene el valor de la propiedad emisor.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEmisor() {
                return emisor;
            }

            /**
             * Define el valor de la propiedad emisor.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEmisor(String value) {
                this.emisor = value;
            }

            /**
             * Obtiene el valor de la propiedad receptor.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getReceptor() {
                return receptor;
            }

            /**
             * Define el valor de la propiedad receptor.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setReceptor(String value) {
                this.receptor = value;
            }

            /**
             * Obtiene el valor de la propiedad email.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEmail() {
                return email;
            }

            /**
             * Define el valor de la propiedad email.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEmail(String value) {
                this.email = value;
            }

            /**
             * Obtiene el valor de la propiedad group.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getGroup() {
                return group;
            }

            /**
             * Define el valor de la propiedad group.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setGroup(String value) {
                this.group = value;
            }

            /**
             * Obtiene el valor de la propiedad compressName.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getCompressName() {
                return compressName;
            }

            /**
             * Define el valor de la propiedad compressName.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setCompressName(String value) {
                this.compressName = value;
            }

            /**
             * Obtiene el valor de la propiedad attached.
             * 
             * @return
             *     possible object is
             *     {@link NotificationTransactionsRequest.Transactions.Transaction.Attached }
             *     
             */
            public NotificationTransactionsRequest.Transactions.Transaction.Attached getAttached() {
                return attached;
            }

            /**
             * Define el valor de la propiedad attached.
             * 
             * @param value
             *     allowed object is
             *     {@link NotificationTransactionsRequest.Transactions.Transaction.Attached }
             *     
             */
            public void setAttached(NotificationTransactionsRequest.Transactions.Transaction.Attached value) {
                this.attached = value;
            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;sequence>
             *         &lt;element name="attachments" maxOccurs="unbounded">
             *           &lt;complexType>
             *             &lt;complexContent>
             *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *                 &lt;sequence>
             *                   &lt;element name="name" type="{http://www.w3.org/2001/XMLSchema}string"/>
             *                   &lt;element name="contentType" type="{http://www.w3.org/2001/XMLSchema}string"/>
             *                   &lt;element name="binaryDoc" type="{http://www.w3.org/2001/XMLSchema}base64Binary"/>
             *                 &lt;/sequence>
             *               &lt;/restriction>
             *             &lt;/complexContent>
             *           &lt;/complexType>
             *         &lt;/element>
             *       &lt;/sequence>
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "", propOrder = {
                "attachments"
            })
            public static class Attached {

                @XmlElement(required = true)
                protected List<NotificationTransactionsRequest.Transactions.Transaction.Attached.Attachments> attachments;

                /**
                 * Gets the value of the attachments property.
                 * 
                 * <p>
                 * This accessor method returns a reference to the live list,
                 * not a snapshot. Therefore any modification you make to the
                 * returned list will be present inside the JAXB object.
                 * This is why there is not a <CODE>set</CODE> method for the attachments property.
                 * 
                 * <p>
                 * For example, to add a new item, do as follows:
                 * <pre>
                 *    getAttachments().add(newItem);
                 * </pre>
                 * 
                 * 
                 * <p>
                 * Objects of the following type(s) are allowed in the list
                 * {@link NotificationTransactionsRequest.Transactions.Transaction.Attached.Attachments }
                 * 
                 * 
                 */
                public List<NotificationTransactionsRequest.Transactions.Transaction.Attached.Attachments> getAttachments() {
                    if (attachments == null) {
                        attachments = new ArrayList<NotificationTransactionsRequest.Transactions.Transaction.Attached.Attachments>();
                    }
                    return this.attachments;
                }


                /**
                 * <p>Clase Java para anonymous complex type.
                 * 
                 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
                 * 
                 * <pre>
                 * &lt;complexType>
                 *   &lt;complexContent>
                 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
                 *       &lt;sequence>
                 *         &lt;element name="name" type="{http://www.w3.org/2001/XMLSchema}string"/>
                 *         &lt;element name="contentType" type="{http://www.w3.org/2001/XMLSchema}string"/>
                 *         &lt;element name="binaryDoc" type="{http://www.w3.org/2001/XMLSchema}base64Binary"/>
                 *       &lt;/sequence>
                 *     &lt;/restriction>
                 *   &lt;/complexContent>
                 * &lt;/complexType>
                 * </pre>
                 * 
                 * 
                 */
                @XmlAccessorType(XmlAccessType.FIELD)
                @XmlType(name = "", propOrder = {
                    "name",
                    "contentType",
                    "binaryDoc"
                })
                public static class Attachments {

                    @XmlElement(required = true)
                    protected String name;
                    @XmlElement(required = true)
                    protected String contentType;
                    @XmlElement(required = true)
                    protected byte[] binaryDoc;

                    /**
                     * Obtiene el valor de la propiedad name.
                     * 
                     * @return
                     *     possible object is
                     *     {@link String }
                     *     
                     */
                    public String getName() {
                        return name;
                    }

                    /**
                     * Define el valor de la propiedad name.
                     * 
                     * @param value
                     *     allowed object is
                     *     {@link String }
                     *     
                     */
                    public void setName(String value) {
                        this.name = value;
                    }

                    /**
                     * Obtiene el valor de la propiedad contentType.
                     * 
                     * @return
                     *     possible object is
                     *     {@link String }
                     *     
                     */
                    public String getContentType() {
                        return contentType;
                    }

                    /**
                     * Define el valor de la propiedad contentType.
                     * 
                     * @param value
                     *     allowed object is
                     *     {@link String }
                     *     
                     */
                    public void setContentType(String value) {
                        this.contentType = value;
                    }

                    /**
                     * Obtiene el valor de la propiedad binaryDoc.
                     * 
                     * @return
                     *     possible object is
                     *     byte[]
                     */
                    public byte[] getBinaryDoc() {
                        return binaryDoc;
                    }

                    /**
                     * Define el valor de la propiedad binaryDoc.
                     * 
                     * @param value
                     *     allowed object is
                     *     byte[]
                     */
                    public void setBinaryDoc(byte[] value) {
                        this.binaryDoc = value;
                    }

                }

            }

        }

    }

}
