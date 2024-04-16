package oracle.java.erpsol.com.esb.report.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import java.io.Serializable;

import java.util.Properties;

public class ConfProperties {

    private Properties prop;
    private InputStream input;
    
    public ConfProperties() {
        try {
        prop = new Properties();
        input = new FileInputStream(System.getProperty("custom.props.esb"));
        prop.load(input);
         
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
    }

    public Properties getProp() {
        return prop;
    }
}
