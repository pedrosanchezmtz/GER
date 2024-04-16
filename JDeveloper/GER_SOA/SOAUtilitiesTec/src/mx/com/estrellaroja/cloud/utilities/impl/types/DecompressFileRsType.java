
package mx.com.estrellaroja.cloud.utilities.impl.types;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for DecompressFileRsType complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType name="DecompressFileRsType"&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{http://impl.utilities.cloud.estrellaroja.com.mx/types}BaseRsType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="Return" type="{http://impl.utilities.cloud.estrellaroja.com.mx/types}AttachmentType" maxOccurs="unbounded"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "DecompressFileRsType", propOrder = { "_return" })
public class DecompressFileRsType extends BaseRsType {

    @XmlElement(name = "Return", required = true)
    protected List<AttachmentType> _return;

    /**
     * Gets the value of the return property.
     *
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the return property.
     *
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getReturn().add(newItem);
     * </pre>
     *
     *
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link AttachmentType }
     *
     *
     */
    public List<AttachmentType> getReturn() {
        if (_return == null) {
            _return = new ArrayList<AttachmentType>();
        }
        return this._return;
    }

}
