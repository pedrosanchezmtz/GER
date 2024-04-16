
package oracle.java.erpsol.com.esb.report.electronic.billing;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.bind.JAXBException;
import javax.xml.ws.BindingType;
import javax.xml.ws.soap.SOAPBinding;

import net.sf.jasperreports.engine.JRException;
import oracle.java.erpsol.com.esb.report.quality.certificate.GetData;
import oracle.java.erpsol.com.esb.report.utils.GenerateData;
import oracle.java.erpsol.com.esb.report.utils.GenerateMapCSV;
import oracle.java.erpsol.com.esb.report.utils.GenerateParameters;
import oracle.java.erpsol.com.esb.report.utils.ProcessJasper;

public class GeneratePDF {
  
  
    private String jasperPath;
    private String csvPath;
    private Properties prop;
    private InputStream input;



	public GeneratePDF() {
	  super();
	}

	// genera PDF en ruta PDF configurada
        

    public boolean GeneratePDFArchivo(String xmlName,
                                       String logoBase64,
                                     String nameFormat) throws JAXBException {

	    try {
	    String l=File.separator;
	    prop = new Properties();
	    input = new FileInputStream(System.getProperty("custom.props.esb"));
	     //    input = new FileInputStream(System.getProperty("/home/psanchez/Documentos/"));
	    prop.load(input);
	     jasperPath = prop.getProperty("ws.esb.jasper.bin.path");
	     csvPath = prop.getProperty("ws.esb.jasper.csv.path");
	    } catch (IOException ex) {
	        ex.printStackTrace();
	    } finally {
	        if (input != null) {
	            try {
	                input.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
		boolean resultado = false;
		// configuracion de rutaszzzz
		String l=File.separator;
    
		String dir=System.getProperty("user.dir");
		String rutaJasper = jasperPath+l+ nameFormat+".jasper";
               // System.out.println(rutaJasper);
		String rutaCSV = csvPath+l+nameFormat+".csv";
		String rutaXML = dir+l+"resources"+l+"xml"+l+xmlName + ".xml";
		String rutaPDF = dir+l+"resources"+l+"pdf"+l+xmlName + ".pdf";

		// definimos la ruta del archivo xml a optener la informacion.
		File xmlFile = new File(rutaXML);
        GetData getDataFile = new GetData(xmlFile);
		Object dataClase = getDataFile.GenerateFromFile();

		// generamos un Map con los datos que ob tenemos del xml
		Map<String, Object> parameters = new HashMap<String, Object>();
		GenerateData generateData = new GenerateData(dataClase, parameters);
		generateData.Genarate();

		// generamos el map con el CSV de mapeo y el map de datos del xml
		GenerateParameters generateParameters = new GenerateParameters(parameters, rutaCSV);
		Map<String, Object> parametros = new HashMap<String, Object>();
		parametros = generateParameters.Generate();



		// ejecutamos el reporte le enviamos los parametros y reporte para generar el pdf.
		ProcessJasper generatePDF = new ProcessJasper(rutaPDF, parametros, rutaJasper);
		resultado = generatePDF.GenerateArchivo();

		return resultado;

	}

	// genera PDF y retorna Base64
    @WebMethod
    public String GeneratePDFBase64(@WebParam(name = "nameFormat") String nameFormat,@WebParam(name = "logoBase64") String logoBase64,
                                    @WebParam(name = "xmlBase64") String xmlBase64) throws JAXBException, JRException {

        try {
        String l=File.separator;
        prop = new Properties();
        input = new FileInputStream(System.getProperty("custom.props.esb"));
         //    input = new FileInputStream(System.getProperty("/home/psanchez/Documentos/"));
        prop.load(input);
         jasperPath = prop.getProperty("ws.esb.jasper.bin.path");
         csvPath = prop.getProperty("ws.esb.jasper.csv.path");
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
                
                String pdfBase64 = null;
                
		// configuracion de rutas
		String l=File.separator;
		String dir=System.getProperty("user.dir");
	   
		String rutaJasper = jasperPath+l + nameFormat+ ".jasper";
		String rutaCSV = csvPath+l + nameFormat+ ".csv";

		// definimos la ruta del archivo xml a optener la informacion.
              GetData getDataFile = new GetData(xmlBase64);
		Object dataClase = getDataFile.GenerateFromString();

		// generamos un Map con los datos que ob tenemos del xml
		Map<String, Object> parameters = new HashMap<String, Object>();
		GenerateData generateData = new GenerateData(dataClase, parameters);
		generateData.Genarate();

		// generamos el map con el CSV de mapeo y el map de datos del xml
		GenerateParameters generateParameters = new GenerateParameters(parameters, rutaCSV);
		Map<String, Object> parametros = new HashMap<String, Object>();
		parametros = generateParameters.Generate();


		// ejecutamos el reporte le enviamos los parametros y el reporte para generar el pdf.
		ProcessJasper generatePDF = new ProcessJasper(parametros, rutaJasper);
		pdfBase64 = generatePDF.GenerateBase64();

		return pdfBase64;
	
    }

    @WebMethod
    public boolean GenerateFileMap(@WebParam(name = "nameCSV") String nameCSV, @WebParam(name = "xmlBase64") String xmlBase64,
                                   @WebParam(name = "logoBase64") String logoBase64) {
                                       try {
                                       String l=File.separator;
                                       prop = new Properties();
                                       input = new FileInputStream(System.getProperty("custom.props.esb"));
                                        //    input = new FileInputStream(System.getProperty("/home/psanchez/Documentos/"));
                                       prop.load(input);
                                        jasperPath = prop.getProperty("ws.esb.jasper.bin.path");
                                        csvPath = prop.getProperty("ws.esb.jasper.csv.path");
                                       } catch (IOException ex) {
                                           ex.printStackTrace();
                                       } finally {
                                           if (input != null) {
                                               try {
                                                   input.close();
                                               } catch (IOException e) {
                                                   e.printStackTrace();
                                               }
                                           }
                                       }
             String l=File.separator;
		String dir=System.getProperty("user.dir");
                
	  
            String rutaCSVCrear=csvPath+l+nameCSV+".csv";

		//esta clase la ocupamos para generar el CSV de mapeo de una clase con datos jasper
                GenerateMapCSV generateMapCSV = new GenerateMapCSV(rutaCSVCrear,"");
  		generateMapCSV.Genarate();
  		generateMapCSV.CreateCSV();
		
		return false;
                                   }
}