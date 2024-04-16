package integra.globalgas.com.esb.ess.util;

import integra.globalgas.com.esb.ess.beans.PaymentsRec;

import java.io.IOException;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Struct;
import java.sql.Types;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.naming.InitialContext;

import javax.naming.NamingException;

import javax.sql.DataSource;

import oracle.jdbc.OracleCallableStatement;

import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import oracle.sql.STRUCT;
import oracle.sql.StructDescriptor;

public class ProcessSchedulerDPPayments {
   
    
   
    public  String generateXMLofErrors(String localTmpPath) {
        
        int existFiles = 0;
        
        String xmlOut =
            "<ns0:cnlPaymentsManagerRequest  xmlns:ns14=\"http://integra.globalgas.com/esb/canonical/InvokeCanonicalModel/v1/\" xmlns:ns33=\"http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2\" xmlns:ns41=\"http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/PaymentTerm/V1\" xmlns:ns0=\"http://integra.globalgas.com/esb/bss/AP/dpCnlPaymentsManager/v1/\">\n" +
            "   <ns14:Payment>" +
            "";
        List<String> lines = new ArrayList<>();
        try {

            DirectoryStream<Path> stream = Files.newDirectoryStream(Paths.get(localTmpPath), "*.{txt}");
            for (Path path : stream) {
                existFiles = 1;
                System.out.println("File: "+path.getFileName());
                xmlOut +=
                    "<ns41:PaymentTermLine>\n" + "" +
                    "<ns33:Identification>  \n" +
                    "                           <ns33:BusinessComponentID>" + path.getFileName() +
                    "</ns33:BusinessComponentID>\n" + "                           <ns33:ID>" + new String("xRFCx") +
                    "</ns33:ID>\n" + "                   </ns33:Identification>";
             //   lines = Files.lines(path).collect(Collectors.toList());  okkkkk
             lines = Files.lines(path,Charset.forName("ISO_8859_1")).collect(Collectors.toList());
                int i = 0;

                //  ************* Lista de Lineas del archivo

                int nLines = 0;
                for (String line : lines) {
                    if (!line.substring(1324, 1326).endsWith("00") && !line.substring(1324, 1326).endsWith(" ")) {
                        nLines++;
                    }
                }


if (nLines > 0)
{

                PaymentsRec[] pays = new PaymentsRec[nLines];

                int indexPay = 0;
                String account = "";
                String rfc = "";
                for (String line : lines) {

                    if (i == 0) {
                      //  System.out.println("cuenta: " + line.substring(1, 10)); //cuenta bancaria
                        account = line.substring(1, 10);
                       // System.out.println("RFC: " + line.substring(22, 34)); //cuenta bancaria
                        rfc= line.substring(22, 34); //RFC
                        xmlOut = xmlOut.replace("xRFCx", rfc);
                        i = 1;
                    }
                    if (!line.substring(1324, 1326).endsWith("00") && !line.substring(1324, 1326).endsWith(" ")) {

                        PaymentsRec pay = new PaymentsRec();
                        pay.setCHECK_ID("CHECK_ID");
                        pay.setPAYMENT_DATE(line.substring(539, 549));
                        pay.setAMOUNT(line.substring(444, 459));
                        pay.setPAYMENT_NUMBER( line.substring(117, 154).trim() );
                        pay.setRFC_SUPPLIER(line.substring(23, 53).trim());
                        pay.setBANK_NAME("BANCOMER");
                        pay.setBANK_ACCOUNT(account);
                        pay.setFLOW_ID("CHECK_ID");
                        pay.setSTATUS(line.substring(1324, 1326));
                        pay.setDESCRIPTION(line.substring(1326, 1356).replace("<", " "));

                        pays[indexPay] = pay;
                        indexPay++;

                    }
                }
              // armar XML de salida
                PaymentsRec[] paysOut = getPaymentsErrorInfo(pays);
                        for (PaymentsRec payO : paysOut) {
                            
                       xmlOut += "<ns41:PaymentTermDiscount>\n" + 
                       "                                <ns33:Identification>\n" + 
                       "                                        <ns33:BusinessComponentID>"+payO.getBANK_ACCOUNT()+"</ns33:BusinessComponentID>\n" + 
                       "                                        <ns33:ID>"+payO.getCHECK_ID()+"</ns33:ID>\n" + 
                       "                                        <ns33:ContextID>"+payO.getPAYMENT_NUMBER().trim()+"</ns33:ContextID> \n" + 
                       "                                        <ns33:ApplicationObjectKey>\n" + 
                       "                                                <ns33:ID>"+payO.getAMOUNT()+"</ns33:ID>\n" + 
                       "                                                <ns33:ContextID>"+payO.getSTATUS()+" : "+payO.getDESCRIPTION()+"</ns33:ContextID>\n" + 
                       "                                        </ns33:ApplicationObjectKey>\n" + 
                       "                                        <ns33:AlternateObjectKey>\n" + 
                       "                                                <ns33:ID>"+payO.getRFC_SUPPLIER()+"</ns33:ID>\n" + 
                       "                                        </ns33:AlternateObjectKey>\n" +
                       "                                </ns33:Identification>\n" + 
                       "                        </ns41:PaymentTermDiscount>";

                        }
                
                
                
                
}      
                
                
                
                xmlOut += "</ns41:PaymentTermLine>";

            }

            xmlOut += " </ns14:Payment>\n" + 
            "     </ns0:cnlPaymentsManagerRequest>";
            
            if(existFiles == 0){
                xmlOut = "NOT_EXIST";
            }

        } catch (IOException e) {
            e.printStackTrace();
            xmlOut += " </ns14:Payment>\n" + "</ns0:cnlPaymentsManagerRequest>";
        }

        return xmlOut;
    }


    public static PaymentsRec[] getPaymentsErrorInfo(PaymentsRec[] pays) {
        
        DataSource dataSource;
        CallableStatement cs = null;
        Connection connection = null;
        InitialContext context = null;
        PaymentsRec[] paymentsOut = new PaymentsRec[pays.length];
        String typeName = "PAYMENTS_OBJ";
        String typeTableName = "PAYMENTS_OBJ_TAB";
        try {

            context = new InitialContext();
            dataSource = (DataSource) context.lookup("jdbc/globalgas/integra/XXConsolidate");
            connection = dataSource.getConnection();
            
            /*
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
            connection =
                DriverManager.getConnection("jdbc:oracle:thin:@132.145.160.115:1521/PDBINTSO.sub03130452060.integrasoadev.oraclevcn.com",
                                            "XXGG_CONSOLIDATE", "XxgC$Consolidate01.");
            */

            StructDescriptor structDescriptor = StructDescriptor.createDescriptor(typeName.toUpperCase(), connection);
            ResultSetMetaData metaData = structDescriptor.getMetaData();

            ArrayDescriptor arrayDescriptor = ArrayDescriptor.createDescriptor(typeTableName.toUpperCase(), connection);

            STRUCT[] sts = new STRUCT[pays.length];
            int stI = 0;

            for (PaymentsRec pay : pays) {

                STRUCT st =
                    new STRUCT(structDescriptor, connection,
                               new Object[] { pay.getCHECK_ID(), pay.getPAYMENT_DATE(), pay.getAMOUNT(),
                                              pay.getPAYMENT_NUMBER(), pay.getRFC_SUPPLIER(), pay.getBANK_NAME(),
                                              pay.getBANK_ACCOUNT(), pay.getFLOW_ID(), pay.getSTATUS(),
                                              pay.getDESCRIPTION() });
                sts[stI] = st;
                stI++;
            }
            ARRAY arrayPays = new ARRAY(arrayDescriptor, connection, sts);

            cs =
                (OracleCallableStatement) connection.prepareCall(" BEGIN  XXGG_DP_TRANSACTION_PKG.GET_PAYMENTS_ERROR1(:1, :2 , :3 ,:4);    END; ");
            // setObject with the designated sql type
            cs.setObject(1, arrayPays, Types.ARRAY);
            cs.registerOutParameter(2, Types.ARRAY, typeTableName);
            cs.registerOutParameter(3, Types.VARCHAR);
            cs.registerOutParameter(4, Types.VARCHAR);

            cs.execute();

           // System.out.println("- " + cs.getString(3));
         //   System.out.println("- " + cs.getString(4));
            Object[] data = (Object[]) ((Array) cs.getObject(2)).getArray();
            int index = 0;
            for (Object tmp : data) {
                Struct row = (Struct) tmp;

                PaymentsRec payOut = new PaymentsRec();

                int idx = 1;

                for (Object attribute : row.getAttributes()) {
              //      System.out.println(metaData.getColumnName(idx) + " = " + attribute);
                    if (metaData.getColumnName(idx).equals("CHECK_ID"))
                        payOut.setCHECK_ID((String) attribute);
                    if (metaData.getColumnName(idx).equals("PAYMENT_DATE"))
                        payOut.setPAYMENT_DATE((String) attribute);
                    if (metaData.getColumnName(idx).equals("AMOUNT"))
                        payOut.setAMOUNT((String) attribute);
                    if (metaData.getColumnName(idx).equals("PAYMENT_NUMBER"))
                        payOut.setPAYMENT_NUMBER((String) attribute);
                    if (metaData.getColumnName(idx).equals("RFC_SUPPLIER"))
                        payOut.setRFC_SUPPLIER((String) attribute);
                    if (metaData.getColumnName(idx).equals("BANK_NAME"))
                        payOut.setBANK_NAME((String) attribute);
                    if (metaData.getColumnName(idx).equals("BANK_ACCOUNT"))
                        payOut.setBANK_ACCOUNT((String) attribute);
                    if (metaData.getColumnName(idx).equals("FLOW_ID"))
                        payOut.setFLOW_ID((String) attribute);
                    if (metaData.getColumnName(idx).equals("STATUS"))
                        payOut.setSTATUS((String) attribute);
                    if (metaData.getColumnName(idx).equals("DESCRIPTION"))
                        payOut.setDESCRIPTION((String) attribute);
                    ++idx;
                }
              //  System.out.println("-------------------------");
                paymentsOut[index] = payOut;
                index++;
            }


        } catch (SQLException e) {
            e.printStackTrace();
            //  return paymentsOut;
        } catch (NamingException e) {
            e.printStackTrace();
        } finally {
            try {
                context.close();
                connection.close();
                cs.close();

            } catch (SQLException e) {
                e.printStackTrace();
            } catch (NamingException e) {
                e.printStackTrace();
            }

        }
        return paymentsOut;
    }
   
   
}
