
package oracle.java.erpsol.com.esb.rest.client;

import java.net.URI;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Generated;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;

import javax.net.ssl.SSLSession;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.Configurable;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;

@Generated(value =
           { "wadl|https-options://129.213.123.22/esb/prs/rest/getReportServiceManager/getReportService",
             "run|4cf1137e-dad0-4fed-ac8b-5c83c180b1e0" }, comments = "wadl2java, http://wadl.java.net",
           date = "2020-02-25T17:36:54.543-06:00")
public class EsbPrsRestGetReportServiceManager {

    /**
     * The base URI for the resource represented by this proxy
     *
     */
    public final static URI BASE_URI;
    
    static {
      HttpsURLConnection.setDefaultHostnameVerifier(new HostnameVerifier() {
        public boolean verify(String hostname, SSLSession session) {
          if (hostname.equals("129.213.123.22")) {
            return true;
          }
          return false;
        }
      });
    }

    static {
        URI originalURI = URI.create("https://129.213.123.22:443/esb/prs/rest/getReportServiceManager/");
     //   URI originalURI = URI.create("http://localhost:9073/esb/prs/rest/getReportServiceManager/");
        // Look up to see if we have any indirection in the local copy
        // of META-INF/java-rs-catalog.xml file, assuming it will be in the
        // oasis:name:tc:entity:xmlns:xml:catalog namespace or similar duck type
        java.io.InputStream is =
            EsbPrsRestGetReportServiceManager.class.getResourceAsStream("/META-INF/jax-rs-catalog.xml");
        if (is != null) {
            try {
                // Ignore the namespace in the catalog, can't use wildcard until
                // we are sure we have XPath 2.0
                String found =
                    javax.xml
                                    .xpath
                                    .XPathFactory
                                    .newInstance()
                                    .newXPath()
                                    .evaluate("/*[name(.) = 'catalog']/*[name(.) = 'uri' and @name ='" + originalURI +
                                              "']/@uri", new org.xml.sax.InputSource(is));
                if (found != null && found.length() > 0) {
                    originalURI = java.net
                                      .URI
                                      .create(found);
                }

            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                try {
                    is.close();
                } catch (java.io.IOException e) {
                }
            }
        }
        BASE_URI = originalURI;
    }

    public static EsbPrsRestGetReportServiceManager.GetReportService getReportService(Client client,
                                                                                                    URI baseURI) {
        return new EsbPrsRestGetReportServiceManager.GetReportService(client, baseURI);
    }

    /**
     * Template method to allow tooling to customize the new Client
     *
     */
    private static void customizeClientConfiguration(Configurable cc) {
    }

    /**
     * Template method to allow tooling to override Client factory
     *
     */
    private static Client createClientInstance() {
        return ClientBuilder.newClient();
    }

    /**
     * Create a new Client instance
     *
     */
    public static Client createClient() {
        Client client = createClientInstance();
        customizeClientConfiguration(client);
        return client;
    }

    public static EsbPrsRestGetReportServiceManager.GetReportService getReportService() {
        return getReportService(createClient(), BASE_URI);
    }

    public static EsbPrsRestGetReportServiceManager.GetReportService getReportService(Client client) {
        return getReportService(client, BASE_URI);
    }

    public static class GetReportService {

        private Client _client;
        private UriBuilder _uriBuilder;
        private Map<String, Object> _templateAndMatrixParameterValues;

        private GetReportService(Client client, UriBuilder uriBuilder, Map<String, Object> map) {
            _client = client;
            _uriBuilder = uriBuilder.clone();
            _templateAndMatrixParameterValues = map;
        }

        /**
         * Create new instance using existing Client instance, and a base URI and any parameters
         *
         */
        public GetReportService(Client client, URI baseUri) {
            _client = client;
            _uriBuilder = UriBuilder.fromUri(baseUri);
            _uriBuilder = _uriBuilder.path("getReportService");
            _templateAndMatrixParameterValues = new HashMap<String, Object>();
        }

        public <T> T postJson(Object input, GenericType<T> returnType) {
            UriBuilder localUriBuilder = _uriBuilder.clone();
            WebTarget resource = _client.target(localUriBuilder.buildFromMap(_templateAndMatrixParameterValues));
            javax.ws.rs.client.Invocation.Builder resourceBuilder = resource.request();
            Response response;
            response = resourceBuilder.build("POST", Entity.entity(input, "application/json")).invoke();
            if (response.getStatus() >= 400) {
                throw new EsbPrsRestGetReportServiceManager.WebApplicationExceptionMessage(response);
            }
            return response.readEntity(returnType);
        }

        public <T> T postJson(Object input, Class<T> returnType) {
            UriBuilder localUriBuilder = _uriBuilder.clone();
            WebTarget resource = _client.target(localUriBuilder.buildFromMap(_templateAndMatrixParameterValues));
            javax.ws.rs.client.Invocation.Builder resourceBuilder = resource.request();
            Response response;
            response = resourceBuilder.build("POST", Entity.entity(input, "application/json")).invoke();
            if (!Response.class.isAssignableFrom(returnType)) {
                if (response.getStatus() >= 400) {
                    throw new EsbPrsRestGetReportServiceManager.WebApplicationExceptionMessage(response);
                }
            }
            if (!Response.class.isAssignableFrom(returnType)) {
                return response.readEntity(returnType);
            } else {
                return returnType.cast(response);
            }
        }

    }


    /**
     * Workaround for JAX_RS_SPEC-312
     *
     */
    private static class WebApplicationExceptionMessage extends WebApplicationException {


        private WebApplicationExceptionMessage(Response response) {
            super(response);
        }

        /**
         * Workaround for JAX_RS_SPEC-312
         *
         */
        public String getMessage() {
            Response response = getResponse();
            Response.Status status = Response.Status.fromStatusCode(response.getStatus());
            if (status != null) {
                return (response.getStatus() + (" " + status.getReasonPhrase()));
            } else {
                return Integer.toString(response.getStatus());
            }
        }

        public String toString() {
            String s = "javax.ws.rs.WebApplicationException";
            String message = getLocalizedMessage();
            return (s + (": " + message));
        }

    }

}
