
package mx.com.estrellaroja.soa.estrellarojacommons;

import javax.xml.bind.annotation.XmlRegistry;

import mx.com.estrellaroja.soa.recordunitmterics.UserInformationType;


/**
 * This object contains factory methods for each
 * Java content interface and Java element interface
 * generated in the mx.com.estrellaroja.soa.estrellarojacommons package.
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
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: mx.com.estrellaroja.soa.estrellarojacommons
     *
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link BaseRsType }
     *
     */
    public BaseRsType createBaseRsType() {
        return new BaseRsType();
    }

    /**
     * Create an instance of {@link SuccessType }
     *
     */
    public SuccessType createSuccessType() {
        return new SuccessType();
    }

    /**
     * Create an instance of {@link ErrorsType }
     *
     */
    public ErrorsType createErrorsType() {
        return new ErrorsType();
    }

    /**
     * Create an instance of {@link MetadataType }
     *
     */
    public MetadataType createMetadataType() {
        return new MetadataType();
    }

    /**
     * Create an instance of {@link UserInformationType}
     *
     */
    public UserInformationType createUserInformationType() {
        return new UserInformationType();
    }

    /**
     * Create an instance of {@link EmptyType }
     *
     */
    public EmptyType createEmptyType() {
        return new EmptyType();
    }

    /**
     * Create an instance of {@link ErrorType }
     *
     */
    public ErrorType createErrorType() {
        return new ErrorType();
    }

    /**
     * Create an instance of {@link CallerSystemType }
     *
     */
    public CallerSystemType createCallerSystemType() {
        return new CallerSystemType();
    }

    /**
     * Create an instance of {@link EnvironmentType }
     *
     */
    public EnvironmentType createEnvironmentType() {
        return new EnvironmentType();
    }

    /**
     * Create an instance of {@link AdditionalInformationType }
     *
     */
    public AdditionalInformationType createAdditionalInformationType() {
        return new AdditionalInformationType();
    }

}
