package oracle.java.erpsol.com.esb.report.quality.certificate;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.io.StringReader;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import oracle.java.erpsol.com.esb.report.quality.certificate.almexqa.GeneratePDFQARequest;



//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

//import org.slf4j.Logger;


//esta clase retorna el objeto con toda la informacion de String(XML) o XML(archivo)
public class GetData {
	///private static final Logger LOGGER = LoggerFactory.getLogger(GeneratePdFfromXmlApplication.class);
//se requiere agregar dinamismo a esta clase para que no se deba definir maulmente la clase a parsear se planea usar java reflect
	File xmlFile;
	String xmlString;
        

	public GetData(String xmlString) {
		super();
		
		
		this.xmlString = new String(xmlString);
		//LOGGER.info("Iniciando obtencion de informacion desde String XML");
		//System.out.println(xmlString);
	}

	public GetData(File xmlFile) {
		super();
		this.xmlFile = xmlFile;
		//LOGGER.info("Iniciando obtencion de informacion desde Archivo XML");
	}

	public Object GenerateFromFile() throws JAXBException {
		// informacion de un archivo
		JAXBContext jaxbContext;

			jaxbContext = JAXBContext.newInstance(GeneratePDFQARequest.class);
			Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
			GeneratePDFQARequest Data = (GeneratePDFQARequest) jaxbUnmarshaller.unmarshal(xmlFile);
			//LOGGER.info("Obtencion de informacion desde Archivo XML Exitosa");
			return Data;

	}

	public Object GenerateFromString() throws JAXBException {
		// informacion de un string
		JAXBContext jaxbContext;

			jaxbContext = JAXBContext.newInstance(GeneratePDFQARequest.class);
			Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
			GeneratePDFQARequest Data = (GeneratePDFQARequest) jaxbUnmarshaller.unmarshal(new StringReader(xmlString));
			//LOGGER.info("Obtencion de informacion desde Archivo XML Exitosa");
			return Data;


	}

}
