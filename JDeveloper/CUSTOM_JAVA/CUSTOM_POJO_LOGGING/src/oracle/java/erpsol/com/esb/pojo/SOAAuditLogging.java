package oracle.java.erpsol.com.esb.pojo;

import oracle.java.erpsol.com.esb.util.ConfigLogProperties;

import java.io.IOException;

import java.util.Date;
import java.util.logging.FileHandler;
import java.util.logging.Formatter;
import java.util.logging.Handler;
import java.util.logging.Level;
import java.util.logging.LogManager;
import java.util.logging.LogRecord;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class SOAAuditLogging {
    public SOAAuditLogging() {
        super();
    }

    private static final Logger LOGGER = Logger.getLogger("confLogger");
    public static void main(String[] args) {
        Handler fileHandler = null;
        try{
                    fileHandler = new FileHandler("%h/java%u.log", 1024000, 3,true);
                    LOGGER.addHandler(fileHandler);
                    fileHandler.setFormatter(new SimpleFormatter() {
                              private static final String format = "[%1$tF %1$tT] [%2$-7s] %3$s %n";

                              @Override
                              public synchronized String format(LogRecord lr) {
                                  return String.format(format,
                                          new Date(lr.getMillis()),
                                          lr.getLevel().getLocalizedName(),
                                          lr.getMessage()
                                  );
                              }
                          });
                    fileHandler.setLevel(Level.ALL);
                    LOGGER.setLevel(Level.ALL);
                    LOGGER.finest("Finnest message: Logger with SIMPLE FORMATTER");
                }catch(IOException exception){
                    LOGGER.log(Level.SEVERE, "Error occur in FileHandler.", exception);
                }
    }
    
    public static void logWrite (String logName, String level, String msg){
        
        Handler fileHandler = null;
        try{
            ConfigLogProperties prop = new ConfigLogProperties();
            
                    //fileHandler = new FileHandler("%h/java%u.log", 1024000, 3,true);
                    fileHandler = new FileHandler(prop.getPath()+"/"+logName+".log", prop.getMaxFileSize(), prop.getMaxFilesRetained(),true);
                    LOGGER.addHandler(fileHandler);
                    fileHandler.setFormatter(new SimpleFormatter() {
                              private static final String format = "[%1$tF %1$tT] [%2$-7s] %3$s %n";

                              @Override
                              public synchronized String format(LogRecord lr) {
                                  return String.format(format,
                                          new Date(lr.getMillis()),
                                          lr.getLevel().getLocalizedName(),
                                          lr.getMessage()
                                  );
                              }
                          });
                    fileHandler.setLevel(Level.ALL);
                    LOGGER.setLevel(Level.ALL);
                    LOGGER.log(Level.parse(level),msg);
                    fileHandler.flush();
                    fileHandler.close();
                    
                }catch(IOException exception){
                    LOGGER.log(Level.SEVERE, "Error occur in FileHandler.", exception);
                }
    }
    
}
