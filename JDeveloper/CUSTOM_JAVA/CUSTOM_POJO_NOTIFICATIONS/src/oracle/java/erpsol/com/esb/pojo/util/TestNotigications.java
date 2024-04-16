package oracle.java.erpsol.com.esb.pojo.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import oracle.java.erpsol.com.esb.pojo.GroupNotifications;

public class TestNotigications {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        for(int i = 0;i<10;i++){
        TestNotigications test= new TestNotigications();
        String xmlString;
        try {
            xmlString = test.getStringFile("src\\oracle\\java\\erpsol\\com\\esb\\pojo\\resources\\pruebas\\prueba.xml");
            // clase que realiza el agrupamiento apartir de un objeto notificationsRequest
            //y reporta un objeto igual pero agrupado
            GroupNotifications generateTransactions = new GroupNotifications();
            
            test.setStringFile(generateTransactions.GroupNotifications(xmlString),
                               "src\\oracle\\java\\erpsol\\com\\esb\\pojo\\resources\\pruebas\\pruebaOut.xml");            
        } catch (FileNotFoundException e) {
        } catch (IOException e) {
        }}
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
