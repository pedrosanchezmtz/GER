package oracle.java.erpsol.com.esb.report.quality.certificate;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.xml.ws.BindingType;
import javax.xml.ws.soap.SOAPBinding;
import oracle.java.erpsol.com.esb.report.quality.certificate.almexqa.GeneratePDFQARequest;
import oracle.java.erpsol.com.esb.report.quality.certificate.almexqa.GeneratePDFQAResponse;
import oracle.java.erpsol.com.esb.report.quality.certificate.almexqa.GeneratePDFQAResponse.Details;
import oracle.java.erpsol.com.esb.report.utils.ConfProperties;
import oracle.java.erpsol.com.esb.report.utils.GenerateData;
import oracle.java.erpsol.com.esb.report.utils.GenerateParameters;
import oracle.java.erpsol.com.esb.report.utils.ProcessJasper;

@WebService
@BindingType(SOAPBinding.SOAP12HTTP_BINDING)
public class GeneratePDF {
  
  
    private String jasperPath;
    private String csvPath;

    @WebMethod
    public GeneratePDFQAResponse GeneratePDFQA(@WebParam(name = "generatePDFQARequest") GeneratePDFQARequest generatePDFQARequest) {

        ConfProperties properties=new ConfProperties();
        jasperPath= properties.getProp().getProperty("ws.esb.jasper.bin.path");
        csvPath= properties.getProp().getProperty("ws.esb.jasper.csv.path");
                
      GeneratePDFQAResponse generatePDFQAResponse=new GeneratePDFQAResponse();
      generatePDFQAResponse.setDetails(new Details());
      
		String l=File.separator;
		String rutaJasper = jasperPath+l+generatePDFQARequest.getNameFormat()+ ".jasper";
		String rutaCSV = csvPath+l+generatePDFQARequest.getNameFormat()+ ".csv";
		
		
try {
		// generamos un Map con los datos que ob tenemos del xml
		Map<String, Object> parameters = new HashMap<String, Object>();
		GenerateData generateData = new GenerateData(generatePDFQARequest, parameters);
		generateData.Genarate();

		
		// generamos el map con el CSV de mapeo y el map de datos del xml
		GenerateParameters generateParameters = new GenerateParameters(parameters, rutaCSV);
		Map<String, Object> parametros = new HashMap<String, Object>();
		parametros = generateParameters.Generate();


		// ejecutamos el reporte le enviamos los parametros y el reporte para generar el pdf. 
		ProcessJasper generatePDF = new ProcessJasper(parametros, rutaJasper);
		
		
			generatePDFQAResponse.setPdfBase64(generatePDF.GenerateBase64());
			generatePDFQAResponse.getDetails().setStatus("SUCCESS");
			generatePDFQAResponse.getDetails().setMessage("PDF "+generatePDFQARequest.getNameFormat()+" Generate SUCCESS"); 
			//System.out.println ("SUCCESS");
		    return generatePDFQAResponse;
		} catch (Exception e) {
	       ///generatePDFQAResponse.setPdfBase64(generatePDF.GenerateBase64());
			
			generatePDFQAResponse.getDetails().setStatus("ERROR");
			generatePDFQAResponse.getDetails().setMessage("Error Generate PDF: "+e.getMessage()); 
		    return generatePDFQAResponse;
		}
       
		
	
    }


}