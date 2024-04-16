
package mx.com.estrellaroja.cloud.utilities.impl.types;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for FileToCompressType complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType name="FileToCompressType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="ContentFile" type="{http://www.w3.org/2001/XMLSchema}base64Binary"/&gt;
 *         &lt;element name="PathFile" type="{http://www.w3.org/2001/XMLSchema}string"/&gt;
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
@XmlType(name = "FileToCompressType", propOrder = { "contentFile", "pathFile", "fileName" })
public class FileToCompressType {

    @XmlElement(name = "ContentFile", required = true)
    protected byte[] contentFile;
    @XmlElement(name = "PathFile", required = true)
    protected String pathFile;
    @XmlElement(name = "FileName", required = true)
    protected String fileName;

    /**
     * Gets the value of the contentFile property.
     *
     * @return
     *     possible object is
     *     byte[]
     */
    public byte[] getContentFile() {
        return contentFile;
    }

    /**
     * Sets the value of the contentFile property.
     *
     * @param value
     *     allowed object is
     *     byte[]
     */
    public void setContentFile(byte[] value) {
        this.contentFile = value;
    }

    /**
     * Gets the value of the pathFile property.
     *
     * @return
     *     possible object is
     *     {@link String }
     *
     */
    public String getPathFile() {
        return pathFile;
    }

    /**
     * Sets the value of the pathFile property.
     *
     * @param value
     *     allowed object is
     *     {@link String }
     *
     */
    public void setPathFile(String value) {
        this.pathFile = value;
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
