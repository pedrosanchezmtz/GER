package oracle.java.erpsol.com.esb.pojo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class TestConcurManager {

	   public static void main(String[] args) {
        try {
        	long inicio = System.currentTimeMillis();
            TestConcurManager test = new TestConcurManager();
            String xml = test.getStringFile("resources\\extract_CES_SAE_v3_p0052795qeax_20200818171348.xml");
            String[] arraXML = xml.split("<AbstractConcur>");
            xml = "<AbstractConcur xmlns=\"http://xmlns.erpsol.com/core/esb/bss/custom/concur/v1/\" >" + arraXML[1];

            ConcurManager concurM = new ConcurManager();
            String xmlSalida=concurM.createOrderedDataConcur(xml,"pruebalog");

            test.setStringFile(xmlSalida,"resources/Agrupado-extract_CES_SAE_v3_p0052795qeax_20200818171348.xml");
            
            
            long fin = System.currentTimeMillis();
            double tiempo = (double) ((fin - inicio)/1000);         
            System.out.println(tiempo +" segundos");
          //  System.out.println(xmlSalida);

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }catch (ArrayIndexOutOfBoundsException e) {
            System.out.println(e.getClass());
        }
    }
    //obtine string de una ruta de archivo
    public String getStringFile(String rutaFile) throws FileNotFoundException, IOException {
        String stringFile = "";
        FileReader f;
        f = new FileReader(rutaFile);
        BufferedReader b = new BufferedReader(f);
        String line;
        while ((line = b.readLine()) != null) {
            stringFile = stringFile + line + "\n";
        }
        b.close();
        return stringFile;
    }
    //creo o sobreescribe un archivo con un String
    public boolean setStringFile(String stringWrirte, String rutaFile) throws IOException {
        boolean statusSend = false;
        File archivoSalida = new File(rutaFile);
        BufferedWriter bw;
        if (archivoSalida.exists()) {
            try {
                bw = new BufferedWriter(new FileWriter(archivoSalida));
                bw.write(stringWrirte);
                bw.close();
            } catch (IOException e) {
                throw new IOException("Error Reprocess archivo" + rutaFile + e.getMessage());
            }
        } else {
            try {
                bw = new BufferedWriter(new FileWriter(archivoSalida));
                bw.write(stringWrirte);
                bw.close();
            } catch (IOException e) {
                throw new IOException("Error Creating archivo" + rutaFile + e.getMessage());
            }
        }
        return statusSend;
    }
}
