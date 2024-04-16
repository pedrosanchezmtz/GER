package oracle.java.erpsol.com.esb.pojo.util;

import java.io.StringReader;
import java.io.StringWriter;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import oracle.java.erpsol.com.esb.pojo.pojoNotifications.NotificationTransactionsRequest;


public class GenerateData {
	//esta clase genera Objeto notificationsRequest apartir de un String XML notificationsRequest
    public NotificationTransactionsRequest GeneratePojoNotifications(String xmlString)
    {
    	JAXBContext jaxbContext;
		try {
			jaxbContext = JAXBContext.newInstance(NotificationTransactionsRequest.class);
			Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
			NotificationTransactionsRequest Data = (NotificationTransactionsRequest) jaxbUnmarshaller.unmarshal(new StringReader(xmlString));
			System.out.println("Obtencion de informacion desde Archivo XML Exitosa");
			return Data;
		} catch (JAXBException e) {
			e.printStackTrace();
		}
		return null;
    }
  //esta clase genera un string XML apartir de un Objeto notificationsRequest
    public String GenerateXMLNotifications(NotificationTransactionsRequest clase) {
    	try {
    		
    	JAXBContext jaxbContext = JAXBContext.newInstance(NotificationTransactionsRequest.class);

    	Marshaller jaxbMarshaller = jaxbContext.createMarshaller();

    	jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
	
    	StringWriter stringWriter = new StringWriter();
			jaxbMarshaller.marshal(clase, stringWriter);
			//System.out.println(stringWriter.toString());
			return stringWriter.toString();
		} catch (JAXBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return null;
    }
}
