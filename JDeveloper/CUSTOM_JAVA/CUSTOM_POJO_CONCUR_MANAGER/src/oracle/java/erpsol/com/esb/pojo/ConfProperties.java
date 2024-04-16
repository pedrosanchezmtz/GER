package oracle.java.erpsol.com.esb.pojo;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import java.io.Serializable;

import java.util.Properties;

public class ConfProperties implements Serializable{

    private Properties prop;
    private InputStream input;
    private String fileProperties="custom.props.esb";
    
    public ConfProperties() throws IOException {
        try {
        prop = new Properties();
        input = new FileInputStream(System.getProperty(fileProperties));
        prop.load(input);
         
        } catch (Throwable ex) {
            ex.printStackTrace();
            throw new IOException("Error Obteniendo Properties: " + fileProperties+" -> " + ex.getMessage());
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    throw new IOException("Error Obteniendo Properties: " + fileProperties);
                }
            }
        }
    }

    public Properties getProp() {
        return prop;
    }
}
