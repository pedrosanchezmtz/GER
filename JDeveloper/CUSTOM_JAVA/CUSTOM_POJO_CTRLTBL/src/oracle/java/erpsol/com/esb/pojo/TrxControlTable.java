package oracle.java.erpsol.com.esb.pojo;


import java.sql.SQLException;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import javax.naming.InitialContext;

public class TrxControlTable
{
    private static InitialContext context;
    private static Connection connection;
    private static CallableStatement cstmt;
    
    public static void main(final String[] args) {
        final TrxControlTable trxControlTable = new TrxControlTable();
        try {
            final String test1 = "";
            final String test2 = "";
            final String test3 = "";
        }
        catch (Exception ex) {}
    }
    
    public static String updateControlTable(final String flowId, final String businessName, final String status, final String description) {
        try {
            TrxControlTable.context = new InitialContext();
            final DataSource dataSource = (DataSource) TrxControlTable.context.lookup("jdbc/almex/fenix/XXALConsolidate");
            TrxControlTable.connection = dataSource.getConnection();
            (TrxControlTable.cstmt =
                 TrxControlTable.connection.prepareCall("BEGIN  XXAL_CONTROL_TABLE_PKG.TRX_CONTRL_TABLE(:1, :2 , :3 ,:4 , :5 , :6);    END; ")).setString(1, flowId);
            TrxControlTable.cstmt.setString(2, businessName);
            TrxControlTable.cstmt.setString(3, status);
            TrxControlTable.cstmt.setString(4, description);
            TrxControlTable.cstmt.registerOutParameter(5, 12);
            TrxControlTable.cstmt.registerOutParameter(6, 12);
            TrxControlTable.cstmt.execute();
            return TrxControlTable.cstmt.getString(6);
        }
        catch (NamingException e) {
            e.printStackTrace();
            return e.getMessage();
        }
        catch (SQLException e2) {
            e2.printStackTrace();
            return e2.getMessage();
        }
        finally {
            try {
                TrxControlTable.context.close();
                TrxControlTable.connection.close();
                TrxControlTable.cstmt.close();
            }
            catch (NamingException e3) {
                e3.printStackTrace();
            }
            catch (SQLException e4) {
                e4.printStackTrace();
            }
        }
    }
    
    static {
        TrxControlTable.context = null;
        TrxControlTable.connection = null;
        TrxControlTable.cstmt = null;
    }
}