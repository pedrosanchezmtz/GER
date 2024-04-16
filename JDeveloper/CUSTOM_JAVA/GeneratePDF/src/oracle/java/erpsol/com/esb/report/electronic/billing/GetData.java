package oracle.java.erpsol.com.esb.report.electronic.billing;

import java.io.File;
import java.io.StringReader;

import java.util.Base64;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import oracle.java.erpsol.com.esb.report.electronic.billing.cfdv33_pagos10_digital.Comprobante;

//import org.slf4j.Logger;


//esta clase retorna el objeto con toda la informacion de String(XML) o XML(archivo)
public class GetData {
	///private static final Logger LOGGER = LoggerFactory.getLogger(GeneratePdFfromXmlApplication.class);
//se requiere agregar dinamismo a esta clase para que no se deba definir maulmente la clase a parsear se planea usar java reflect
	File xmlFile;
	String xmlString;
        

	public GetData(String xmlString) {
		super();
		
		
		this.xmlString = new String(Base64.getDecoder().decode(xmlString));
		//LOGGER.info("Iniciando obtencion de informacion desde String XML");
		//System.out.println(xmlString);
	}

	public GetData(File xmlFile) {
		super();
		this.xmlFile = xmlFile;
		//LOGGER.info("Iniciando obtencion de informacion desde Archivo XML");
	}

	public Object GenerateFromFile() {
		// informacion de un archivo
		JAXBContext jaxbContext;
		try {
			jaxbContext = JAXBContext.newInstance(Comprobante.class);
			Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
			Comprobante Data = (Comprobante) jaxbUnmarshaller.unmarshal(xmlFile);
			//LOGGER.info("Obtencion de informacion desde Archivo XML Exitosa");
			return Data;
		} catch (JAXBException e) {
			e.printStackTrace();
		}

		return null;
	}

	public Object GenerateFromString() {
		// informacion de un string
		JAXBContext jaxbContext;
		try {
			jaxbContext = JAXBContext.newInstance(Comprobante.class);
			Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
			Comprobante Data = (Comprobante) jaxbUnmarshaller.unmarshal(new StringReader(xmlString));
			//LOGGER.info("Obtencion de informacion desde Archivo XML Exitosa");
			return Data;
		} catch (JAXBException e) {
			e.printStackTrace();
		}
		return null;
	}

}
