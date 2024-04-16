package oracle.java.erpsol.com.esb.report.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.Serializable;

import java.util.Base64;
import java.util.Map;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;



///mport org.slf4j.Logger;
//import org.slf4j.LoggerFactory;



public class ProcessJasper {
  //  private static final Logger LOGGER=LoggerFactory.getLogger(GeneratePdFfromXmlApplication.class);
	String rutaPDF;
	String rutaReporte;
	Map<String, Object> parameters;
	
//caso en el que se genera archivo 
	public ProcessJasper(String rutaPDF,Map<String, Object> parameters, String rutaReporte) {
		super();

		this.rutaPDF = rutaPDF;
		this.rutaReporte = rutaReporte;
		this.parameters = parameters;
	}
	//caso en el que se genera Base64
	public ProcessJasper(Map<String, Object> parameters, String rutaReporte) {
		super();
		this.rutaReporte = rutaReporte;
		this.parameters = parameters;
	}

//este metodo recibe los parametros para la generecion del reporte ruta reporte, ruta  pdf y Map de parametros retorna Archivo
	public boolean GenerateArchivo(){
		try {
			//LOGGER.info("Generado Archivo rutaJasper: {} , rutaJasper: {} , parameters: {}",rutaPDF,rutaReporte,parameters);
            String outputFile = rutaPDF;
	        JasperPrint jasperPrint = JasperFillManager.fillReport(rutaReporte, parameters, new JREmptyDataSource());
	        OutputStream outputStream = new FileOutputStream(new File(outputFile));	        
	        JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
			//LOGGER.info("Archivo Generado: {}" , outputFile);
	        return true;
	    } catch (JRException ex) {
	        ex.printStackTrace();
	        return false;
	    } catch (FileNotFoundException ex) {
	        ex.printStackTrace();
	    }
		return false;
		}
	//este metodo recibe los parametros para la generecion del reporte ruta reporte  y Map de parametros retorna Base64
		public String GenerateBase64() throws JRException{

				//	System.out.println("Generado Base64 rutaJasper:"+  parameters+",rutaReporte"+parameters);
					String pdfBase64=null;
			        JasperPrint jasperPrint;
			       // JasperPrint jprint = (JasperPrint) JasperFillManager.fillReport (rutaReporte, parameters, new JREmptyDataSource());
			        jasperPrint = JasperFillManager.fillReport(rutaReporte, parameters, new JREmptyDataSource());
			        
				    //System.out.println("japerprint: "+jasperPrint.toString());
			       pdfBase64=Base64.getEncoder().encodeToString(JasperExportManager.exportReportToPdf(jasperPrint));
                    
			        return pdfBase64;

			}

}
