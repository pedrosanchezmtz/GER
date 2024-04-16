
package mx.com.estrellaroja.cloud.utilities.impl.types;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each
 * Java content interface and Java element interface
 * generated in the mx.com.estrellaroja.cloud.utilities.impl.types package.
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

    private final static QName _DecompressFileRq_QNAME =
        new QName("http://impl.utilities.cloud.estrellaroja.com.mx/types", "DecompressFileRq");
    private final static QName _DecompressFileRs_QNAME =
        new QName("http://impl.utilities.cloud.estrellaroja.com.mx/types", "DecompressFileRs");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: mx.com.estrellaroja.cloud.utilities.impl.types
     *
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link DecompressFileRqType }
     *
     */
    public DecompressFileRqType createDecompressFileRqType() {
        return new DecompressFileRqType();
    }

    /**
     * Create an instance of {@link DecompressFileRsType }
     *
     */
    public DecompressFileRsType createDecompressFileRsType() {
        return new DecompressFileRsType();
    }

    /**
     * Create an instance of {@link FileToCompressType }
     *
     */
    public FileToCompressType createFileToCompressType() {
        return new FileToCompressType();
    }

    /**
     * Create an instance of {@link FilesToCompressType }
     *
     */
    public FilesToCompressType createFilesToCompressType() {
        return new FilesToCompressType();
    }

    /**
     * Create an instance of {@link AttachmentType }
     *
     */
    public AttachmentType createAttachmentType() {
        return new AttachmentType();
    }

    /**
     * Create an instance of {@link ErrorsType }
     *
     */
    public ErrorsType createErrorsType() {
        return new ErrorsType();
    }

    /**
     * Create an instance of {@link ErrorType }
     *
     */
    public ErrorType createErrorType() {
        return new ErrorType();
    }

    /**
     * Create an instance of {@link BaseRsType }
     *
     */
    public BaseRsType createBaseRsType() {
        return new BaseRsType();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DecompressFileRqType }{@code >}
     *
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link DecompressFileRqType }{@code >}
     */
    @XmlElementDecl(namespace = "http://impl.utilities.cloud.estrellaroja.com.mx/types", name = "DecompressFileRq")
    public JAXBElement<DecompressFileRqType> createDecompressFileRq(DecompressFileRqType value) {
        return new JAXBElement<DecompressFileRqType>(_DecompressFileRq_QNAME, DecompressFileRqType.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DecompressFileRsType }{@code >}
     *
     * @param value
     *     Java instance representing xml element's value.
     * @return
     *     the new instance of {@link JAXBElement }{@code <}{@link DecompressFileRsType }{@code >}
     */
    @XmlElementDecl(namespace = "http://impl.utilities.cloud.estrellaroja.com.mx/types", name = "DecompressFileRs")
    public JAXBElement<DecompressFileRsType> createDecompressFileRs(DecompressFileRsType value) {
        return new JAXBElement<DecompressFileRsType>(_DecompressFileRs_QNAME, DecompressFileRsType.class, null, value);
    }

}
