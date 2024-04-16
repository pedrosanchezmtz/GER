package oracle.java.erpsol.com.esb.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigLogProperties {

    private String path;
    private int maxFileSize;
    private int maxFilesRetained;

    private Properties prop;
    private InputStream input;

    public ConfigLogProperties() {
        prop = new Properties();

        try {

           input = new FileInputStream(System.getProperty("custom.props.esb"));
          // input = new FileInputStream(System.getProperty("C:/Users/marti/Desktop"));
            prop.load(input);
            this.path = prop.getProperty("pojo.esb.logging.path");
            this.maxFileSize = Integer.parseInt(prop.getProperty("pojo.esb.logging.maxFileSize"));
            this.maxFilesRetained = Integer.parseInt(prop.getProperty("pojo.esb.logging.maxFilesRetained"));

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

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getMaxFileSize() {
        return maxFileSize;
    }

    public void setMaxFileSize(int maxFileSize) {
        this.maxFileSize = maxFileSize;
    }

    public int getMaxFilesRetained() {
        return maxFilesRetained;
    }

    public void setMaxFilesRetained(int maxFilesRetained) {
        this.maxFilesRetained = maxFilesRetained;
    }
}
