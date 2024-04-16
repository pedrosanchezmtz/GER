
package mx.com.estrellaroja.cloud.utilities.impl.types;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for AttachmentType complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType name="AttachmentType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="AttachmentType" type="{http://www.w3.org/2001/XMLSchema}string"/&gt;
 *         &lt;element name="AttachmentContent" type="{http://www.w3.org/2001/XMLSchema}base64Binary"/&gt;
 *         &lt;element name="FileName" type="{http://www.w3.org/2001/XMLSchema}string"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "AttachmentType", propOrder = { "attachmentType", "attachmentContent", "fileName" })
public class AttachmentType {

    @XmlElement(name = "AttachmentType", required = true)
    protected String attachmentType;
    @XmlElement(name = "AttachmentContent", required = true)
    protected byte[] attachmentContent;
    @XmlElement(name = "FileName", required = true)
    protected String fileName;

    /**
     * Gets the value of the attachmentType property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getAttachmentType() {
        return attachmentType;
    }

    /**
     * Sets the value of the attachmentType property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setAttachmentType(String value) {
        this.attachmentType = value;
    }

    /**
     * Gets the value of the attachmentContent property.
     *
     * @return
     *     possible object is
     *     byte[]
     */
    public byte[] getAttachmentContent() {
        return attachmentContent;
    }

    /**
     * Sets the value of the attachmentContent property.
     *
     * @param value
     *     allowed object is
     *     byte[]
     */
    public void setAttachmentContent(byte[] value) {
        this.attachmentContent = value;
    }

    /**
     * Gets the value of the fileName property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getFileName() {
        return fileName;
    }

    /**
     * Sets the value of the fileName property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setFileName(String value) {
        this.fileName = value;
    }

}
