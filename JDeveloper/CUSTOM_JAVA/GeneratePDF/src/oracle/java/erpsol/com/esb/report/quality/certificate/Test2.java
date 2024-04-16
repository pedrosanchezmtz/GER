package oracle.java.erpsol.com.esb.report.quality.certificate;

import java.io.BufferedReader;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import javax.xml.bind.JAXBException;

import oracle.java.erpsol.com.esb.report.quality.certificate.almexqa.GeneratePDFQARequest;
import oracle.java.erpsol.com.esb.report.quality.certificate.almexqa.GeneratePDFQAResponse;


public class Test2 {
    public Test2() {
    	try {
      //  String xmlStringStandard ="";

        String xmlStringJoseCuervo =getStringFile("resources/pruebas/pruebaCuervo.xml");               
			   

        GetData getDataStringJC = new GetData(xmlStringJoseCuervo);
        Object dataJC;
				dataJC = getDataStringJC.GenerateFromString();

        GeneratePDFQAResponse generatePDFQAResponse;
        GeneratePDF generatePDF = new GeneratePDF();

        //generamos data de String
        generatePDFQAResponse = generatePDF.GeneratePDFQA((GeneratePDFQARequest) dataJC);
     /*
        System.out.println("");
       // System.out.println(generatePDFQAResponse.getPdfBase64());
        System.out.println(generatePDFQAResponse.getDetails().getStatus());
        System.out.println(generatePDFQAResponse.getDetails().getMessage());
        System.out.println("");
*/
        /*

        String nombreCSVMap = "certificadoQA_cuervo";
        //generamos el archvo csv con el mapeo de los campos
        // definimos la ruta del archivo xml a optener la informacion.
        GetData getDataFile = new GetData(xmlStringJoseCuervo);
        Object clase = getDataFile.GenerateFromString();
        GeneratePDFQARequest dataClase=(GeneratePDFQARequest)clase;
        GenerateMapCSV generateMapCSV = new GenerateMapCSV(nombreCSVMap, clase);
        generateMapCSV.Genarate();
        generateMapCSV.CreateCSV();
    */
			} catch (JAXBException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			} catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }
    //obtine string de una ruta de archivo 
    public String getStringFile(String rutaFile) throws FileNotFoundException, IOException {
        String stringFile="";
            FileReader f;
            f = new FileReader(rutaFile);       
            BufferedReader b = new BufferedReader(f);
            String line;
            while((line=b.readLine())!=null) {
                    stringFile=stringFile+line+"\n";
                }
            
            
                b.close();
                f.close();
            return stringFile;
    }
    //creo o sobreescribe un archivo con un String
    public boolean setStringFile(String stringWrirte ,String rutaFile) throws IOException {
        boolean statusSend=false;
        File archivoSalida = new File(rutaFile);
        BufferedWriter bw;
        if (archivoSalida.exists()) {
            try {
                bw = new BufferedWriter(new FileWriter(archivoSalida));
                bw.write(stringWrirte);
                bw.close();
            } catch (IOException e) {
                throw new IOException("Error Reprocess archivo"+rutaFile+e.getMessage());
            }
           
            
        } else {
            try {
                bw = new BufferedWriter(new FileWriter(archivoSalida));
                bw.write(stringWrirte);
                bw.close();
            } catch (IOException e) {
                throw new IOException("Error Creating archivo"+rutaFile+e.getMessage());
            }
           
        }
        
        
        
        return statusSend;
    }

    public static void main(String[] args){

        Test2 test = new Test2();
        

    }
}
