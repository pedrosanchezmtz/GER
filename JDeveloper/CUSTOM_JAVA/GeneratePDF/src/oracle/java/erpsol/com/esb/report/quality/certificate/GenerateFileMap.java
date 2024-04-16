package oracle.java.erpsol.com.esb.report.quality.certificate;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import java.io.InputStream;

import java.io.Serializable;

import java.util.Base64;
import java.util.Properties;

import javax.jws.WebParam;
import javax.xml.bind.JAXBException;

import oracle.java.erpsol.com.esb.report.utils.ConfProperties;
import oracle.java.erpsol.com.esb.report.utils.GenerateMapCSV;

public class GenerateFileMap{
    private String jasperPath;
    private String csvPath;

    public GenerateFileMap(String nameCSV, String xmlString) throws JAXBException {

    ConfProperties properties=new ConfProperties();                           
   csvPath= properties.getProp().getProperty("ws.esb.jasper.csv.path");
                         
             String l=File.separator;
            String rutaCSVCrear=csvPath+l+nameCSV+".csv";
		
	    // definimos la ruta del archivo xml a optener la informacion.
        GetData getDataFile = new GetData(xmlString);
	    Object dataClase = getDataFile.GenerateFromString();
		
		//esta clase la ocupamos para generar el CSV de mapeo de una clase con datos jasper
                GenerateMapCSV generateMapCSV = new GenerateMapCSV(rutaCSVCrear,dataClase);
  		generateMapCSV.Genarate();
  		generateMapCSV.CreateCSV();
		
		
    }
}
