package oracle.java.erpsol.com.esb.rest.client;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import java.io.InputStream;

import java.util.Properties;

import javax.annotation.Generated;

import javax.ws.rs.client.Client;

import oracle.java.erpsol.com.esb.rest.beans.ReportServiceResponse;

@Generated({ "Oracle JDeveloper", "run|4cf1137e-dad0-4fed-ac8b-5c83c180b1e0" })
public class EsbPrsRestGetReportServiceManagerClient {


    public static void main(String[] args) throws IOException, JsonParseException, JsonMappingException {

        /*
        ReportServiceResponse response;
        ObjectMapper mapper = new ObjectMapper();


        Client client = EsbPrsRestGetReportServiceManager.createClient();

        EsbPrsRestGetReportServiceManager.GetReportService getReportService =
            EsbPrsRestGetReportServiceManager.getReportService(client);

       String s= getReportService.postJson("{\n" +
        "  \"schedulerAudit\" : \"0\",\n" +
        "  \"reportPath\" : \"/Custom/SOA/ALMEX_AP_VALIDA_INVOICES.xdo\",\n" +
        "  \"parameters\" : [ {\n" +
        "    \"labelName\" : \"string\",\n" +
        "    \"labelData\" : \"string\"\n" +
        "  },\n" +
        "  {\n" +
        "    \"labelName\" : \"string\",\n" +
        "    \"labelData\" : \"string\"\n" +
        "  }]\n" +
        "}",String.class );*/

        //  System.out.println("::::::   "+s);
        /*
       response= mapper.readValue(getReportService.postJson("{\n" +
        "  \"schedulerAudit\" : \"0\",\n" +
        "  \"reportPath\" : \"/Custom/SOA/ALMEX_AP_VALIDA_INVOICES.xdo\",\n" +
        "  \"parameters\" : [ {\n" +
        "    \"labelName\" : \"string\",\n" +
        "    \"labelData\" : \"string\"\n" +
        "  },\n" +
        "  {\n" +
        "    \"labelName\" : \"string\",\n" +
        "    \"labelData\" : \"string\"\n" +
        "  }]\n" +
        "}",String.class ) ,ReportServiceResponse.class);

       System.out.println(response.getStatus());
        System.out.println("");
        System.out.println(response.getResultData());
*/

        //    System.out.println(getReport("/Custom/SOA/ALMEX_AP_VALIDA_INVOICES.xdo"));

        System.out.println(getReport("/Custom/SOA/ALMEX_AP_DISPERSION_AMERICA.xdo"));

    }


    public static String getReport(String report) {
        try{
            ReportServiceResponse response;
            ObjectMapper mapper = new ObjectMapper();
            Client client = EsbPrsRestGetReportServiceManager.createClient();
            EsbPrsRestGetReportServiceManager.GetReportService getReportService =  EsbPrsRestGetReportServiceManager.getReportService(client);
    
            String request = "{\n" + "  \"schedulerAudit\" : \"0\",\n" + "  \"reportPath\" : \"" + report + "\"" +
    
                "}";
            
            response = mapper.readValue(getReportService.postJson(request, String.class), ReportServiceResponse.class);
    
            //   System.out.println(response.getStatus());
            System.out.println("");
            //   System.out.println(response.getResultData());
            if (validateReport(response.getResultData()))
                return response.getResultData();
            else
                return "EMPTY";
        }catch (Exception e){
            return "EXCEPTION: " +e.getMessage();
        }
    }


    public static boolean validateReport(String report) throws FileNotFoundException, IOException {

        Properties prop = new Properties();
        InputStream input = new FileInputStream(System.getProperty("custom.props.esb"));
        prop.load(input);
        String labels = prop.getProperty("esb.labels.report");

        //   String labels ="</G_1>|</G_FACTURA>";
        report = report.substring(0, report.indexOf("</DATA_DS>"));
        report = report.substring(report.lastIndexOf("<"), report.length());
        return labels.contains(report.trim());
    }

}
