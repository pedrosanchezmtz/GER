package oracle.java.erpsol.com.esb.rest.beans;

import java.io.Serializable;

public class ReportServiceResponse implements Serializable{

    @SuppressWarnings("compatibility:-2018465251132302360")
    private static final long serialVersionUID = 1L;

    private String status;
        private String resultData;
  /*  
    public ReportServiceResponse(String status, String resultData) {
        this.status = status;
        this.resultData = resultData;
    }
*/
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getResultData() {
        return resultData;
    }

    public void setResultData(String resultData) {
        this.resultData = resultData;
    }
}
