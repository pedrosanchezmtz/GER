
package mx.com.estrellaroja.soa.recordunitmterics;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

import mx.com.estrellaroja.soa.estrellarojacommons.BaseRsType;


/**
 * <p>Java class for anonymous complex type.
 *
 * <p>The following schema fragment specifies the expected content contained within this class.
 *
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;extension base="{http://soa.estrellaroja.com.mx/EstrellaRojaCommons}BaseRsType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="ROW" type="{http://soa.estrellaroja.com.mx/RecordUnitMterics}DatesType" maxOccurs="unbounded" minOccurs="0"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/extension&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 *
 *
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "row" })
@XmlRootElement(name = "DATES")
public class DATES extends BaseRsType {

    @XmlElement(name = "ROW")
    protected List<DatesType> row;

    /**
     * Gets the value of the row property.
     *
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the row property.
     *
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getROW().add(newItem);
     * </pre>
     *
     *
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link DatesType }
     *
     *
     */
    public List<DatesType> getROW() {
        if (row == null) {
            row = new ArrayList<DatesType>();
        }
        return this.row;
    }

}
