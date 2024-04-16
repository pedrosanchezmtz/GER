package integra.globalgas.com.esb.ess.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.Properties;

import org.apache.commons.net.PrintCommandListener;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPConnectionClosedException;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.net.ftp.FTPSClient;

public class ProcessFilesFTPGlobalGas {


    public  String getFilesDP(String bank) throws IOException {
        Properties prop = new Properties();
        InputStream input = new FileInputStream(System.getProperty("custom.props.globalgas"));
        prop.load(input);
        String server = prop.getProperty("ws.esb.ftp.server");
        int port = Integer.parseInt(prop.getProperty("ws.esb.ftp.port"));
        String username = prop.getProperty("ws.esb.ftp.username");
        String password = prop.getProperty("ws.esb.ftp.password");

        String localTmpPath =
            prop.getProperty("ws.esb.ftp.dp." + bank + ".local.path") + "/" +
            new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        ;

        File dir = new File(localTmpPath);
        if (!dir.exists())
            dir.mkdirs();

        String remoteFtpPath = prop.getProperty("ws.esb.ftp.dp." + bank + ".remote.path");

        FTPSClient ftps;
        
        ftps = new FTPSClient(true);
       // ftps.setControlEncoding("ISO-8859-1");
        ftps.addProtocolCommandListener(new PrintCommandListener(new PrintWriter(System.out)));
        try {
            int reply;
            ftps.connect(server, port);
            reply = ftps.getReplyCode();
            if (!FTPReply.isPositiveCompletion(reply)) {
                ftps.disconnect();
                System.out.println("-Error de conexion ");
            }
            ftps.login(username, password);
            ftps.enterLocalPassiveMode();
            ftps.execPBSZ(0);
            ftps.execPROT("P");
          //  ftps.setControlEncoding("ISO-8859-1");   // probar ISO-8859-1
            ftps.setFileType(FTP.BINARY_FILE_TYPE); //probar

            FTPFile[] files = ftps.listFiles(remoteFtpPath);
            for (FTPFile file : files) {

                if (file.getName().endsWith(".txt")) {
                    System.out.println("XML Name: " + file.getName());
                    OutputStream output;
                    output = new FileOutputStream(localTmpPath + "/" + file.getName());
                    ftps.retrieveFile(remoteFtpPath + "/" + file.getName(), output);
                    boolean success =
                        ftps.rename(remoteFtpPath + "/" + file.getName(),
                                    remoteFtpPath + "/" + file.getName() + ".process");
                    if (success) {
                        System.out.println("successfully renamed ");
                    } else {
                        ftps.rename(remoteFtpPath + "/" + file.getName(),
                                    remoteFtpPath + "/" + file.getName() + ".process_" +
                                    new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date()));
                    }
                    output.close();
                } else {
                    System.out.println("No file TXT: " + file.getName());
                }
            }

        } catch (FTPConnectionClosedException e) {
            System.err.println("Server closed connection.");
            e.printStackTrace();
            //  localTmpPath = "ERROR";
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (ftps.isConnected()) {
                try {
                    ftps.logout();
                    ftps.disconnect();
                } catch (IOException f) {
                    // do nothing
                }
            }
        }
        return localTmpPath;
    }

}
