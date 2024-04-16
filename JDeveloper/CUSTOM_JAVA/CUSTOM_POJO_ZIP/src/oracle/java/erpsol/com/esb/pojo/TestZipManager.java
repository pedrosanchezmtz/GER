package oracle.java.erpsol.com.esb.pojo;


import com.github.junrar.exception.RarException;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import org.apache.xmlbeans.XmlException;

class TestZipManager {
	 
	   public static void main(String[] args) {
    try {
    	long inicio = System.currentTimeMillis();
        /////////////////////////////////////////////////////////////////////
    	TestZipManager test = new TestZipManager();
        String xmlZipsRars = test.getStringFile("resources\\pruebaRarV5.xml");

        ZipManager zipM = new ZipManager();
    /*    String xmlSalidaZip=zipM.GenerateZip(xmlFiles);
        test.setStringFile(xmlSalidaZip,"resources/ResultPruebaZips.xml");
        */
     /*   
        String xmlSalida2=zipM.GetFiles(xmlZip);
       //System.out.println(xmlSalidaZip);
        test.setStringFile(xmlSalida2,"resources/ResultPruebaFiles.xml");*/
        
     test.setStringFile(zipM.UnZipFiles(xmlZipsRars),"resources/resultRarV5.xml");
    // System.out.println(zipM.UnZipFiles(xmlZipsRars));
        
  ///////////////////////////////////////////////////////////////////////////      
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
