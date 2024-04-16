
package oracle.java.erpsol.com.esb.pojo.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Base64;
import oracle.java.erpsol.com.esb.pojo.Concur;


public class TestConcur {

    public static void main(String[] args) {
        TestConcur test = new TestConcur();
        test.Test1();
        //test.GenerarMapeo();
    }
    public void Test1() {
        try {
        	
        	long inicio = System.currentTimeMillis();

        	
            TestConcur test = new TestConcur();
            String xml = test.getStringFile("resources\\pruebas\\LOTE 1708.txt");

            Concur prueba = new Concur();
            String xmlSalida=prueba.GetXmlAbstractConcur(Base64.getEncoder().encodeToString(xml.getBytes()));

            test.setStringFile(xmlSalida,"..\\CUSTOM_POJO_CONCUR_MANAGER\\resources\\LOTE 1708.xml");
            
        	long fin = System.currentTimeMillis();
            double tiempo = (double) ((fin - inicio)/1000);         
            System.out.println(tiempo +" segundos");
            
           // System.out.println(xmlSalida);

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }catch (ArrayIndexOutOfBoundsException e) {
            System.out.println(e.getClass());
        }
    }

    //ayuda a generar el excel de mapeo
    public void GenerarMapeo() {
    	try {
        String xmlAbstractConcur =
            "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" + "<AbstractConcur>\n" +
            "  <AbstractConcurHeader Constant=\"str1234\" Batch_Date=\"str1234\" Record_Count=\"str1234\" Journal_Amount_Hash_Total=\"str1234\" />\n" +
            "  <Lines>\n" + "    <Line>\n" +
            "      <BatchData Constant=\"str1234\" BatchID=\"str1234\" BatchDate=\"str1234\" SequenceNumber=\"str1234\" />\n" +
            "      <EmployeeData EMPID=\"str1234\" LastName=\"str1234\" FirstName=\"str1234\" MI=\"str1234\" GroupID=\"str1234\" EmployeeOrgUnit1-Tipo=\"str1234\" EmployeeOrgUnit2-Depto=\"str1234\" EmployeeOrgUnit3=\"str1234\" EmployeeOrgUnit4=\"str1234\" EmployeeOrgUnit5=\"str1234\" EmployeeOrgUnit6=\"str1234\" ACHBankAccountNumber=\"str1234\" ACHBankRoutingNumber=\"str1234\" FutureUse=\"str1234\" EmployeeLoginID=\"str1234\" EmployeeEmailAddress=\"str1234\" EmployeeCustom1=\"str1234\" EmployeeCustom2=\"str1234\" EmployeeCustom3=\"str1234\" EmployeeCustom4=\"str1234\" EmployeeCustom5=\"str1234\" EmployeeCustom6=\"str1234\" EmployeeCustom7=\"str1234\" EmployeeCustom8=\"str1234\" EmployeeCustom9=\"str1234\" EmployeeCustom10=\"str1234\" EmployeeCustom11=\"str1234\" EmployeeCustom12=\"str1234\" EmployeeCustom13=\"str1234\" EmployeeCustom14=\"str1234\" EmployeeCustom15=\"str1234\" EmployeeCustom16=\"str1234\" EmployeeCustom17=\"str1234\" EmployeeCustom18=\"str1234\" EmployeeCustom19=\"str1234\" EmployeeCustom20=\"str1234\" FutureUse1=\"str1234\" FutureUse2=\"str1234\" FutureUse3=\"str1234\" FutureUse4=\"str1234\" FutureUse5=\"str1234\" />\n" +
            "      <ReportData ReportID=\"str1234\" ReportKey=\"str1234\" Ledger=\"str1234\" ReimbursementCurrencyAlphaISE=\"str1234\" HomeCountry=\"str1234\" ReportSubmitDate=\"str1234\" ReportUserDefinedDate=\"str1234\" ReportPaymentProcessingDate=\"str1234\" ReportName=\"str1234\" ReportImageRequired=\"str1234\" ReportHasVATEntry=\"str1234\" ReportHasTAEntry=\"str1234\" ReportTotalPostAmount=\"str1234\" ReportTotalApprovedAmount=\"str1234\" ReportPolicyName=\"str1234\" FutureUse=\"str1234\" ReportOrgUnit1-Tipo=\"str1234\" ReportOrgUnit2-Depto=\"str1234\" ReportOrgUnit3=\"str1234\" ReportOrgUnit4=\"str1234\" ReportOrgUnit5=\"str1234\" ReportOrgUnit6=\"str1234\" ReportCustom1-SGAGrouping=\"str1234\" ReportCustom2=\"str1234\" ReportCustom3=\"str1234\" ReportCustom4=\"str1234\" ReportCustom5=\"str1234\" ReportCustom6=\"str1234\" ReportCustom7=\"str1234\" ReportCustom8=\"str1234\" ReportCustom9=\"str1234\" ReportCustom10=\"str1234\" ReportCustom11=\"str1234\" ReportCustom12=\"str1234\" ReportCustom13=\"str1234\" ReportCustom14=\"str1234\" ReportCustom15=\"str1234\" ReportCustom16=\"str1234\" ReportCustom17=\"str1234\" ReportCustom18=\"str1234\" ReportCustom19=\"str1234\" ReportCustom20=\"str1234\" PersonalExpenses=\"str1234\" TotalAmountClaimed=\"str1234\" AmountDueEmployee=\"str1234\" AmountDueCompanyCard=\"str1234\" AmountNotApproved=\"str1234\" AmountCompanyPaid=\"str1234\" AmountDueCompany=\"str1234\" PaymentConfirmedAmount=\"str1234\" AmountDueEmployee2=\"str1234\" AmountDueCompanyCard2=\"str1234\" ReportType=\"str1234\" TotalTaxAdjustedAmount=\"str1234\" NetAdjustedTaxAmount=\"str1234\" FutureUse1=\"str1234\" FutureUse2=\"str1234\" FutureUse3=\"str1234\" />\n" +
            "      <EntryData EntryId=\"str1234\" EntryTransactionType=\"str1234\" ExpenseType=\"str1234\" EntryTransactionDate=\"str1234\" SpendCurrencyAlphaISO=\"str1234\" CurrencyExchangeRate=\"str1234\" ExchangeRateDirection=\"str1234\" IsPersonal=\"str1234\" EntryDescription=\"str1234\" VendorName=\"str1234\" VendorDescription=\"str1234\" ReceiptReceived=\"str1234\" ReceiptType=\"str1234\" TotalEmployeeAttendee=\"str1234\" AttendeeCountSpouse=\"str1234\" AttendeeCountBusiness=\"str1234\" ReportEntryOrgUnit1-Tipo=\"str1234\" ReportEntryOrgUnit2-Depto=\"str1234\" ReportEntryOrgUnit3=\"str1234\" ReportEntryOrgUnit4=\"str1234\" ReportEntryOrgUnit5=\"str1234\" ReportEntryOrgUnit6=\"str1234\" ReportEntryCustom1-SGAGrouping=\"str1234\" ReportEntryCustom2-LG_Transaction_Type=\"str1234\" ReportEntryCustom3-Location=\"str1234\" ReportEntryCustom4-ProyectoSN=\"str1234\" ReportEntryCustom5-Proyecto=\"str1234\" ReportEntryCustom6-Subcategoría=\"str1234\" ReportEntryCustom7-RFC-TaxID=\"str1234\" ReportEntryCustom8-Num.Factura=\"str1234\" ReportEntryCustom9=\"str1234\" ReportEntryCustom10=\"str1234\" ReportEntryCustom11=\"str1234\" ReportEntryCustom12=\"str1234\" ReportEntryCustom13=\"str1234\" ReportEntryCustom14=\"str1234\" ReportEntryCustom15=\"str1234\" ReportEntryCustom16=\"str1234\" ReportEntryCustom17=\"str1234\" ReportEntryCustom18=\"str1234\" ReportEntryCustom19=\"str1234\" ReportEntryCustom20=\"str1234\" ReportEntryCustom21=\"str1234\" ReportEntryCustom22=\"str1234\" ReportEntryCustom23=\"str1234\" ReportEntryCustom24=\"str1234\" ReportEntryCustom25=\"str1234\" ReportEntryCustom26=\"str1234\" ReportEntryCustom27=\"str1234\" ReportEntryCustom28=\"str1234\" ReportEntryCustom29=\"str1234\" ReportEntryCustom30=\"str1234\" ReportEntryCustom31=\"str1234\" ReportEntryCustom32=\"str1234\" ReportEntryCustom33=\"str1234\" ReportEntryCustom34=\"str1234\" ReportEntryCustom35=\"str1234\" ReportEntryCustom36=\"str1234\" ReportEntryCustom37=\"str1234\" ReportEntryCustom38=\"str1234\" ReportEntryCustom39=\"str1234\" ReportEntryCustom40=\"str1234\" EntryTransactionAmount=\"str1234\" EntryPostedAmount=\"str1234\" EntryApprovedAmount=\"str1234\" EntryPaymentCode=\"str1234\" EntryPaymentCodeName=\"str1234\" ReportPaymentReimbursementType=\"str1234\" BillDate=\"str1234\" ReportEntryPaymentTypeName=\"str1234\" />\n" +
            "      <CreditCardData BilledCreditCardAccountNumber=\"str1234\" BilledCreditCardDescription=\"str1234\" TransactionJRKey=\"str1234\" REFNO=\"str1234\" CCTKey=\"str1234\" CCTType=\"str1234\" TransactionID=\"str1234\" TransactionAmount=\"str1234\" TransactionTaxAmount=\"str1234\" TransactionCurrency=\"str1234\" TransactionPostedAmount=\"str1234\" TransactionPostedCurrency=\"str1234\" TransactionDate=\"str1234\" TransactionPostedDate=\"str1234\" TransactionDescription=\"str1234\" MCCODE=\"str1234\" TransactionMerchantName=\"str1234\" TransactionMerchantCity=\"str1234\" TransactionMerchantState=\"str1234\" TransactionMerchantCountry=\"str1234\" TransactionMerchantREFNUM=\"str1234\" TransactionBillingType=\"str1234\" BillToEmployeeExchangeRate=\"str1234\" BillingAmount=\"str1234\" IndividualCreditCardAccountNumber=\"str1234\" IndividualCreditCardDescription=\"str1234\" MerchantDoingBusinessAs=\"str1234\" AcquirerReferenceNumber=\"str1234\" />\n" +
            "      <EntryLocationData EntryCountry=\"str1234\" EntryCountrySub=\"str1234\" DomesticForeign=\"str1234\" MarketCode=\"str1234\" ProcessorReferenceNumber=\"str1234\" />\n" +
            "      <JournalEntryData PayerPayType=\"str1234\" PayerPayCode=\"str1234\" PayeePayType=\"str1234\" PayeePayCode=\"str1234\" AccountCode=\"str1234\" DRCR=\"str1234\" JournalAmt=\"str1234\" JournalKey=\"str1234\" />\n" +
            "      <CarMileageData CarBusinessDistance=\"str1234\" CarPersonalDistance=\"str1234\" CarPassengerCount=\"str1234\" VehicleID=\"str1234\" FutureUse=\"str1234\" FutureUse1=\"str1234\" />\n" +
            "      <CashAdvanceData CashAdvanceAmount=\"str1234\" CARequestCurrencyAlphaISO=\"str1234\" CARequestCurrencyNumISO=\"str1234\" CashAdvanceExchangeRate=\"str1234\" CACurrencyAlphaISO=\"str1234\" CACurrencyNumISO=\"str1234\" CashAdvanceIssueDate=\"str1234\" CashAdvancePaymentCode=\"str1234\" CashAdvanceTransactionType=\"str1234\" CashAdvanceRequestDate=\"str1234\" CAKey=\"str1234\" FutureUse=\"str1234\" CashAdvanceReturnsAmount=\"str1234\" CashAdvanceReturnReceived=\"str1234\" CashAdvanceUtilizedAmount=\"str1234\" FutureUse1=\"str1234\" FutureUse2=\"str1234\" FutureUse3=\"str1234\" FutureUse4=\"str1234\" />\n" +
            "      <AllocationData AllocationAllocKey=\"str1234\" AllocationPercentage=\"str1234\" AllocationCustom1-Tipo=\"str1234\" AllocationCustom2-Depto=\"str1234\" AllocationCustom3=\"str1234\" AllocationCustom4=\"str1234\" AllocationCustom5=\"str1234\" AllocationCustom6=\"str1234\" AllocationCustom7=\"str1234\" AllocationCustom8=\"str1234\" AllocationCustom9=\"str1234\" AllocationCustom10=\"str1234\" AllocationCustom11=\"str1234\" AllocationCustom12=\"str1234\" AllocationCustom13=\"str1234\" AllocationCustom14=\"str1234\" AllocationCustom15=\"str1234\" AllocationCustom16=\"str1234\" AllocationCustom17=\"str1234\" AllocationCustom18=\"str1234\" AllocationCustom19=\"str1234\" AllocationCustom20=\"str1234\" FutureUse=\"str1234\" />\n" +
            "      <TravelAllowanceData TAReimbursementtype=\"str1234\" TADisplaylimit=\"str1234\" TAAllowanceLimit=\"str1234\" AllowableThreshold=\"str1234\" TAFixedMealLodgingType=\"str1234\" BaseAmount=\"str1234\" AllowanceAmount=\"str1234\" TAFixedOvernight=\"str1234\" TAFixedBreakfastProvidedFlag=\"str1234\" TAFixedLunchProvidedFlag=\"str1234\" TAFixedDinnerProvidedFlag=\"str1234\" FutureUse-RESforBankAccount=\"str1234\" FutureUse-RESforRoutingNumber=\"str1234\" />\n" +
            "      <VATTaxData Taxauthorityname=\"str1234\" Taxlabel=\"str1234\" Taxtransactionamount=\"str1234\" Taxpostedamount=\"str1234\" Taxsource=\"str1234\" Taxreclaimtransactionamount=\"str1234\" Taxreclaimpostedamount=\"str1234\" Taxcode=\"str1234\" ReclaimDomestic=\"str1234\" Taxadjustedamount=\"str1234\" Taxreclaimadjustedamount=\"str1234\" Taxreclaimcode=\"str1234\" Taxreclaimtransactionadjustedamount=\"str1234\" ReportEntryTaxAllocationReclaimCode=\"str1234\" AuthRequestID=\"str1234\" ReportEntryTotalTaxPostedAmount=\"str1234\" NetTaxAmount=\"str1234\" ReportEntryTotal=\"str1234\" NetAdjusted=\"str1234\" AllocationTotalTaxTransactionAmount=\"str1234\" AllocationTotalTaxPostedAmount=\"str1234\" AllocationTotalTaxReclaimTransactionAmount=\"str1234\" AllocationTotalTaxReclaimPostedAmount=\"str1234\" AllocationTotalTaxReclaimTransactionAdjust=\"str1234\" FutureUse=\"str1234\" FutureUse1=\"str1234\" FutureUse2=\"str1234\" FutureUse3=\"str1234\" FutureUse4=\"str1234\" />\n" +
            "      <AssignedTravelRequestData TravelRequestName=\"str1234\" AuthRequestTotalPostedAmount=\"str1234\" TravelRequestTotalApprovedAmount=\"str1234\" TravelRequestStartDate=\"str1234\" TravelRequestEndDate=\"str1234\" TravelRequestAuthorizedDate=\"str1234\" />\n" +
            "      <FutureUseSection FutureUse=\"str1234\" FutureUse1=\"str1234\" FutureUse2=\"str1234\" />\n" +
            "      <ExpensePayData CashAccountCode=\"str1234\" LiabilityAccountCode=\"str1234\" EstimatedPaymentDate=\"str1234\" FundingTrace=\"str1234\" RequestedDisbursementDate=\"str1234\" FutureUse=\"str1234\" FutureUse1=\"str1234\" FutureUse2=\"str1234\" FutureUse3=\"str1234\" FutureUse4=\"str1234\" />\n" +
            "      <EmployeeBankingData EmployeeBankingAccountisActive=\"str1234\" EmployeeBankingBankAccountType=\"str1234\" EmployeeBankingNameOnAccount=\"str1234\" EmployeeBankingBankName=\"str1234\" EmployeeBankingBankBranchLocation=\"str1234\" EmployeeBankingBankAddressLine1=\"str1234\" EmployeeBankingBankAddressLine2=\"str1234\" EmployeeBankingBankCity=\"str1234\" EmployeeBankingBankRegion=\"str1234\" EmployeeBankingBankPostalCode=\"str1234\" EmployeeBankingBankCountryCode=\"str1234\" EmployeeBankingTaxID=\"str1234\" EmployeeBankingIsResident=\"str1234\" EmployeeBankingAccountStatus=\"str1234\" EmployeeBankingAccountCurrency=\"str1234\" FutureUse=\"str1234\" FutureUse1=\"str1234\" FutureUse2=\"str1234\" FutureUse3=\"str1234\" FutureUse4=\"str1234\" />\n" +
            "      <ReportEntryData ReportEntryLocationCityName=\"str1234\" IsBillable=\"str1234\" ReportEntryFromLocation=\"str1234\" ReportEntryToLocation=\"str1234\" ReportEntryLocationName=\"str1234\" Country=\"str1234\" StateProvince=\"str1234\" UUID=\"str1234\" FutureUse=\"str1234\" FutureUse1=\"str1234\" FutureUse2=\"str1234\" FutureUse3=\"str1234\" FutureUse4=\"str1234\" />\n" +
            "      <RequestData RequestName=\"str1234\" TotalPostedAmount=\"str1234\" TotalApprovedAmount=\"str1234\" StartDate=\"str1234\" EndDate=\"str1234\" AuthorizedDate=\"str1234\" AuthorizationRequestID=\"str1234\" FutureUse=\"str1234\" FutureUse1=\"str1234\" FutureUse2=\"str1234\" FutureUse3=\"str1234\" FutureUse4=\"str1234\" FutureUse5=\"str1234\" FutureUse6=\"str1234\" FutureUse7=\"str1234\" FutureUse8=\"str1234\" FutureUse9=\"str1234\" FutureUse10=\"str1234\" FutureUse11=\"str1234\" FutureUse12=\"str1234\" FutureUse13=\"str1234\" FutureUse14=\"str1234\" FutureUse15=\"str1234\" FutureUse16=\"str1234\" FutureUse17=\"str1234\" FutureUse18=\"str1234\" FutureUse19=\"str1234\" FutureUse20=\"str1234\" FutureUse21=\"str1234\" FutureUse22=\"str1234\" FutureUse23=\"str1234\" FutureUse24=\"str1234\" FutureUse25=\"str1234\" FutureUse26=\"str1234\" FutureUse27=\"str1234\" FutureUse28=\"str1234\" FutureUse29=\"str1234\" FutureUse30=\"str1234\" FutureUse31=\"str1234\" FutureUse32=\"str1234\" FutureUse33=\"str1234\" FutureUse34=\"str1234\" FutureUse35=\"str1234\" FutureUse36=\"str1234\" />\n" +
            "    </Line>\n" + "  </Lines>\n" + "</AbstractConcur>";

        GenerateData data = new GenerateData();
        Object clase = data.GeneratePojo(xmlAbstractConcur);
        //System.out.println(clase.getAbstractConcurHeader().getBatchDate());
        ConfProperties properties;
		
			properties = new ConfProperties();

        String csvPath = properties.getProp().getProperty("ws.esb.concur.csv.path");
        GenerateMapCSV mapeo = new GenerateMapCSV(csvPath, clase);
        mapeo.Genarate();
        mapeo.CreateCSV();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

  
    //obtine string de una ruta de archivo
    public String getStringFile(String rutaFile) throws FileNotFoundException, IOException {
        String stringFile = "";
        FileReader f;
        f = new FileReader(rutaFile);
        BufferedReader b = new BufferedReader(f);
        String line;
        while ((line = b.readLine()) != null) {
            stringFile = stringFile + line + "\n";
        }
        b.close();
        return stringFile;
    }
    //creo o sobreescribe un archivo con un String
    public boolean setStringFile(String stringWrirte, String rutaFile) throws IOException {
        boolean statusSend = false;
        File archivoSalida = new File(rutaFile);
        BufferedWriter bw;
        if (archivoSalida.exists()) {
            try {
                bw = new BufferedWriter(new FileWriter(archivoSalida));
                bw.write(stringWrirte);
                bw.close();
            } catch (IOException e) {
                throw new IOException("Error Reprocess archivo" + rutaFile + e.getMessage());
            }
        } else {
            try {
                bw = new BufferedWriter(new FileWriter(archivoSalida));
                bw.write(stringWrirte);
                bw.close();
            } catch (IOException e) {
                throw new IOException("Error Creating archivo" + rutaFile + e.getMessage());
            }
        }
        return statusSend;
    }
}
