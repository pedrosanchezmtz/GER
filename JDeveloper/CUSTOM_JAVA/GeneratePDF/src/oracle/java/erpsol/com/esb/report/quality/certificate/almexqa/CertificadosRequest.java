//
// Este archivo ha sido generado por la arquitectura JavaTM para la implantación de la referencia de enlace (JAXB) XML v2.2.8-b130911.1802 
// Visite <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Todas las modificaciones realizadas en este archivo se perderán si se vuelve a compilar el esquema de origen. 
// Generado el: 2020.02.28 a las 05:30:10 PM CST 
//


package oracle.java.erpsol.com.esb.report.quality.certificate.almexqa;

import java.io.Serializable;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
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
 *         &lt;element name="certificado" maxOccurs="unbounded">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;sequence>
 *                   &lt;element name="caracteristicasSensoriales" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                   &lt;element name="especificacionesAnaliticas" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                   &lt;element name="metalesPesados" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                   &lt;element name="micotoxinas" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                   &lt;element name="microbiologico" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                   &lt;element name="SelloSeguridad" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;attribute name="sello" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                   &lt;element name="analisisProducto" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;attribute name="parametroEvaluado" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="unidades" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="especificacion" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                   &lt;element name="defectosMayores" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;attribute name="defectosMayores" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="num" type="{http://www.w3.org/2001/XMLSchema}integer" />
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                   &lt;element name="defectosMenores" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;attribute name="defectosMenores" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="num" type="{http://www.w3.org/2001/XMLSchema}integer" />
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                   &lt;element name="defectosCriticos" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;attribute name="defectosCriticos" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                           &lt;attribute name="num" type="{http://www.w3.org/2001/XMLSchema}integer" />
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                 &lt;/sequence>
 *                 &lt;attribute name="folioCertificado" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="presentacion" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="cliente" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="producto" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="sucursal" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="numParteMars" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="fechaCertificado" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="ordenEmbarque" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="equipo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="transportista" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="tanqueCarga" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="plantaProductora" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="inspector" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="descripcion" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="observaciones" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="fechaExpiracion" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="lote" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="fechaElaboracion" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="unidades" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="codigoSAP" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="material" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="folioProvedor" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="tamLote" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="numLoteProveedor" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="estado" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="telefono" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="codigoPostal" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="direccion" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="nombreCompany" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="defMenAQL" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="defMayAQL" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="defCritAQL" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="normAplicProdut" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="msgInicio" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="numEspecificacion" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="numFacturaR" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="codigoProveedor" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="firma" type="{http://www.w3.org/2001/XMLSchema}base64Binary" />
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
    "certificado"
})
@XmlRootElement(name = "certificadosRequest")
public class CertificadosRequest implements Serializable{

    @XmlElement(required = true)
    protected List<CertificadosRequest.Certificado> certificado;

    /**
     * Gets the value of the certificado property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the certificado property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getCertificado().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link CertificadosRequest.Certificado }
     * 
     * 
     */
    public List<CertificadosRequest.Certificado> getCertificado() {
        if (certificado == null) {
            certificado = new ArrayList<CertificadosRequest.Certificado>();
        }
        return this.certificado;
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
     *         &lt;element name="caracteristicasSensoriales" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *         &lt;element name="especificacionesAnaliticas" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *         &lt;element name="metalesPesados" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *         &lt;element name="micotoxinas" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *         &lt;element name="microbiologico" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *         &lt;element name="SelloSeguridad" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;attribute name="sello" type="{http://www.w3.org/2001/XMLSchema}string" />
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *         &lt;element name="analisisProducto" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;attribute name="parametroEvaluado" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="unidades" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="especificacion" type="{http://www.w3.org/2001/XMLSchema}string" />
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *         &lt;element name="defectosMayores" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;attribute name="defectosMayores" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="num" type="{http://www.w3.org/2001/XMLSchema}integer" />
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *         &lt;element name="defectosMenores" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;attribute name="defectosMenores" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="num" type="{http://www.w3.org/2001/XMLSchema}integer" />
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *         &lt;element name="defectosCriticos" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;attribute name="defectosCriticos" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                 &lt;attribute name="num" type="{http://www.w3.org/2001/XMLSchema}integer" />
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *       &lt;/sequence>
     *       &lt;attribute name="folioCertificado" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="presentacion" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="cliente" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="producto" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="sucursal" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="numParteMars" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="fechaCertificado" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="ordenEmbarque" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="equipo" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="transportista" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="tanqueCarga" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="plantaProductora" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="inspector" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="descripcion" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="observaciones" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="fechaExpiracion" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="lote" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="fechaElaboracion" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="unidades" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="codigoSAP" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="material" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="folioProvedor" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="tamLote" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="numLoteProveedor" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="estado" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="telefono" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="codigoPostal" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="direccion" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="nombreCompany" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="defMenAQL" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="defMayAQL" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="defCritAQL" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="normAplicProdut" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="msgInicio" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="numEspecificacion" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="numFacturaR" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="codigoProveedor" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="firma" type="{http://www.w3.org/2001/XMLSchema}base64Binary" />
     *     &lt;/restriction>
     *   &lt;/complexContent>
     * &lt;/complexType>
     * </pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "", propOrder = {
        "caracteristicasSensoriales",
        "especificacionesAnaliticas",
        "metalesPesados",
        "micotoxinas",
        "microbiologico",
        "selloSeguridad",
        "analisisProducto",
        "defectosMayores",
        "defectosMenores",
        "defectosCriticos"
    })
    public static class Certificado {

        @XmlElement(required = true)
        protected List<CertificadosRequest.Certificado.CaracteristicasSensoriales> caracteristicasSensoriales;
        @XmlElement(required = true)
        protected List<CertificadosRequest.Certificado.EspecificacionesAnaliticas> especificacionesAnaliticas;
        @XmlElement(required = true)
        protected List<CertificadosRequest.Certificado.MetalesPesados> metalesPesados;
        @XmlElement(required = true)
        protected List<CertificadosRequest.Certificado.Micotoxinas> micotoxinas;
        @XmlElement(required = true)
        protected List<CertificadosRequest.Certificado.Microbiologico> microbiologico;
        @XmlElement(name = "SelloSeguridad", required = true)
        protected List<CertificadosRequest.Certificado.SelloSeguridad> selloSeguridad;
        @XmlElement(required = true)
        protected List<CertificadosRequest.Certificado.AnalisisProducto> analisisProducto;
        @XmlElement(required = true)
        protected List<CertificadosRequest.Certificado.DefectosMayores> defectosMayores;
        @XmlElement(required = true)
        protected List<CertificadosRequest.Certificado.DefectosMenores> defectosMenores;
        @XmlElement(required = true)
        protected List<CertificadosRequest.Certificado.DefectosCriticos> defectosCriticos;
        @XmlAttribute(name = "folioCertificado")
        protected String folioCertificado;
        @XmlAttribute(name = "presentacion")
        protected String presentacion;
        @XmlAttribute(name = "cliente")
        protected String cliente;
        @XmlAttribute(name = "producto")
        protected String producto;
        @XmlAttribute(name = "sucursal")
        protected String sucursal;
        @XmlAttribute(name = "numParteMars")
        protected String numParteMars;
        @XmlAttribute(name = "fechaCertificado")
        protected String fechaCertificado;
        @XmlAttribute(name = "ordenEmbarque")
        protected String ordenEmbarque;
        @XmlAttribute(name = "equipo")
        protected String equipo;
        @XmlAttribute(name = "transportista")
        protected String transportista;
        @XmlAttribute(name = "tanqueCarga")
        protected String tanqueCarga;
        @XmlAttribute(name = "plantaProductora")
        protected String plantaProductora;
        @XmlAttribute(name = "inspector")
        protected String inspector;
        @XmlAttribute(name = "descripcion")
        protected String descripcion;
        @XmlAttribute(name = "observaciones")
        protected String observaciones;
        @XmlAttribute(name = "fechaExpiracion")
        protected String fechaExpiracion;
        @XmlAttribute(name = "lote")
        protected String lote;
        @XmlAttribute(name = "fechaElaboracion")
        protected String fechaElaboracion;
        @XmlAttribute(name = "unidades")
        protected String unidades;
        @XmlAttribute(name = "codigoSAP")
        protected String codigoSAP;
        @XmlAttribute(name = "material")
        protected String material;
        @XmlAttribute(name = "folioProvedor")
        protected String folioProvedor;
        @XmlAttribute(name = "tamLote")
        protected String tamLote;
        @XmlAttribute(name = "numLoteProveedor")
        protected String numLoteProveedor;
        @XmlAttribute(name = "estado")
        protected String estado;
        @XmlAttribute(name = "telefono")
        protected String telefono;
        @XmlAttribute(name = "codigoPostal")
        protected String codigoPostal;
        @XmlAttribute(name = "direccion")
        protected String direccion;
        @XmlAttribute(name = "nombreCompany")
        protected String nombreCompany;
        @XmlAttribute(name = "defMenAQL")
        protected String defMenAQL;
        @XmlAttribute(name = "defMayAQL")
        protected String defMayAQL;
        @XmlAttribute(name = "defCritAQL")
        protected String defCritAQL;
        @XmlAttribute(name = "normAplicProdut")
        protected String normAplicProdut;
        @XmlAttribute(name = "msgInicio")
        protected String msgInicio;
        @XmlAttribute(name = "numEspecificacion")
        protected String numEspecificacion;
        @XmlAttribute(name = "numFacturaR")
        protected String numFacturaR;
        @XmlAttribute(name = "codigoProveedor")
        protected String codigoProveedor;
        @XmlAttribute(name = "firma")
        protected byte[] firma;

        /**
         * Gets the value of the caracteristicasSensoriales property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the caracteristicasSensoriales property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getCaracteristicasSensoriales().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link CertificadosRequest.Certificado.CaracteristicasSensoriales }
         * 
         * 
         */
        public List<CertificadosRequest.Certificado.CaracteristicasSensoriales> getCaracteristicasSensoriales() {
            if (caracteristicasSensoriales == null) {
                caracteristicasSensoriales = new ArrayList<CertificadosRequest.Certificado.CaracteristicasSensoriales>();
            }
            return this.caracteristicasSensoriales;
        }

        /**
         * Gets the value of the especificacionesAnaliticas property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the especificacionesAnaliticas property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getEspecificacionesAnaliticas().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link CertificadosRequest.Certificado.EspecificacionesAnaliticas }
         * 
         * 
         */
        public List<CertificadosRequest.Certificado.EspecificacionesAnaliticas> getEspecificacionesAnaliticas() {
            if (especificacionesAnaliticas == null) {
                especificacionesAnaliticas = new ArrayList<CertificadosRequest.Certificado.EspecificacionesAnaliticas>();
            }
            return this.especificacionesAnaliticas;
        }

        /**
         * Gets the value of the metalesPesados property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the metalesPesados property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getMetalesPesados().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link CertificadosRequest.Certificado.MetalesPesados }
         * 
         * 
         */
        public List<CertificadosRequest.Certificado.MetalesPesados> getMetalesPesados() {
            if (metalesPesados == null) {
                metalesPesados = new ArrayList<CertificadosRequest.Certificado.MetalesPesados>();
            }
            return this.metalesPesados;
        }

        /**
         * Gets the value of the micotoxinas property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the micotoxinas property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getMicotoxinas().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link CertificadosRequest.Certificado.Micotoxinas }
         * 
         * 
         */
        public List<CertificadosRequest.Certificado.Micotoxinas> getMicotoxinas() {
            if (micotoxinas == null) {
                micotoxinas = new ArrayList<CertificadosRequest.Certificado.Micotoxinas>();
            }
            return this.micotoxinas;
        }

        /**
         * Gets the value of the microbiologico property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the microbiologico property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getMicrobiologico().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link CertificadosRequest.Certificado.Microbiologico }
         * 
         * 
         */
        public List<CertificadosRequest.Certificado.Microbiologico> getMicrobiologico() {
            if (microbiologico == null) {
                microbiologico = new ArrayList<CertificadosRequest.Certificado.Microbiologico>();
            }
            return this.microbiologico;
        }

        /**
         * Gets the value of the selloSeguridad property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the selloSeguridad property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getSelloSeguridad().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link CertificadosRequest.Certificado.SelloSeguridad }
         * 
         * 
         */
        public List<CertificadosRequest.Certificado.SelloSeguridad> getSelloSeguridad() {
            if (selloSeguridad == null) {
                selloSeguridad = new ArrayList<CertificadosRequest.Certificado.SelloSeguridad>();
            }
            return this.selloSeguridad;
        }

        /**
         * Gets the value of the analisisProducto property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the analisisProducto property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getAnalisisProducto().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link CertificadosRequest.Certificado.AnalisisProducto }
         * 
         * 
         */
        public List<CertificadosRequest.Certificado.AnalisisProducto> getAnalisisProducto() {
            if (analisisProducto == null) {
                analisisProducto = new ArrayList<CertificadosRequest.Certificado.AnalisisProducto>();
            }
            return this.analisisProducto;
        }

        /**
         * Gets the value of the defectosMayores property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the defectosMayores property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getDefectosMayores().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link CertificadosRequest.Certificado.DefectosMayores }
         * 
         * 
         */
        public List<CertificadosRequest.Certificado.DefectosMayores> getDefectosMayores() {
            if (defectosMayores == null) {
                defectosMayores = new ArrayList<CertificadosRequest.Certificado.DefectosMayores>();
            }
            return this.defectosMayores;
        }

        /**
         * Gets the value of the defectosMenores property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the defectosMenores property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getDefectosMenores().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link CertificadosRequest.Certificado.DefectosMenores }
         * 
         * 
         */
        public List<CertificadosRequest.Certificado.DefectosMenores> getDefectosMenores() {
            if (defectosMenores == null) {
                defectosMenores = new ArrayList<CertificadosRequest.Certificado.DefectosMenores>();
            }
            return this.defectosMenores;
        }

        /**
         * Gets the value of the defectosCriticos property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the defectosCriticos property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getDefectosCriticos().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link CertificadosRequest.Certificado.DefectosCriticos }
         * 
         * 
         */
        public List<CertificadosRequest.Certificado.DefectosCriticos> getDefectosCriticos() {
            if (defectosCriticos == null) {
                defectosCriticos = new ArrayList<CertificadosRequest.Certificado.DefectosCriticos>();
            }
            return this.defectosCriticos;
        }

        /**
         * Obtiene el valor de la propiedad folioCertificado.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getFolioCertificado() {
            return folioCertificado;
        }

        /**
         * Define el valor de la propiedad folioCertificado.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setFolioCertificado(String value) {
            this.folioCertificado = value;
        }

        /**
         * Obtiene el valor de la propiedad presentacion.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getPresentacion() {
            return presentacion;
        }

        /**
         * Define el valor de la propiedad presentacion.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setPresentacion(String value) {
            this.presentacion = value;
        }

        /**
         * Obtiene el valor de la propiedad cliente.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getCliente() {
            return cliente;
        }

        /**
         * Define el valor de la propiedad cliente.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setCliente(String value) {
            this.cliente = value;
        }

        /**
         * Obtiene el valor de la propiedad producto.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getProducto() {
            return producto;
        }

        /**
         * Define el valor de la propiedad producto.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setProducto(String value) {
            this.producto = value;
        }

        /**
         * Obtiene el valor de la propiedad sucursal.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getSucursal() {
            return sucursal;
        }

        /**
         * Define el valor de la propiedad sucursal.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setSucursal(String value) {
            this.sucursal = value;
        }

        /**
         * Obtiene el valor de la propiedad numParteMars.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getNumParteMars() {
            return numParteMars;
        }

        /**
         * Define el valor de la propiedad numParteMars.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setNumParteMars(String value) {
            this.numParteMars = value;
        }

        /**
         * Obtiene el valor de la propiedad fechaCertificado.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getFechaCertificado() {
            return fechaCertificado;
        }

        /**
         * Define el valor de la propiedad fechaCertificado.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setFechaCertificado(String value) {
            this.fechaCertificado = value;
        }

        /**
         * Obtiene el valor de la propiedad ordenEmbarque.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getOrdenEmbarque() {
            return ordenEmbarque;
        }

        /**
         * Define el valor de la propiedad ordenEmbarque.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setOrdenEmbarque(String value) {
            this.ordenEmbarque = value;
        }

        /**
         * Obtiene el valor de la propiedad equipo.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getEquipo() {
            return equipo;
        }

        /**
         * Define el valor de la propiedad equipo.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setEquipo(String value) {
            this.equipo = value;
        }

        /**
         * Obtiene el valor de la propiedad transportista.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getTransportista() {
            return transportista;
        }

        /**
         * Define el valor de la propiedad transportista.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setTransportista(String value) {
            this.transportista = value;
        }

        /**
         * Obtiene el valor de la propiedad tanqueCarga.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getTanqueCarga() {
            return tanqueCarga;
        }

        /**
         * Define el valor de la propiedad tanqueCarga.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setTanqueCarga(String value) {
            this.tanqueCarga = value;
        }

        /**
         * Obtiene el valor de la propiedad plantaProductora.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getPlantaProductora() {
            return plantaProductora;
        }

        /**
         * Define el valor de la propiedad plantaProductora.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setPlantaProductora(String value) {
            this.plantaProductora = value;
        }

        /**
         * Obtiene el valor de la propiedad inspector.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getInspector() {
            return inspector;
        }

        /**
         * Define el valor de la propiedad inspector.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setInspector(String value) {
            this.inspector = value;
        }

        /**
         * Obtiene el valor de la propiedad descripcion.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getDescripcion() {
            return descripcion;
        }

        /**
         * Define el valor de la propiedad descripcion.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setDescripcion(String value) {
            this.descripcion = value;
        }

        /**
         * Obtiene el valor de la propiedad observaciones.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getObservaciones() {
            return observaciones;
        }

        /**
         * Define el valor de la propiedad observaciones.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setObservaciones(String value) {
            this.observaciones = value;
        }

        /**
         * Obtiene el valor de la propiedad fechaExpiracion.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getFechaExpiracion() {
            return fechaExpiracion;
        }

        /**
         * Define el valor de la propiedad fechaExpiracion.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setFechaExpiracion(String value) {
            this.fechaExpiracion = value;
        }

        /**
         * Obtiene el valor de la propiedad lote.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getLote() {
            return lote;
        }

        /**
         * Define el valor de la propiedad lote.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setLote(String value) {
            this.lote = value;
        }

        /**
         * Obtiene el valor de la propiedad fechaElaboracion.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getFechaElaboracion() {
            return fechaElaboracion;
        }

        /**
         * Define el valor de la propiedad fechaElaboracion.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setFechaElaboracion(String value) {
            this.fechaElaboracion = value;
        }

        /**
         * Obtiene el valor de la propiedad unidades.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getUnidades() {
            return unidades;
        }

        /**
         * Define el valor de la propiedad unidades.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setUnidades(String value) {
            this.unidades = value;
        }

        /**
         * Obtiene el valor de la propiedad codigoSAP.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getCodigoSAP() {
            return codigoSAP;
        }

        /**
         * Define el valor de la propiedad codigoSAP.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setCodigoSAP(String value) {
            this.codigoSAP = value;
        }

        /**
         * Obtiene el valor de la propiedad material.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getMaterial() {
            return material;
        }

        /**
         * Define el valor de la propiedad material.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setMaterial(String value) {
            this.material = value;
        }

        /**
         * Obtiene el valor de la propiedad folioProvedor.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getFolioProvedor() {
            return folioProvedor;
        }

        /**
         * Define el valor de la propiedad folioProvedor.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setFolioProvedor(String value) {
            this.folioProvedor = value;
        }

        /**
         * Obtiene el valor de la propiedad tamLote.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getTamLote() {
            return tamLote;
        }

        /**
         * Define el valor de la propiedad tamLote.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setTamLote(String value) {
            this.tamLote = value;
        }

        /**
         * Obtiene el valor de la propiedad numLoteProveedor.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getNumLoteProveedor() {
            return numLoteProveedor;
        }

        /**
         * Define el valor de la propiedad numLoteProveedor.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setNumLoteProveedor(String value) {
            this.numLoteProveedor = value;
        }

        /**
         * Obtiene el valor de la propiedad estado.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getEstado() {
            return estado;
        }

        /**
         * Define el valor de la propiedad estado.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setEstado(String value) {
            this.estado = value;
        }

        /**
         * Obtiene el valor de la propiedad telefono.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getTelefono() {
            return telefono;
        }

        /**
         * Define el valor de la propiedad telefono.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setTelefono(String value) {
            this.telefono = value;
        }

        /**
         * Obtiene el valor de la propiedad codigoPostal.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getCodigoPostal() {
            return codigoPostal;
        }

        /**
         * Define el valor de la propiedad codigoPostal.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setCodigoPostal(String value) {
            this.codigoPostal = value;
        }

        /**
         * Obtiene el valor de la propiedad direccion.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getDireccion() {
            return direccion;
        }

        /**
         * Define el valor de la propiedad direccion.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setDireccion(String value) {
            this.direccion = value;
        }

        /**
         * Obtiene el valor de la propiedad nombreCompany.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getNombreCompany() {
            return nombreCompany;
        }

        /**
         * Define el valor de la propiedad nombreCompany.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setNombreCompany(String value) {
            this.nombreCompany = value;
        }

        /**
         * Obtiene el valor de la propiedad defMenAQL.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getDefMenAQL() {
            return defMenAQL;
        }

        /**
         * Define el valor de la propiedad defMenAQL.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setDefMenAQL(String value) {
            this.defMenAQL = value;
        }

        /**
         * Obtiene el valor de la propiedad defMayAQL.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getDefMayAQL() {
            return defMayAQL;
        }

        /**
         * Define el valor de la propiedad defMayAQL.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setDefMayAQL(String value) {
            this.defMayAQL = value;
        }

        /**
         * Obtiene el valor de la propiedad defCritAQL.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getDefCritAQL() {
            return defCritAQL;
        }

        /**
         * Define el valor de la propiedad defCritAQL.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setDefCritAQL(String value) {
            this.defCritAQL = value;
        }

        /**
         * Obtiene el valor de la propiedad normAplicProdut.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getNormAplicProdut() {
            return normAplicProdut;
        }

        /**
         * Define el valor de la propiedad normAplicProdut.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setNormAplicProdut(String value) {
            this.normAplicProdut = value;
        }

        /**
         * Obtiene el valor de la propiedad msgInicio.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getMsgInicio() {
            return msgInicio;
        }

        /**
         * Define el valor de la propiedad msgInicio.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setMsgInicio(String value) {
            this.msgInicio = value;
        }

        /**
         * Obtiene el valor de la propiedad numEspecificacion.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getNumEspecificacion() {
            return numEspecificacion;
        }

        /**
         * Define el valor de la propiedad numEspecificacion.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setNumEspecificacion(String value) {
            this.numEspecificacion = value;
        }

        /**
         * Obtiene el valor de la propiedad numFacturaR.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getNumFacturaR() {
            return numFacturaR;
        }

        /**
         * Define el valor de la propiedad numFacturaR.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setNumFacturaR(String value) {
            this.numFacturaR = value;
        }

        /**
         * Obtiene el valor de la propiedad codigoProveedor.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getCodigoProveedor() {
            return codigoProveedor;
        }

        /**
         * Define el valor de la propiedad codigoProveedor.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setCodigoProveedor(String value) {
            this.codigoProveedor = value;
        }

        /**
         * Obtiene el valor de la propiedad firma.
         * 
         * @return
         *     possible object is
         *     byte[]
         */
        public byte[] getFirma() {
            return firma;
        }

        /**
         * Define el valor de la propiedad firma.
         * 
         * @param value
         *     allowed object is
         *     byte[]
         */
        public void setFirma(byte[] value) {
            this.firma = value;
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
         *       &lt;attribute name="parametroEvaluado" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="unidades" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="especificacion" type="{http://www.w3.org/2001/XMLSchema}string" />
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "")
        public static class AnalisisProducto {

            @XmlAttribute(name = "parametroEvaluado")
            protected String parametroEvaluado;
            @XmlAttribute(name = "metodo")
            protected String metodo;
            @XmlAttribute(name = "resultado")
            protected String resultado;
            @XmlAttribute(name = "unidades")
            protected String unidades;
            @XmlAttribute(name = "especificacion")
            protected String especificacion;

            /**
             * Obtiene el valor de la propiedad parametroEvaluado.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getParametroEvaluado() {
                return parametroEvaluado;
            }

            /**
             * Define el valor de la propiedad parametroEvaluado.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setParametroEvaluado(String value) {
                this.parametroEvaluado = value;
            }

            /**
             * Obtiene el valor de la propiedad metodo.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getMetodo() {
                return metodo;
            }

            /**
             * Define el valor de la propiedad metodo.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setMetodo(String value) {
                this.metodo = value;
            }

            /**
             * Obtiene el valor de la propiedad resultado.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getResultado() {
                return resultado;
            }

            /**
             * Define el valor de la propiedad resultado.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setResultado(String value) {
                this.resultado = value;
            }

            /**
             * Obtiene el valor de la propiedad unidades.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getUnidades() {
                return unidades;
            }

            /**
             * Define el valor de la propiedad unidades.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setUnidades(String value) {
                this.unidades = value;
            }

            /**
             * Obtiene el valor de la propiedad especificacion.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEspecificacion() {
                return especificacion;
            }

            /**
             * Define el valor de la propiedad especificacion.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEspecificacion(String value) {
                this.especificacion = value;
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
         *       &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "")
        public static class CaracteristicasSensoriales {

            @XmlAttribute(name = "parametro")
            protected String parametro;
            @XmlAttribute(name = "metodo")
            protected String metodo;
            @XmlAttribute(name = "resultado")
            protected String resultado;
            @XmlAttribute(name = "especificacionMin")
            protected String especificacionMin;
            @XmlAttribute(name = "especificacionMax")
            protected String especificacionMax;

            /**
             * Obtiene el valor de la propiedad parametro.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getParametro() {
                return parametro;
            }

            /**
             * Define el valor de la propiedad parametro.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setParametro(String value) {
                this.parametro = value;
            }

            /**
             * Obtiene el valor de la propiedad metodo.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getMetodo() {
                return metodo;
            }

            /**
             * Define el valor de la propiedad metodo.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setMetodo(String value) {
                this.metodo = value;
            }

            /**
             * Obtiene el valor de la propiedad resultado.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getResultado() {
                return resultado;
            }

            /**
             * Define el valor de la propiedad resultado.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setResultado(String value) {
                this.resultado = value;
            }

            /**
             * Obtiene el valor de la propiedad especificacionMin.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEspecificacionMin() {
                return especificacionMin;
            }

            /**
             * Define el valor de la propiedad especificacionMin.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEspecificacionMin(String value) {
                this.especificacionMin = value;
            }

            /**
             * Obtiene el valor de la propiedad especificacionMax.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEspecificacionMax() {
                return especificacionMax;
            }

            /**
             * Define el valor de la propiedad especificacionMax.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEspecificacionMax(String value) {
                this.especificacionMax = value;
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
         *       &lt;attribute name="defectosCriticos" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="num" type="{http://www.w3.org/2001/XMLSchema}integer" />
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "")
        public static class DefectosCriticos {

            @XmlAttribute(name = "defectosCriticos")
            protected String defectosCriticos;
            @XmlAttribute(name = "num")
            protected BigInteger num;

            /**
             * Obtiene el valor de la propiedad defectosCriticos.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getDefectosCriticos() {
                return defectosCriticos;
            }

            /**
             * Define el valor de la propiedad defectosCriticos.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setDefectosCriticos(String value) {
                this.defectosCriticos = value;
            }

            /**
             * Obtiene el valor de la propiedad num.
             * 
             * @return
             *     possible object is
             *     {@link BigInteger }
             *     
             */
            public BigInteger getNum() {
                return num;
            }

            /**
             * Define el valor de la propiedad num.
             * 
             * @param value
             *     allowed object is
             *     {@link BigInteger }
             *     
             */
            public void setNum(BigInteger value) {
                this.num = value;
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
         *       &lt;attribute name="defectosMayores" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="num" type="{http://www.w3.org/2001/XMLSchema}integer" />
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "")
        public static class DefectosMayores {

            @XmlAttribute(name = "defectosMayores")
            protected String defectosMayores;
            @XmlAttribute(name = "num")
            protected BigInteger num;

            /**
             * Obtiene el valor de la propiedad defectosMayores.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getDefectosMayores() {
                return defectosMayores;
            }

            /**
             * Define el valor de la propiedad defectosMayores.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setDefectosMayores(String value) {
                this.defectosMayores = value;
            }

            /**
             * Obtiene el valor de la propiedad num.
             * 
             * @return
             *     possible object is
             *     {@link BigInteger }
             *     
             */
            public BigInteger getNum() {
                return num;
            }

            /**
             * Define el valor de la propiedad num.
             * 
             * @param value
             *     allowed object is
             *     {@link BigInteger }
             *     
             */
            public void setNum(BigInteger value) {
                this.num = value;
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
         *       &lt;attribute name="defectosMenores" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="num" type="{http://www.w3.org/2001/XMLSchema}integer" />
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "")
        public static class DefectosMenores {

            @XmlAttribute(name = "defectosMenores")
            protected String defectosMenores;
            @XmlAttribute(name = "num")
            protected BigInteger num;

            /**
             * Obtiene el valor de la propiedad defectosMenores.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getDefectosMenores() {
                return defectosMenores;
            }

            /**
             * Define el valor de la propiedad defectosMenores.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setDefectosMenores(String value) {
                this.defectosMenores = value;
            }

            /**
             * Obtiene el valor de la propiedad num.
             * 
             * @return
             *     possible object is
             *     {@link BigInteger }
             *     
             */
            public BigInteger getNum() {
                return num;
            }

            /**
             * Define el valor de la propiedad num.
             * 
             * @param value
             *     allowed object is
             *     {@link BigInteger }
             *     
             */
            public void setNum(BigInteger value) {
                this.num = value;
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
         *       &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "")
        public static class EspecificacionesAnaliticas {

            @XmlAttribute(name = "parametro")
            protected String parametro;
            @XmlAttribute(name = "metodo")
            protected String metodo;
            @XmlAttribute(name = "resultado")
            protected String resultado;
            @XmlAttribute(name = "especificacionMin")
            protected String especificacionMin;
            @XmlAttribute(name = "especificacionMax")
            protected String especificacionMax;

            /**
             * Obtiene el valor de la propiedad parametro.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getParametro() {
                return parametro;
            }

            /**
             * Define el valor de la propiedad parametro.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setParametro(String value) {
                this.parametro = value;
            }

            /**
             * Obtiene el valor de la propiedad metodo.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getMetodo() {
                return metodo;
            }

            /**
             * Define el valor de la propiedad metodo.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setMetodo(String value) {
                this.metodo = value;
            }

            /**
             * Obtiene el valor de la propiedad resultado.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getResultado() {
                return resultado;
            }

            /**
             * Define el valor de la propiedad resultado.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setResultado(String value) {
                this.resultado = value;
            }

            /**
             * Obtiene el valor de la propiedad especificacionMin.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEspecificacionMin() {
                return especificacionMin;
            }

            /**
             * Define el valor de la propiedad especificacionMin.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEspecificacionMin(String value) {
                this.especificacionMin = value;
            }

            /**
             * Obtiene el valor de la propiedad especificacionMax.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEspecificacionMax() {
                return especificacionMax;
            }

            /**
             * Define el valor de la propiedad especificacionMax.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEspecificacionMax(String value) {
                this.especificacionMax = value;
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
         *       &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "")
        public static class MetalesPesados {

            @XmlAttribute(name = "parametro")
            protected String parametro;
            @XmlAttribute(name = "metodo")
            protected String metodo;
            @XmlAttribute(name = "resultado")
            protected String resultado;
            @XmlAttribute(name = "especificacionMin")
            protected String especificacionMin;
            @XmlAttribute(name = "especificacionMax")
            protected String especificacionMax;

            /**
             * Obtiene el valor de la propiedad parametro.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getParametro() {
                return parametro;
            }

            /**
             * Define el valor de la propiedad parametro.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setParametro(String value) {
                this.parametro = value;
            }

            /**
             * Obtiene el valor de la propiedad metodo.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getMetodo() {
                return metodo;
            }

            /**
             * Define el valor de la propiedad metodo.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setMetodo(String value) {
                this.metodo = value;
            }

            /**
             * Obtiene el valor de la propiedad resultado.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getResultado() {
                return resultado;
            }

            /**
             * Define el valor de la propiedad resultado.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setResultado(String value) {
                this.resultado = value;
            }

            /**
             * Obtiene el valor de la propiedad especificacionMin.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEspecificacionMin() {
                return especificacionMin;
            }

            /**
             * Define el valor de la propiedad especificacionMin.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEspecificacionMin(String value) {
                this.especificacionMin = value;
            }

            /**
             * Obtiene el valor de la propiedad especificacionMax.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEspecificacionMax() {
                return especificacionMax;
            }

            /**
             * Define el valor de la propiedad especificacionMax.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEspecificacionMax(String value) {
                this.especificacionMax = value;
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
         *       &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "")
        public static class Micotoxinas {

            @XmlAttribute(name = "parametro")
            protected String parametro;
            @XmlAttribute(name = "metodo")
            protected String metodo;
            @XmlAttribute(name = "resultado")
            protected String resultado;
            @XmlAttribute(name = "especificacionMin")
            protected String especificacionMin;
            @XmlAttribute(name = "especificacionMax")
            protected String especificacionMax;

            /**
             * Obtiene el valor de la propiedad parametro.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getParametro() {
                return parametro;
            }

            /**
             * Define el valor de la propiedad parametro.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setParametro(String value) {
                this.parametro = value;
            }

            /**
             * Obtiene el valor de la propiedad metodo.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getMetodo() {
                return metodo;
            }

            /**
             * Define el valor de la propiedad metodo.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setMetodo(String value) {
                this.metodo = value;
            }

            /**
             * Obtiene el valor de la propiedad resultado.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getResultado() {
                return resultado;
            }

            /**
             * Define el valor de la propiedad resultado.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setResultado(String value) {
                this.resultado = value;
            }

            /**
             * Obtiene el valor de la propiedad especificacionMin.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEspecificacionMin() {
                return especificacionMin;
            }

            /**
             * Define el valor de la propiedad especificacionMin.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEspecificacionMin(String value) {
                this.especificacionMin = value;
            }

            /**
             * Obtiene el valor de la propiedad especificacionMax.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEspecificacionMax() {
                return especificacionMax;
            }

            /**
             * Define el valor de la propiedad especificacionMax.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEspecificacionMax(String value) {
                this.especificacionMax = value;
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
         *       &lt;attribute name="parametro" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="metodo" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="resultado" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="especificacionMin" type="{http://www.w3.org/2001/XMLSchema}string" />
         *       &lt;attribute name="especificacionMax" type="{http://www.w3.org/2001/XMLSchema}string" />
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "")
        public static class Microbiologico {

            @XmlAttribute(name = "parametro")
            protected String parametro;
            @XmlAttribute(name = "metodo")
            protected String metodo;
            @XmlAttribute(name = "resultado")
            protected String resultado;
            @XmlAttribute(name = "especificacionMin")
            protected String especificacionMin;
            @XmlAttribute(name = "especificacionMax")
            protected String especificacionMax;

            /**
             * Obtiene el valor de la propiedad parametro.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getParametro() {
                return parametro;
            }

            /**
             * Define el valor de la propiedad parametro.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setParametro(String value) {
                this.parametro = value;
            }

            /**
             * Obtiene el valor de la propiedad metodo.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getMetodo() {
                return metodo;
            }

            /**
             * Define el valor de la propiedad metodo.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setMetodo(String value) {
                this.metodo = value;
            }

            /**
             * Obtiene el valor de la propiedad resultado.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getResultado() {
                return resultado;
            }

            /**
             * Define el valor de la propiedad resultado.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setResultado(String value) {
                this.resultado = value;
            }

            /**
             * Obtiene el valor de la propiedad especificacionMin.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEspecificacionMin() {
                return especificacionMin;
            }

            /**
             * Define el valor de la propiedad especificacionMin.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEspecificacionMin(String value) {
                this.especificacionMin = value;
            }

            /**
             * Obtiene el valor de la propiedad especificacionMax.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getEspecificacionMax() {
                return especificacionMax;
            }

            /**
             * Define el valor de la propiedad especificacionMax.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setEspecificacionMax(String value) {
                this.especificacionMax = value;
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
         *       &lt;attribute name="sello" type="{http://www.w3.org/2001/XMLSchema}string" />
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "")
        public static class SelloSeguridad {

            @XmlAttribute(name = "sello")
            protected String sello;

            /**
             * Obtiene el valor de la propiedad sello.
             * 
             * @return
             *     possible object is
             *     {@link String }
             *     
             */
            public String getSello() {
                return sello;
            }

            /**
             * Define el valor de la propiedad sello.
             * 
             * @param value
             *     allowed object is
             *     {@link String }
             *     
             */
            public void setSello(String value) {
                this.sello = value;
            }

        }

    }

}
