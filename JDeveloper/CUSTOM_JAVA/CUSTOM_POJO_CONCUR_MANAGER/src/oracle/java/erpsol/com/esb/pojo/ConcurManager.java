package oracle.java.erpsol.com.esb.pojo;

import com.erpsol.xmlns.core.esb.bss.custom.concur.v1.AbstractConcurDocument;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Receipts;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Receipts.Receipt;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Receipts.Receipt.ErrorsReceipt;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Receipts.Receipt.Amounts;
import com.erpsol.xmlns.core.esb.bss.custom.concur.v1.AbstractConcurDocument.AbstractConcur.Lines.Line;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Prepayments;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Prepayments.Prepayment;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Prepayments.Prepayment.ErrorsPrepayment;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Prepayments.Prepayment.PrepaymentLines.PrepaymentLine;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Details;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Invoices;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Invoices.Invoice;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Invoices.Invoice.ErrorsInvoice;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Invoices.Invoice.InvoiceLines;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.Invoices.Invoice.InvoiceLines.InvoiceLine;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.LinesUnidentified;
import com.erpsol.xmlns.core.esb.bss.custom.concurManager.v1.AbstractConcurManagerDocument.AbstractConcurManager.LinesUnidentified.LineUnidentified;

import java.io.Serializable;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ConcurManager  implements Serializable {

    public static String createOrderedDataConcur(String xmlConcur,String logName) {
        //Objetos de respuesta
        AbstractConcurManagerDocument responseConcurM = AbstractConcurManagerDocument.Factory.newInstance();
        responseConcurM.addNewAbstractConcurManager();
        Receipts receipts = responseConcurM.getAbstractConcurManager().addNewReceipts();
        Prepayments prepayments = responseConcurM.getAbstractConcurManager().addNewPrepayments();
        Invoices invoices = responseConcurM.getAbstractConcurManager().addNewInvoices();
        LinesUnidentified unidentified = responseConcurM.getAbstractConcurManager().addNewLinesUnidentified();
        Details details = responseConcurM.getAbstractConcurManager().addNewDetails();
        SOAAuditLogging log =new  SOAAuditLogging();
        

        try {
            //objeto porperties
            ConfProperties properties = new ConfProperties();

            //lista principal
            List<Line> listLines = new ArrayList<Line>();
            AbstractConcurDocument lines = AbstractConcurDocument.Factory.parse(xmlConcur); //objetos de entrada
            listLines.addAll(Arrays.asList(lines.getAbstractConcur().getLines().getLineArray())); //lo volvemos una lista

       
            
            log.logWrite(logName, "INFO", "     =================================================================================     ");         
            log.logWrite(logName, "INFO", "     JAVA: ConcurManager");      
            log.logWrite(logName, "INFO", "     REQUEST "+xmlConcur.replaceAll("\n",""));              
            log.logWrite(logName, "INFO", "     total de lineas concur: " + listLines.size());  
           //::::::::::::::::::::::::::::::::::::::::::::::::logica para agrupar  Devoluciones::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            createReceipts(listLines, receipts, properties);
            log.logWrite(logName, "INFO", "     Total de lineas sin recibos: " + listLines.size()); 
            //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::agrupamos los aticipos ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            createPrePayments(listLines, prepayments);
            log.logWrite(logName, "INFO", "     Total de lineas sin prepayments: " + listLines.size());
            //:::::::::::::::::::::::::::::::::::::::::Facturacion:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            createInvoices(listLines, invoices, properties);
            log.logWrite(logName, "INFO", "     Total de lineas sin facturas: " + listLines.size());
            //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::generamos consecutivos en facturas con el mismo numero ::::::::::::::::::::::::
            
            generateSequential(invoices,receipts,prepayments);

            //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::Generamos lineas sobrantes si las hay::::::::::::::::::::::::::::::::::::::::::::::

            createUnidentified(listLines, unidentified);
            
            //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
               
            log.logWrite(logName, "INFO", "     RESPONSE "+responseConcurM.xmlText()); 
            log.logWrite(logName, "INFO", "     =================================================================================     ");         

            return responseConcurM.xmlText();
        } catch (Throwable e) {
            details.setStatus("Error");
            String MsgError = "Error " + e.getClass() + ", \n" + "Message: " + e.getMessage()+" ," ;

            for (int i = 0; i < e.getStackTrace().length; i++) {
                MsgError = MsgError + "\n" + e.getStackTrace()[i].toString();
            }
            details.setDescription(MsgError);
            log.logWrite(logName, "INFO", "     ERROR_RESPONSE "+responseConcurM.xmlText()); 
            log.logWrite(logName, "INFO", "     =================================================================================     "); 
            return responseConcurM.xmlText();
        }
    }    
    public static void createReceipts(List<Line> listLines, Receipts receipts,ConfProperties properties) {
        //obtencion de variables properties
        String accountCode = properties.getProp().getProperty("ws.esb.concurManager.accountCode");
        String expenseType = properties.getProp().getProperty("ws.esb.concurManager.expenseType");
        //validacion de objetos
        if(expenseType==null || accountCode==null) {
                throw new RuntimeException("Not Exist 'ws.esb.concurManager.accountCode' or 'ws.esb.concurManager.expenseType' in properties");
        }
        
        Map<String, Map<String, List<Line>>> listReportKey2 =
            listLines.stream().filter(line -> line.getEntryData().getExpenseType() != null &&
                                              line.getEntryData().getExpenseType().contains(expenseType) &&
                                              line.getJournalEntryData().getAccountCode().equals(accountCode) &&
                                              line.getJournalEntryData().getAccountCode() !=null &&
                                              line.getReportData().getReportKey() != null &&
                                              line.getEntryData().getEntryTransactionDate() != null)
                     .collect(Collectors.groupingBy(line -> line.getReportData().getReportKey(),
                                                    Collectors.groupingBy(line -> line.getEntryData().getEntryTransactionDate())));

        listReportKey2.forEach((reportKey, reportKeyMap) -> {
          //  System.out.println("reportKey --> " + reportKey);
            reportKeyMap.forEach((entryTransactionDate, transactionDate) -> {
          //      System.out.println("--entryTransactionDate --> " + entryTransactionDate+"_"+transactionDate.size());
                
                /////////////////////////////////////////////////////////////////////////////
                // creamos el Recibo
                Receipt receiptResponse = receipts.addNewReceipt();
                // creamos el array de amounts
                Amounts amounts = receiptResponse.addNewAmounts();
                // creamos el array de errores
                ErrorsReceipt errorsReceipt = receiptResponse.addNewErrorsReceipt();

                try {
                receiptResponse.setBatchId(transactionDate.get(0).getBatchData().getBatchID());
                receiptResponse.setEmpID(transactionDate.get(0).getEmployeeData().getEMPID());
                receiptResponse.setFirstName(transactionDate.get(0).getEmployeeData().getFirstName());
                receiptResponse.setLastName(transactionDate.get(0).getEmployeeData().getLastName());
                receiptResponse.setBusinessUnit(transactionDate.get(0).getEmployeeData().getEmployeeOrgUnit1Tipo());
                receiptResponse.setReceiptNumber(transactionDate.get(0).getReportData().getReportKey());
                receiptResponse.setReportId(transactionDate.get(0).getReportData().getReportID());
                receiptResponse.setReceiptType(transactionDate.get(0).getEntryData().getExpenseType());
                receiptResponse.setReceivablesActivity(transactionDate.get(0).getEntryData().getExpenseType());
                receiptResponse.setReceiptDate(transactionDate.get(0).getEntryData().getEntryTransactionDate());
                receiptResponse.setCurrency(transactionDate.get(0).getEntryData().getSpendCurrencyAlphaISO());
                receiptResponse.setEnteredAmount(new BigDecimal(transactionDate.get(0).getAllocationData().getFutureUse()).toString());
         
                ///////////////////////// secuencia devolucion valida montos iguales //////////////////////////////////////////////////////////////////
                if(transactionDate.size()>1)
                {

                        Double sumaMonto = 0.0;
                        
                        // recorremos los recibos con el fin de evaluar montoss
                        for (Line receipt : transactionDate) {
                                // agregamos el monto al arrary de amounts
                                amounts.addJournalAmt(new BigDecimal(receipt.getJournalEntryData().getJournalAmt()).toString());
        
                                        sumaMonto = sumaMonto + Double.parseDouble(receipt.getAllocationData().getFutureUse());
               
                                listLines.remove(receipt);
                                }
                        receiptResponse.setEnteredAmount(sumaMonto.toString());
                }
               //////////////////////////////////////////////// estos no se repiten//////////////////////////////////////////////////////////
                else
                {
                                // eliminamos los datos de la linea en la lista principal
                                listLines.remove(transactionDate.get(0));
                }
                } catch (Throwable e) {
                        
                    String MsgError="Error "+e.getMessage();
                    errorsReceipt.addError(MsgError);
                        //System.out.println(MsgError);
                }
                });
        });
    }
    public static void createPrePayments(List<Line> listLines, Prepayments prepayments) {
        //logica de negocio para comvertir monto a USD en anticipos
          Map<String, List<Line>> listCAKeyUSD =
                  listLines.stream().filter(line -> line.getCashAdvanceData().getCAKey() != null &&
                                                            line.getCashAdvanceData().getCACurrencyAlphaISO().equals("USD"))
                           .collect(Collectors.groupingBy(line -> line.getCashAdvanceData().getCAKey()));
          listCAKeyUSD.forEach((CAKeyUSD,CAKeyUSDMap)->{

                  CAKeyUSDMap.forEach((line)->{
                  //System.out.println(new BigDecimal(line.getJournalEntryData().getJournalAmt()).divide(new BigDecimal(line.getEntryData().getCurrencyExchangeRate()), 5, RoundingMode.CEILING).toString());
                          line.getJournalEntryData().setJournalAmt(new BigDecimal(line.getJournalEntryData().getJournalAmt())
                           .divide(new BigDecimal(line.getEntryData().getCurrencyExchangeRate()), 5, RoundingMode.CEILING).toString());
                          
                  });      
          });
                        
          //creamos aplicacion de anticipos
          Map<String, List<Line>> listCAKeyJournalKey =
                  listLines.stream().filter(line -> line.getCashAdvanceData().getCAKey() != null &&
                                                            line.getJournalEntryData().getJournalKey() != null)
                           .collect(Collectors.groupingBy(line -> line.getCashAdvanceData().getCAKey()));
          
          listCAKeyJournalKey.forEach((CAKey,CAKeyMap)->{
                  //System.out.println("CAKey-->"+CAKey);
                  
              //creamos el prePayment
              Prepayment prePaymentResponse = prepayments.addNewPrepayment();
              ErrorsPrepayment errors=prePaymentResponse.addNewErrorsPrepayment();
                  
                  
                  try {
              //recorremos los grupos qu eson un aplicacion con lienas
              Line line = CAKeyMap.get(0);
                      //creamos el header del prepayment
                      createHeaderPrepayment(prePaymentResponse,line);
              prePaymentResponse.setPrePaymentType("PrePaymentApply");

              //recorremos lineas
                  CAKeyMap.forEach((lineCAKey)->{
                          //System.out.println("line-->"+line.getJournalEntryData().getJournalKey());
                  //creamos la linea
                  PrepaymentLine prePaymentLineResponse = prePaymentResponse.getPrepaymentLines().addNewPrepaymentLine();
                  createLinePrepayment(prePaymentLineResponse,lineCAKey);
                  //eliminamos linea creada
                  listLines.remove(lineCAKey);
                          
                          });
                  } catch (Throwable e) {
                  
                  String MsgError="Error "+e.getMessage();
                  errors.addError(MsgError);
                  //System.out.println(MsgError);
              }
          });
          
          //creamos anticipos
          Map<String, List<Line>> listCAKey =
                  listLines.stream().filter(line -> line.getCashAdvanceData().getCAKey() != null )
                           .collect(Collectors.groupingBy(line -> line.getCashAdvanceData().getCAKey()));
                 
          listCAKey.forEach(((CAKey,CAKeyMap)->{
                  CAKeyMap.forEach((line)->{
                          //creamos el prePayment
                  Prepayment prePaymentResponse = prepayments.addNewPrepayment();
                  ErrorsPrepayment errors=prePaymentResponse.addNewErrorsPrepayment();
                  
                  try {
                      
                  //creamos el header del prepayment
                  createHeaderPrepayment(prePaymentResponse,line);
                  //indacamos que es un PrePaymentApply
                  prePaymentResponse.setPrePaymentType("PrePaymentApply");
                 
                  //creamos la linea
                  PrepaymentLine prePaymentLineResponse =prePaymentResponse.getPrepaymentLines().addNewPrepaymentLine();
                  createLinePrepayment(prePaymentLineResponse,line);
                 
                  //eliminamos los prepiment de la lista principal
                  listLines.remove(line);  
                  } catch (Throwable e) {
                          
                      String MsgError="Error "+e.getMessage();
                      errors.addError(MsgError);
                          //System.out.println(MsgError);
                  }       
                  });
          }));
        
    }
    public static void createInvoices(List<Line> listLines, Invoices invoices, ConfProperties properties) {
        int count = 1;
        //obtencion de variables properties
        String payeePayType = properties.getProp().getProperty("ws.esb.concurManager.payeePayType");
        String payeerPayType = properties.getProp().getProperty("ws.esb.concurManager.payeerPayType");
        String payeePayTypeNewInv = properties.getProp().getProperty("ws.esb.concurManager.payeePayTypeNewInv");
        String textReembolso = properties.getProp().getProperty("ws.esb.concurManager.textReembolso");
        //validacion de objetos
        if (payeePayType == null || payeerPayType == null || payeePayTypeNewInv == null) {
            throw new RuntimeException("Not Exist 'ws.esb.concurManager.payeePayTypeNewInv' or 'ws.esb.concurManager.payeerPayType' or 'ws.esb.concurManager.payeePayType' in properties");
        }

        //removemos los IVAS de las facturas
        Map<String, List<Line>> listFactIvas =listLines.stream().filter(line -> line.getReportData().getReportKey() != null &&
                                                                line.getEntryData().getSpendCurrencyAlphaISO() !=null &&
                                                                line.getReportData().getAmountDueEmployee2() !=null &&
                                                                line.getJournalEntryData().getJournalKey() != null &&
                                                                (line.getJournalEntryData().getPayerPayType().equals(payeerPayType) ||
                                                                 line.getJournalEntryData().getPayeePayType().equals(payeePayType)))
                                                       .collect(Collectors.groupingBy(line -> line.getReportData().getReportKey()));
        
        listFactIvas.forEach((FactIvas, FactIvasMap) -> { 
            listLines.removeAll(FactIvasMap); 
            });

        //agrupamos lista de recibos por ReporKey ,SpendCurrencyAlphaISO(),SpendCurrencyAlphaISO y AmountDueEmployee2 +
        Map<String, Map<String, Map<String, List<Line>>>> listInvoices =
            listLines.stream().filter(line -> line.getReportData().getReportKey() !=null &&
                                      line.getEntryData().getSpendCurrencyAlphaISO() !=null &&
                                      line.getReportData().getAmountDueEmployee2() != null &&
                                      line.getJournalEntryData().getJournalKey() != null &&
                                      line.getEntryData().getCurrencyExchangeRate() !=null &&
                                      line.getEntryData().getEntryTransactionDate() != null&&
                                      line.getEntryData().getEntryId() != null)
                     .collect(Collectors.groupingBy(line -> line.getReportData().getReportKey(),
                                    Collectors.groupingBy(line -> line.getEntryData().getSpendCurrencyAlphaISO(),
                                            Collectors.groupingBy(line -> line.getReportData().getAmountDueEmployee2()))));


        listInvoices.forEach((reportKeyInvoices, reportKeyMapInvoices) -> {
            // System.out.println("--------------------------------------------------------------------reportKey --> " );
            
            reportKeyMapInvoices.forEach((spendCurrencyAlphaISOInvoices, spendCurrencyAlphaISOMapInvoices) -> {
              //  System.out.println("--------------------------------------spendCurrencyAlphaISO -->" + spendCurrencyAlphaISO);
                spendCurrencyAlphaISOMapInvoices.forEach((amountDueEmployee2Invoices, amountDueEmployee2MapInvoices) -> {
                        
                        //bandera reembolso indica si contiene reembolsas
                        boolean reembolso=false;
                        boolean factura=false;
                      List<Line> listReembolsos=new ArrayList<Line>();

                      //verificamos si contiene reembolso si es asi filtramos
                        for(Line line: amountDueEmployee2MapInvoices){
                            //validamos si la fac contiene reembolso
                            if(Double.parseDouble(line.getReportData().getAmountDueEmployee2()) > 0 && line.getJournalEntryData().getPayeePayType().equals(payeePayTypeNewInv)){
                                    reembolso=true;
                                    listReembolsos.add(line);
                                    //
                                   // System.out.println(line.getJournalEntryData().getPayeePayType()+" : "+reembolso);
                                }
                            else{
                                    factura=true;
                                }
                            }
                        
                        //si tenemos reembolsos
                        if(reembolso){

                                                                
                                                                    Line lineHeader = listReembolsos.get(0);
                                                                                         
                                                                    //si es moneda nacional creamos la factura
                                                                    if (!lineHeader.getEntryData().getSpendCurrencyAlphaISO().equals("USD")){
                                                                          
                                                                        generateTotalLines(listReembolsos,invoices,listLines,payeePayTypeNewInv,textReembolso); 
                                                                        amountDueEmployee2MapInvoices.removeAll(listReembolsos);

                                                                    }else{
                                                                        Map<String, Map<String, List<Line>>> listDateExchangeRate =listReembolsos.stream().
                                                                                                                                                         filter(line -> line.getEntryData().getCurrencyExchangeRate() !=null &&
                                                                                                                                                                 line.getEntryData().getEntryTransactionDate() != null)
                                                                                                 .collect(Collectors.groupingBy(line -> line.getEntryData().getCurrencyExchangeRate(),
                                                                                                                                Collectors.groupingBy(line -> line.getEntryData().getEntryTransactionDate())));

                                                                        listDateExchangeRate.forEach((currencyExchangeRate, CurrencyExchangeRateMap) -> {
                                                                            //System.out.println("------ExchangeRate -->" );
                                                                            CurrencyExchangeRateMap.forEach((entryTransactionDate, entryTransactionDateMap) -> {
                                                                                                            //System.out.println("Date -->" + entryTransactionDate+"++++++ ");
                                                                     generateTotalLines(entryTransactionDateMap,invoices,listLines,payeePayTypeNewInv,textReembolso);
                                                                       amountDueEmployee2MapInvoices.removeAll(listReembolsos);
                                                                                                            }); });                       
                                                                    }                         
                           
                        }
                        //facturas

                     // else{
                     if(factura){
                            Line lineHeader = amountDueEmployee2MapInvoices.iterator().next();
                                                 
                            //si es moneda nacional creamos la factura
                            if (!lineHeader.getEntryData().getSpendCurrencyAlphaISO().equals("USD")){
                                  
                                generateTotalLines(amountDueEmployee2MapInvoices,invoices,listLines,payeePayTypeNewInv,textReembolso);                          

                            }else{
                                Map<String, Map<String, List<Line>>> listDateExchangeRate =amountDueEmployee2MapInvoices.stream().
                                                                                                                 filter(line -> line.getEntryData().getCurrencyExchangeRate() !=null &&
                                                                                                                         line.getEntryData().getEntryTransactionDate() != null)
                                                         .collect(Collectors.groupingBy(line -> line.getEntryData().getCurrencyExchangeRate(),
                                                                                        Collectors.groupingBy(line -> line.getEntryData().getEntryTransactionDate())));

                                listDateExchangeRate.forEach((currencyExchangeRate, CurrencyExchangeRateMap) -> {
                                    //System.out.println("------ExchangeRate -->" );
                                    CurrencyExchangeRateMap.forEach((entryTransactionDate, entryTransactionDateMap) -> {
                                                                    //System.out.println("Date -->" + entryTransactionDate+"++++++ ");
                             generateTotalLines(entryTransactionDateMap,invoices,listLines,payeePayTypeNewInv,textReembolso);
                                        
                                                                    }); });                       
                            }                          
                       }
                  });
                                });
                                });
        
        
                            
   
    }
    //clase que genera una factura o remmebolso, USD o MXN aplicando regla de una linea doble hacerla una 
    public static void generateTotalLines(List<Line> lineasFactura,Invoices invoices,List<Line> listLines,String payeePayTypeNewInv,String textReembolso){
           /* System.out.format("+------------+-------------+---------------+---------------+--------------+------------------+--------------+---------------+--------------+----------------+%n");
            System.out.format("| RprtKy(20) | EntryId(61) | PyePyTpe(165) | TransDate(64) | Currency(66) | TransAmount(123) | FtreUse(211) | Custom40(122) | JrnlAmt(169) | AmountDE2(319) |%n");
            System.out.format("+------------+-------------+---------------+---------------+--------------+------------------+--------------+---------------+--------------+----------------+%n");
*/
       //crea factura
         Invoice invoiceResponse = invoices.addNewInvoice();
         ErrorsInvoice errorsInvoice = invoiceResponse.addNewErrorsInvoice();
                try {
         Line lineHeader = lineasFactura.get(0);
         Double sumaMonto=0.0;

       //creamos el header
       createHeaderInvoice(invoiceResponse, lineHeader);
       InvoiceLines invoiceLines = invoiceResponse.addNewInvoiceLines();


       
       //agrupamos para saber cuando hay dos lineas que se hacen una
            Map<String, List<Line>> listEntryId =lineasFactura.stream()
                                                              .filter(inovice -> inovice.getEntryData().getEntryId() !=null)
                                       .collect(Collectors.groupingBy(inovice -> inovice.getEntryData().getEntryId()));
         //recorremos los grupos   
            for(List<Line> entryId: listEntryId.values()){
                //timamos los datos de la primer linea
                    Line line=entryId.get(0);
                
               /*     String leftAlignFormat = "";
                System.out.format("| %-10s | %-11s | %-13s | %-13s | %-12s | %-16s | %-12s | %-13s | %-12s | %-14s |%n",
                                  line.getReportData().getReportKey(),
                                  line.getEntryData().getEntryId(),
                                  line.getJournalEntryData().getPayeePayType(),
                                  line.getEntryData().getEntryTransactionDate(),
                                  line.getEntryData().getSpendCurrencyAlphaISO(),
                                  line.getEntryData().getEntryTransactionAmount(),
                                  line.getAllocationData().getFutureUse(),
                                  line.getEntryData().getReportEntryCustom40(),
                                  line.getJournalEntryData().getJournalAmt(),
                                  line.getReportData().getAmountDueEmployee2());
*/
                
                //creamos la linea
                    InvoiceLine invoiceLine = invoiceLines.addNewInvoiceLine();
                
                //colocamos etiqueta de reembolso si lo es 
                    if (Double.parseDouble(line.getReportData().getAmountDueEmployee2()) > 0 && line.getJournalEntryData().getPayeePayType().equals(payeePayTypeNewInv)) {
                    invoiceResponse.setNumber(textReembolso+line.getReportData().getReportKey());
                    }
                
                
                    //si hay dos lineas se suman sus totales
                    if (listEntryId.size() > 1) {
                        //en caso de dolar
                        if (line.getEntryData().getSpendCurrencyAlphaISO().equals("USD")) {
                            //suma montos de linea que se vuelve una
                          for (Line lineEntryId :entryId) {
                            //suma monto linea
                            sumaMonto =sumaMonto + Double.parseDouble(lineEntryId.getEntryData().getEntryTransactionAmount());
                        }
                        //asigna monto a una linea de este grupo
                        invoiceLine.setAmount(new BigDecimal(line.getEntryData().getEntryTransactionAmount()).toString());
                        }
                        //caso de moneda mx
                        else{
                                //#suma montos de linea que se vuelve una
                                for (Line lineEntryId :entryId) {
                                //#suma monto linea
                                sumaMonto =sumaMonto + Double.parseDouble(lineEntryId.getJournalEntryData().getJournalAmt());
                                }
                                //#asigna monto a una linea de este grupo
                                invoiceLine.setAmount(new BigDecimal(line.getEntryData().getReportEntryCustom40()).toString());
                                }    
                    } 
                    //si hay una sola linea se crea normal
                    else {
                        //#dolares una linea
                        if (line.getEntryData().getSpendCurrencyAlphaISO().equals("USD")) {
                               //suma monto linea
                               sumaMonto = sumaMonto +Double.parseDouble(line.getEntryData().getEntryTransactionAmount());
                               //asigna monto a linea
                               invoiceLine.setAmount(new BigDecimal(line.getEntryData().getEntryTransactionAmount()).toString());
                        }
                        //#moneda nacional
                        else{
                                //suma monto linea
                                sumaMonto = sumaMonto +Double.parseDouble(line.getJournalEntryData().getJournalAmt());
                                //asigna monto a linea
                                invoiceLine.setAmount(new BigDecimal(line.getAllocationData().getFutureUse()).toString());
                            }
                    }
                
                    //llenamos la lineas
                    createLineInvoice(invoiceLine, line);
                    //eliminamos facturas utilizadas

                    listLines.removeAll(lineasFactura);
                }
                    
                //enviamos la suma de las lineas al header
                invoiceResponse.setAmount(sumaMonto.toString());
               // System.out.format("+------------+-------------+---------------+---------------+--------------+------------------+--------------+---------------+--------------+----------------+%n");
                //System.out.println("##############total de factura:"+ sumaMonto.toString()+"\t");
            } catch (Throwable e) {

                String MsgError = "Error " + e.getMessage();
                errorsInvoice.addError(MsgError);
                //System.out.println(MsgError);
            }    
        }                    
    public static void createUnidentified(List<Line> listLines,LinesUnidentified unidentified) {
            //si hay lineas de sobra las mandamos 
            listLines.forEach((line)->{             
                    LineUnidentified lineUnidentified=unidentified.addNewLineUnidentified();
                    lineUnidentified.setBatchId(line.getBatchData().getBatchID());
                    lineUnidentified.setAccountCode(line.getJournalEntryData().getAccountCode());
                    lineUnidentified.setAmountDueEmployee2(line.getReportData().getAmountDueEmployee2());
                    lineUnidentified.setAmountReceipt(line.getAllocationData().getFutureUse());
                    lineUnidentified.setBatchDate(line.getBatchData().getBatchDate());
                    lineUnidentified.setCAKey(line.getCashAdvanceData().getCAKey() );
                    lineUnidentified.setCashAdvanceUtilizedAmount(line.getCashAdvanceData().getCashAdvanceUtilizedAmount());
                    lineUnidentified.setCurrencyExchangeRate(line.getEntryData().getCurrencyExchangeRate());
                    lineUnidentified.setEMPID(line.getEmployeeData().getEMPID());
                    lineUnidentified.setExpenseType(line.getEntryData().getExpenseType());
                    lineUnidentified.setFirstName(line.getEmployeeData().getFirstName());
                    lineUnidentified.setJournalAmt(line.getJournalEntryData().getJournalAmt());
                    lineUnidentified.setJournalKey(line.getJournalEntryData().getJournalKey());
                    lineUnidentified.setLastName(line.getEmployeeData().getLastName());
                    lineUnidentified.setPayeePayType(line.getJournalEntryData().getPayeePayType());
                    lineUnidentified.setPayerPayType(line.getJournalEntryData().getPayerPayType());
                    lineUnidentified.setReportKey(line.getReportData().getReportKey());
                    lineUnidentified.setSpendCurrencyAlphaISO(line.getEntryData().getSpendCurrencyAlphaISO());
                    lineUnidentified.setTransactionDate( line.getEntryData().getEntryTransactionDate());
                    lineUnidentified.setUUID(line.getReportEntryData().getUUID());
            });
        }
    public static void generateSequential(Invoices invoices,Receipts receipts, Prepayments prepayments) {
        //consecutivos a facturas 
        List<Invoice> listInvoices = new ArrayList<Invoice>();
        listInvoices.addAll(Arrays.asList(invoices.getInvoiceArray()));
        Map<String, List<Invoice>> listReportKey =
            listInvoices.stream().filter(line -> line.getNumber() != null).collect(Collectors.groupingBy(line -> line.getNumber()));
        listReportKey.forEach((ReportKey, ReportKeyMap) -> {
            if (ReportKeyMap.size() > 1) {
                for (int i = 0; i < ReportKeyMap.size(); i++) {
                    int consecutivo = i + 1;
                    ReportKeyMap.get(i).setNumber(ReportKeyMap.get(i).getNumber() + "-" + consecutivo);
                }
            }
        });
        
        //consecutivos a Recibos 
        List<Receipt> listReceipts = new ArrayList<Receipt>();
        listReceipts.addAll(Arrays.asList(receipts.getReceiptArray()));
        Map<String, List<Receipt>> listReportKeyReceipt =
            listReceipts.stream().filter(line -> line.getReceiptNumber() != null).collect(Collectors.groupingBy(line -> line.getReceiptNumber()));
        
        listReportKeyReceipt.forEach((ReportKey, ReportKeyMap) -> {
            if (ReportKeyMap.size() > 1) {
                for (int i = 0; i < ReportKeyMap.size(); i++) {
                    int consecutivo = i + 1;
                    ReportKeyMap.get(i).setReceiptNumber(ReportKeyMap.get(i).getReceiptNumber() + "-" + consecutivo);
                }
            }
        });
        
        //consecutivos a Prepayment 
        List<Prepayment> listPrepayments = new ArrayList<Prepayment>();
        listPrepayments.addAll(Arrays.asList(prepayments.getPrepaymentArray()));
        Map<String, List<Prepayment>> listReportKeyPrepayment =
            listPrepayments.stream().filter(line -> line.getNumber() != null).collect(Collectors.groupingBy(line -> line.getNumber()));
        
        listReportKeyPrepayment.forEach((ReportKey, ReportKeyMap) -> {
            if (ReportKeyMap.size() > 1) {
                for (int i = 0; i < ReportKeyMap.size(); i++) {
                    int consecutivo = i + 1;
                    ReportKeyMap.get(i).setNumber(ReportKeyMap.get(i).getNumber() + "-" + consecutivo);
                }
            }
        });
    }    
    public static void createHeaderInvoice(Invoice invoiceResponse, Line line) {
        invoiceResponse.setBatchId(line.getBatchData().getBatchID());
        invoiceResponse.setEmpID(line.getEmployeeData().getEMPID());
        invoiceResponse.setBusinessUnit(line.getEmployeeData().getEmployeeOrgUnit1Tipo());
        invoiceResponse.setSupplierSite(line.getEmployeeData().getEMPID());
        invoiceResponse.setFirstName(line.getEmployeeData().getFirstName());
        invoiceResponse.setLastName(line.getEmployeeData().getLastName());
        invoiceResponse.setNumber(line.getReportData().getReportKey());
        invoiceResponse.setDate(line.getBatchData().getBatchDate());
        invoiceResponse.setCurrency(line.getEntryData().getSpendCurrencyAlphaISO());
        invoiceResponse.setCurrencyExchangeRate(line.getEntryData().getCurrencyExchangeRate());
        invoiceResponse.setTermsDate(line.getBatchData().getBatchDate());
    }
    public static void createLineInvoice(InvoiceLine invoiceLine, Line line) {
          invoiceLine.setJournalKey(line.getJournalEntryData().getJournalKey());
          invoiceLine.setTaxClassification(line.getEntryData().getReportEntryCustom17());
          invoiceLine.setTaxAmount("");
          invoiceLine.setDistribution1(line.getEmployeeData().getEmployeeOrgUnit1Tipo());
          invoiceLine.setDistribution2(line.getEmployeeData().getEmployeeOrgUnit2Depto());
          invoiceLine.setDistribution3(line.getJournalEntryData().getAccountCode());
          invoiceLine.setDistribution4(line.getEmployeeData().getEmployeeOrgUnit3());
          invoiceLine.setDistribution5(line.getEmployeeData().getEmployeeOrgUnit4());
          invoiceLine.setDistribution6(line.getEmployeeData().getEmployeeOrgUnit5());
          invoiceLine.setDistribution7(line.getEmployeeData().getEmployeeOrgUnit6());
          invoiceLine.setDescription1(line.getEntryData().getExpenseType());
          invoiceLine.setDescription2(line.getReportData().getReportUserDefinedDate());
          invoiceLine.setDescription3(line.getBatchData().getBatchID());
          invoiceLine.setDescription4(line.getReportData().getReportID());
          invoiceLine.setDescription5(line.getEmployeeData().getEMPID());
          invoiceLine.setDetails1(line.getEntryData().getReportEntryCustom7RFCTaxID());
          invoiceLine.setDetails2(line.getReportEntryData().getUUID());
          invoiceLine.setDetails3(line.getEntryData().getReportEntryCustom8NumFactura());
          invoiceLine.setDetails4(line.getEntryData().getEntryTransactionDate());
          invoiceLine.setDetails5(line.getEntryData().getVendorDescription());
          invoiceLine.setDetails6(line.getEntryData().getReportEntryCustom35());
          invoiceLine.setTransactionDate(line.getCreditCardData().getTransactionDate());
        invoiceLine.setTransactionDescription(line.getCreditCardData().getTransactionDescription());
    }
    public static void createHeaderPrepayment(Prepayment prePaymentResponse, Line line) {
        //header del prepayment
        prePaymentResponse.setBatchId(line.getBatchData().getBatchID());
        prePaymentResponse.setEmpID(line.getEmployeeData().getEMPID());
        prePaymentResponse.setBusinessUnit(line.getEmployeeData().getEmployeeOrgUnit1Tipo());
        prePaymentResponse.setFirstName(line.getEmployeeData().getFirstName());
        prePaymentResponse.setLastName(line.getEmployeeData().getLastName());
        prePaymentResponse.setPrePaymentActivity(line.getEntryData().getExpenseType());
        //prePaymentResponse.setPrePaymentType("PrePaymentApply");
        prePaymentResponse.setDate(line.getBatchData().getBatchDate());
        prePaymentResponse.setTermsDate(line.getBatchData().getBatchDate());
        prePaymentResponse.setSupplierSite(line.getEmployeeData().getEMPID());
        prePaymentResponse.setReportKey(line.getReportData().getReportKey());
        prePaymentResponse.setNumber(line.getCashAdvanceData().getCAKey());
        prePaymentResponse.setAmount(new BigDecimal(line.getCashAdvanceData().getCashAdvanceUtilizedAmount()).toString());
        prePaymentResponse.addNewPrepaymentLines();
    }
    public static void createLinePrepayment(PrepaymentLine prePaymentLineResponse, Line line) {
        prePaymentLineResponse.setAmount(new BigDecimal(line.getJournalEntryData().getJournalAmt()).toString());
        prePaymentLineResponse.setCurrency(line.getCashAdvanceData().getCACurrencyAlphaISO());
        if(line.getCashAdvanceData().getCACurrencyAlphaISO().equals("USD")){
            prePaymentLineResponse.setCurrencyExchangeRate(new BigDecimal(line.getEntryData().getCurrencyExchangeRate()).toString());
        }                
        prePaymentLineResponse.setDescription(line.getExpensePayData().getFutureUse());
        prePaymentLineResponse.setJournalKey(line.getJournalEntryData().getJournalKey());
        prePaymentLineResponse.setDistribution1(line.getEmployeeData().getEmployeeOrgUnit1Tipo());
        prePaymentLineResponse.setDistribution2(line.getEmployeeData().getEmployeeOrgUnit2Depto());
        prePaymentLineResponse.setDistribution3(line.getJournalEntryData().getAccountCode());
        prePaymentLineResponse.setDistribution4(line.getEmployeeData().getEmployeeOrgUnit3());
        prePaymentLineResponse.setDistribution5(line.getEmployeeData().getEmployeeOrgUnit4());
        prePaymentLineResponse.setDistribution6(line.getEmployeeData().getEmployeeOrgUnit5());
        prePaymentLineResponse.setDistribution7(line.getEmployeeData().getEmployeeOrgUnit6());
    }


}
