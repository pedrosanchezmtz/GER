package oracle.java.erpsol.com.esb.pojo;

public class Test {
    public Test() {
        super();
    }

    public static void main(String[] args) {
        SOAAuditLogging log;
        try {
            log = SOAAuditLogging.class.newInstance();
            log.logWrite("logName", "INFO", "msg");
        } catch (IllegalAccessException | InstantiationException e) {
        }
        
    }
}
