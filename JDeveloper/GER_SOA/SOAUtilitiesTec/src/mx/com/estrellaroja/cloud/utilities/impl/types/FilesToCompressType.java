
package mx.com.estrellaroja.cloud.utilities.impl.types;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for FilesToCompressType complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType name="FilesToCompressType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="FileToCompress" type="{http://impl.utilities.cloud.estrellaroja.com.mx/types}FileToCompressType" maxOccurs="unbounded"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "FilesToCompressType", propOrder = { "fileToCompress" })
public class FilesToCompressType {

    @XmlElement(name = "FileToCompress", required = true)
    protected List<FileToCompressType> fileToCompress;

    /**
     * Gets the value of the fileToCompress property.
     *
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the fileToCompress property.
     *
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getFileToCompress().add(newItem);
     * </pre>
     *
     *
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link FileToCompressType }
     *
     *
     */
    public List<FileToCompressType> getFileToCompress() {
        if (fileToCompress == null) {
            fileToCompress = new ArrayList<FileToCompressType>();
        }
        return this.fileToCompress;
    }

}
