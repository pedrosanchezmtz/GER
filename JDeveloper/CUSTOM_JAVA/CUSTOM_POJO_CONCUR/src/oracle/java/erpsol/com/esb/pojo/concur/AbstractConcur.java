//
// Este archivo ha sido generado por la arquitectura JavaTM para la implantación de la referencia de enlace (JAXB) XML v2.2.8-b130911.1802 
// Visite <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Todas las modificaciones realizadas en este archivo se perderán si se vuelve a compilar el esquema de origen. 
// Generado el: 2020.04.16 a las 07:29:46 PM CDT 
//


package oracle.java.erpsol.com.esb.pojo.concur;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para anonymous complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="AbstractConcurHeader">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;attribute name="Constant" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="Batch_Date" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="Record_Count" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                 &lt;attribute name="Journal_Amount_Hash_Total" type="{http://www.w3.org/2001/XMLSchema}string" />
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *         &lt;element name="Lines">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;sequence>
 *                   &lt;element name="Line" maxOccurs="unbounded">
 *                     &lt;complexType>
 *                       &lt;complexContent>
 *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                           &lt;sequence>
 *                             &lt;element name="BatchData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="Constant" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="BatchID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="BatchDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="SequenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="EmployeeData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="EMPID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="LastName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FirstName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="MI" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="GroupID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ACHBankAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ACHBankRoutingNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeLoginID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeEmailAddress" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse5" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="ReportData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="ReportID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportKey" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Ledger" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReimbursementCurrencyAlphaISE" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="HomeCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportSubmitDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportUserDefinedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportPaymentProcessingDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportImageRequired" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportHasVATEntry" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportHasTAEntry" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportTotalPostAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportTotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportPolicyName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom1-SGAGrouping" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="PersonalExpenses" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TotalAmountClaimed" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AmountDueEmployee" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AmountDueCompanyCard" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AmountNotApproved" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AmountCompanyPaid" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AmountDueCompany" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="PaymentConfirmedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AmountDueEmployee2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AmountDueCompanyCard2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TotalTaxAdjustedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="NetAdjustedTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="EntryData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="EntryId" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EntryTransactionType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ExpenseType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EntryTransactionDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="SpendCurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CurrencyExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ExchangeRateDirection" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="IsPersonal" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EntryDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="VendorName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="VendorDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReceiptReceived" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReceiptType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TotalEmployeeAttendee" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AttendeeCountSpouse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AttendeeCountBusiness" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom1-SGAGrouping" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom2-LG_Transaction_Type" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom3-Location" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom4-ProyectoSN" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom5-Proyecto" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom6-Subcategoría" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom7-RFC-TaxID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom8-Num.Factura" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom21" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom22" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom23" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom24" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom25" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom26" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom27" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom28" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom29" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom30" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom31" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom32" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom33" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom34" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom35" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom36" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom37" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom38" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom39" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryCustom40" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EntryTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EntryPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EntryApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EntryPaymentCode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EntryPaymentCodeName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportPaymentReimbursementType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="BillDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryPaymentTypeName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="CreditCardData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="BilledCreditCardAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="BilledCreditCardDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionJRKey" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="REFNO" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CCTKey" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CCTType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionPostedCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionPostedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="MCCODE" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionMerchantName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionMerchantCity" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionMerchantState" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionMerchantCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionMerchantREFNUM" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TransactionBillingType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="BillToEmployeeExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="BillingAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="IndividualCreditCardAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="IndividualCreditCardDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="MerchantDoingBusinessAs" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AcquirerReferenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="EntryLocationData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="EntryCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EntryCountrySub" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="DomesticForeign" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="MarketCode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ProcessorReferenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="JournalEntryData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="PayerPayType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="PayerPayCode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="PayeePayType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="PayeePayCode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="DRCR" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="JournalAmt" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="JournalKey" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="CarMileageData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="CarBusinessDistance" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CarPersonalDistance" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CarPassengerCount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="VehicleID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="CashAdvanceData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="CashAdvanceAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CARequestCurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CARequestCurrencyNumISO" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CashAdvanceExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CACurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CACurrencyNumISO" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CashAdvanceIssueDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CashAdvancePaymentCode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CashAdvanceTransactionType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CashAdvanceRequestDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CAKey" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CashAdvanceReturnsAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CashAdvanceReturnReceived" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="CashAdvanceUtilizedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="AllocationData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="AllocationAllocKey" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationPercentage" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="TravelAllowanceData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="TAReimbursementtype" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TADisplaylimit" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TAAllowanceLimit" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllowableThreshold" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TAFixedMealLodgingType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="BaseAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllowanceAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TAFixedOvernight" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TAFixedBreakfastProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TAFixedLunchProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TAFixedDinnerProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse-RESforBankAccount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse-RESforRoutingNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="VATTaxData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="Taxauthorityname" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Taxlabel" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Taxtransactionamount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Taxpostedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Taxsource" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Taxreclaimtransactionamount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Taxreclaimpostedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Taxcode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReclaimDomestic" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Taxadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Taxreclaimadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Taxreclaimcode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Taxreclaimtransactionadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryTaxAllocationReclaimCode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AuthRequestID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryTotalTaxPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="NetTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryTotal" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="NetAdjusted" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationTotalTaxTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationTotalTaxPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationTotalTaxReclaimTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationTotalTaxReclaimPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AllocationTotalTaxReclaimTransactionAdjust" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="AssignedTravelRequestData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="TravelRequestName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AuthRequestTotalPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TravelRequestTotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TravelRequestStartDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TravelRequestEndDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TravelRequestAuthorizedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="FutureUseSection">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="ExpensePayData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="CashAccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="LiabilityAccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EstimatedPaymentDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FundingTrace" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="RequestedDisbursementDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="EmployeeBankingData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="EmployeeBankingAccountisActive" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingBankAccountType" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingNameOnAccount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingBankName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingBankBranchLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingBankAddressLine1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingBankAddressLine2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingBankCity" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingBankRegion" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingBankPostalCode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingBankCountryCode" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingTaxID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingIsResident" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingAccountStatus" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EmployeeBankingAccountCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="ReportEntryData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="ReportEntryLocationCityName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="IsBillable" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryFromLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryToLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="ReportEntryLocationName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="Country" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="StateProvince" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="UUID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                             &lt;element name="RequestData">
 *                               &lt;complexType>
 *                                 &lt;complexContent>
 *                                   &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                                     &lt;attribute name="RequestName" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TotalPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="TotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="StartDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="EndDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AuthorizedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="AuthorizationRequestID" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse5" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse6" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse7" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse8" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse9" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse10" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse11" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse12" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse13" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse14" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse15" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse16" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse17" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse18" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse19" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse20" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse21" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse22" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse23" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse24" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse25" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse26" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse27" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse28" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse29" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse30" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse31" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse32" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse33" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse34" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse35" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                     &lt;attribute name="FutureUse36" type="{http://www.w3.org/2001/XMLSchema}string" />
 *                                   &lt;/restriction>
 *                                 &lt;/complexContent>
 *                               &lt;/complexType>
 *                             &lt;/element>
 *                           &lt;/sequence>
 *                         &lt;/restriction>
 *                       &lt;/complexContent>
 *                     &lt;/complexType>
 *                   &lt;/element>
 *                 &lt;/sequence>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "abstractConcurHeader",
    "lines"
})
@XmlRootElement(name = "AbstractConcur")
public class AbstractConcur implements Serializable {

    @XmlElement(name = "AbstractConcurHeader", required = true)
    protected AbstractConcur.AbstractConcurHeader abstractConcurHeader;
    @XmlElement(name = "Lines", required = true)
    protected AbstractConcur.Lines lines;

    /**
     * Obtiene el valor de la propiedad abstractConcurHeader.
     * 
     * @return
     *     possible object is
     *     {@link AbstractConcur.AbstractConcurHeader }
     *     
     */
    public AbstractConcur.AbstractConcurHeader getAbstractConcurHeader() {
        return abstractConcurHeader;
    }

    /**
     * Define el valor de la propiedad abstractConcurHeader.
     * 
     * @param value
     *     allowed object is
     *     {@link AbstractConcur.AbstractConcurHeader }
     *     
     */
    public void setAbstractConcurHeader(AbstractConcur.AbstractConcurHeader value) {
        this.abstractConcurHeader = value;
    }

    /**
     * Obtiene el valor de la propiedad lines.
     * 
     * @return
     *     possible object is
     *     {@link AbstractConcur.Lines }
     *     
     */
    public AbstractConcur.Lines getLines() {
        return lines;
    }

    /**
     * Define el valor de la propiedad lines.
     * 
     * @param value
     *     allowed object is
     *     {@link AbstractConcur.Lines }
     *     
     */
    public void setLines(AbstractConcur.Lines value) {
        this.lines = value;
    }


    /**
     * <p>Clase Java para anonymous complex type.
     * 
     * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
     * 
     * <pre>
     * &lt;complexType>
     *   &lt;complexContent>
     *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *       &lt;attribute name="Constant" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="Batch_Date" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="Record_Count" type="{http://www.w3.org/2001/XMLSchema}string" />
     *       &lt;attribute name="Journal_Amount_Hash_Total" type="{http://www.w3.org/2001/XMLSchema}string" />
     *     &lt;/restriction>
     *   &lt;/complexContent>
     * &lt;/complexType>
     * </pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "")
    public static class AbstractConcurHeader {

        @XmlAttribute(name = "Constant")
        protected String constant;
        @XmlAttribute(name = "Batch_Date")
        protected String batchDate;
        @XmlAttribute(name = "Record_Count")
        protected String recordCount;
        @XmlAttribute(name = "Journal_Amount_Hash_Total")
        protected String journalAmountHashTotal;

        /**
         * Obtiene el valor de la propiedad constant.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getConstant() {
            return constant;
        }

        /**
         * Define el valor de la propiedad constant.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setConstant(String value) {
            this.constant = value;
        }

        /**
         * Obtiene el valor de la propiedad batchDate.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getBatchDate() {
            return batchDate;
        }

        /**
         * Define el valor de la propiedad batchDate.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setBatchDate(String value) {
            this.batchDate = value;
        }

        /**
         * Obtiene el valor de la propiedad recordCount.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getRecordCount() {
            return recordCount;
        }

        /**
         * Define el valor de la propiedad recordCount.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setRecordCount(String value) {
            this.recordCount = value;
        }

        /**
         * Obtiene el valor de la propiedad journalAmountHashTotal.
         * 
         * @return
         *     possible object is
         *     {@link String }
         *     
         */
        public String getJournalAmountHashTotal() {
            return journalAmountHashTotal;
        }

        /**
         * Define el valor de la propiedad journalAmountHashTotal.
         * 
         * @param value
         *     allowed object is
         *     {@link String }
         *     
         */
        public void setJournalAmountHashTotal(String value) {
            this.journalAmountHashTotal = value;
        }

    }


    /**
     * <p>Clase Java para anonymous complex type.
     * 
     * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
     * 
     * <pre>
     * &lt;complexType>
     *   &lt;complexContent>
     *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *       &lt;sequence>
     *         &lt;element name="Line" maxOccurs="unbounded">
     *           &lt;complexType>
     *             &lt;complexContent>
     *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                 &lt;sequence>
     *                   &lt;element name="BatchData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="Constant" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="BatchID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="BatchDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="SequenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="EmployeeData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="EMPID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="LastName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FirstName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="MI" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="GroupID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ACHBankAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ACHBankRoutingNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeLoginID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeEmailAddress" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse5" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="ReportData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="ReportID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportKey" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Ledger" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReimbursementCurrencyAlphaISE" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="HomeCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportSubmitDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportUserDefinedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportPaymentProcessingDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportImageRequired" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportHasVATEntry" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportHasTAEntry" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportTotalPostAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportTotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportPolicyName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom1-SGAGrouping" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="PersonalExpenses" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TotalAmountClaimed" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AmountDueEmployee" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AmountDueCompanyCard" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AmountNotApproved" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AmountCompanyPaid" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AmountDueCompany" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="PaymentConfirmedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AmountDueEmployee2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AmountDueCompanyCard2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TotalTaxAdjustedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="NetAdjustedTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="EntryData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="EntryId" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EntryTransactionType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ExpenseType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EntryTransactionDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="SpendCurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CurrencyExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ExchangeRateDirection" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="IsPersonal" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EntryDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="VendorName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="VendorDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReceiptReceived" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReceiptType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TotalEmployeeAttendee" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AttendeeCountSpouse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AttendeeCountBusiness" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom1-SGAGrouping" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom2-LG_Transaction_Type" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom3-Location" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom4-ProyectoSN" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom5-Proyecto" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom6-Subcategoría" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom7-RFC-TaxID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom8-Num.Factura" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom21" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom22" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom23" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom24" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom25" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom26" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom27" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom28" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom29" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom30" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom31" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom32" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom33" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom34" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom35" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom36" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom37" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom38" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom39" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryCustom40" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EntryTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EntryPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EntryApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EntryPaymentCode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EntryPaymentCodeName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportPaymentReimbursementType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="BillDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryPaymentTypeName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="CreditCardData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="BilledCreditCardAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="BilledCreditCardDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionJRKey" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="REFNO" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CCTKey" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CCTType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionPostedCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionPostedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="MCCODE" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionMerchantName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionMerchantCity" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionMerchantState" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionMerchantCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionMerchantREFNUM" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TransactionBillingType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="BillToEmployeeExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="BillingAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="IndividualCreditCardAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="IndividualCreditCardDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="MerchantDoingBusinessAs" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AcquirerReferenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="EntryLocationData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="EntryCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EntryCountrySub" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="DomesticForeign" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="MarketCode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ProcessorReferenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="JournalEntryData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="PayerPayType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="PayerPayCode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="PayeePayType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="PayeePayCode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="DRCR" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="JournalAmt" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="JournalKey" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="CarMileageData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="CarBusinessDistance" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CarPersonalDistance" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CarPassengerCount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="VehicleID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="CashAdvanceData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="CashAdvanceAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CARequestCurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CARequestCurrencyNumISO" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CashAdvanceExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CACurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CACurrencyNumISO" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CashAdvanceIssueDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CashAdvancePaymentCode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CashAdvanceTransactionType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CashAdvanceRequestDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CAKey" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CashAdvanceReturnsAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CashAdvanceReturnReceived" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="CashAdvanceUtilizedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="AllocationData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="AllocationAllocKey" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationPercentage" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="TravelAllowanceData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="TAReimbursementtype" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TADisplaylimit" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TAAllowanceLimit" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllowableThreshold" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TAFixedMealLodgingType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="BaseAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllowanceAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TAFixedOvernight" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TAFixedBreakfastProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TAFixedLunchProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TAFixedDinnerProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse-RESforBankAccount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse-RESforRoutingNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="VATTaxData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="Taxauthorityname" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Taxlabel" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Taxtransactionamount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Taxpostedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Taxsource" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Taxreclaimtransactionamount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Taxreclaimpostedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Taxcode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReclaimDomestic" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Taxadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Taxreclaimadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Taxreclaimcode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Taxreclaimtransactionadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryTaxAllocationReclaimCode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AuthRequestID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryTotalTaxPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="NetTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryTotal" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="NetAdjusted" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationTotalTaxTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationTotalTaxPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationTotalTaxReclaimTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationTotalTaxReclaimPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AllocationTotalTaxReclaimTransactionAdjust" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="AssignedTravelRequestData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="TravelRequestName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AuthRequestTotalPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TravelRequestTotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TravelRequestStartDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TravelRequestEndDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TravelRequestAuthorizedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="FutureUseSection">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="ExpensePayData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="CashAccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="LiabilityAccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EstimatedPaymentDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FundingTrace" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="RequestedDisbursementDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="EmployeeBankingData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="EmployeeBankingAccountisActive" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingBankAccountType" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingNameOnAccount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingBankName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingBankBranchLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingBankAddressLine1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingBankAddressLine2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingBankCity" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingBankRegion" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingBankPostalCode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingBankCountryCode" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingTaxID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingIsResident" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingAccountStatus" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EmployeeBankingAccountCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="ReportEntryData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="ReportEntryLocationCityName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="IsBillable" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryFromLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryToLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="ReportEntryLocationName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="Country" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="StateProvince" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="UUID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                   &lt;element name="RequestData">
     *                     &lt;complexType>
     *                       &lt;complexContent>
     *                         &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
     *                           &lt;attribute name="RequestName" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TotalPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="TotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="StartDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="EndDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AuthorizedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="AuthorizationRequestID" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse5" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse6" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse7" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse8" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse9" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse10" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse11" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse12" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse13" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse14" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse15" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse16" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse17" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse18" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse19" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse20" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse21" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse22" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse23" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse24" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse25" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse26" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse27" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse28" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse29" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse30" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse31" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse32" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse33" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse34" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse35" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                           &lt;attribute name="FutureUse36" type="{http://www.w3.org/2001/XMLSchema}string" />
     *                         &lt;/restriction>
     *                       &lt;/complexContent>
     *                     &lt;/complexType>
     *                   &lt;/element>
     *                 &lt;/sequence>
     *               &lt;/restriction>
     *             &lt;/complexContent>
     *           &lt;/complexType>
     *         &lt;/element>
     *       &lt;/sequence>
     *     &lt;/restriction>
     *   &lt;/complexContent>
     * &lt;/complexType>
     * </pre>
     * 
     * 
     */
    @XmlAccessorType(XmlAccessType.FIELD)
    @XmlType(name = "", propOrder = {
        "line"
    })
    public static class Lines {

        @XmlElement(name = "Line", required = true)
        protected List<AbstractConcur.Lines.Line> line;

        /**
         * Gets the value of the line property.
         * 
         * <p>
         * This accessor method returns a reference to the live list,
         * not a snapshot. Therefore any modification you make to the
         * returned list will be present inside the JAXB object.
         * This is why there is not a <CODE>set</CODE> method for the line property.
         * 
         * <p>
         * For example, to add a new item, do as follows:
         * <pre>
         *    getLine().add(newItem);
         * </pre>
         * 
         * 
         * <p>
         * Objects of the following type(s) are allowed in the list
         * {@link AbstractConcur.Lines.Line }
         * 
         * 
         */
        public List<AbstractConcur.Lines.Line> getLine() {
            if (line == null) {
                line = new ArrayList<AbstractConcur.Lines.Line>();
            }
            return this.line;
        }


        /**
         * <p>Clase Java para anonymous complex type.
         * 
         * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
         * 
         * <pre>
         * &lt;complexType>
         *   &lt;complexContent>
         *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *       &lt;sequence>
         *         &lt;element name="BatchData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="Constant" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="BatchID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="BatchDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="SequenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="EmployeeData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="EMPID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="LastName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FirstName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="MI" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="GroupID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ACHBankAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ACHBankRoutingNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeLoginID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeEmailAddress" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse5" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="ReportData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="ReportID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportKey" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Ledger" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReimbursementCurrencyAlphaISE" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="HomeCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportSubmitDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportUserDefinedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportPaymentProcessingDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportImageRequired" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportHasVATEntry" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportHasTAEntry" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportTotalPostAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportTotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportPolicyName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom1-SGAGrouping" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="PersonalExpenses" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TotalAmountClaimed" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AmountDueEmployee" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AmountDueCompanyCard" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AmountNotApproved" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AmountCompanyPaid" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AmountDueCompany" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="PaymentConfirmedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AmountDueEmployee2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AmountDueCompanyCard2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TotalTaxAdjustedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="NetAdjustedTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="EntryData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="EntryId" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EntryTransactionType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ExpenseType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EntryTransactionDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="SpendCurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CurrencyExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ExchangeRateDirection" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="IsPersonal" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EntryDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="VendorName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="VendorDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReceiptReceived" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReceiptType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TotalEmployeeAttendee" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AttendeeCountSpouse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AttendeeCountBusiness" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom1-SGAGrouping" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom2-LG_Transaction_Type" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom3-Location" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom4-ProyectoSN" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom5-Proyecto" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom6-Subcategoría" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom7-RFC-TaxID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom8-Num.Factura" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom21" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom22" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom23" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom24" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom25" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom26" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom27" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom28" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom29" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom30" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom31" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom32" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom33" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom34" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom35" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom36" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom37" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom38" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom39" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryCustom40" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EntryTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EntryPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EntryApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EntryPaymentCode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EntryPaymentCodeName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportPaymentReimbursementType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="BillDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryPaymentTypeName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="CreditCardData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="BilledCreditCardAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="BilledCreditCardDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionJRKey" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="REFNO" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CCTKey" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CCTType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionPostedCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionPostedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="MCCODE" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionMerchantName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionMerchantCity" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionMerchantState" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionMerchantCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionMerchantREFNUM" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TransactionBillingType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="BillToEmployeeExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="BillingAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="IndividualCreditCardAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="IndividualCreditCardDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="MerchantDoingBusinessAs" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AcquirerReferenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="EntryLocationData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="EntryCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EntryCountrySub" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="DomesticForeign" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="MarketCode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ProcessorReferenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="JournalEntryData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="PayerPayType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="PayerPayCode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="PayeePayType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="PayeePayCode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="DRCR" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="JournalAmt" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="JournalKey" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="CarMileageData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="CarBusinessDistance" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CarPersonalDistance" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CarPassengerCount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="VehicleID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="CashAdvanceData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="CashAdvanceAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CARequestCurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CARequestCurrencyNumISO" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CashAdvanceExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CACurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CACurrencyNumISO" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CashAdvanceIssueDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CashAdvancePaymentCode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CashAdvanceTransactionType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CashAdvanceRequestDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CAKey" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CashAdvanceReturnsAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CashAdvanceReturnReceived" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="CashAdvanceUtilizedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="AllocationData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="AllocationAllocKey" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationPercentage" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="TravelAllowanceData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="TAReimbursementtype" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TADisplaylimit" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TAAllowanceLimit" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllowableThreshold" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TAFixedMealLodgingType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="BaseAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllowanceAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TAFixedOvernight" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TAFixedBreakfastProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TAFixedLunchProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TAFixedDinnerProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse-RESforBankAccount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse-RESforRoutingNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="VATTaxData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="Taxauthorityname" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Taxlabel" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Taxtransactionamount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Taxpostedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Taxsource" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Taxreclaimtransactionamount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Taxreclaimpostedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Taxcode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReclaimDomestic" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Taxadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Taxreclaimadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Taxreclaimcode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Taxreclaimtransactionadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryTaxAllocationReclaimCode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AuthRequestID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryTotalTaxPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="NetTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryTotal" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="NetAdjusted" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationTotalTaxTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationTotalTaxPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationTotalTaxReclaimTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationTotalTaxReclaimPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AllocationTotalTaxReclaimTransactionAdjust" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="AssignedTravelRequestData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="TravelRequestName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AuthRequestTotalPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TravelRequestTotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TravelRequestStartDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TravelRequestEndDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TravelRequestAuthorizedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="FutureUseSection">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="ExpensePayData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="CashAccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="LiabilityAccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EstimatedPaymentDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FundingTrace" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="RequestedDisbursementDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="EmployeeBankingData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="EmployeeBankingAccountisActive" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingBankAccountType" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingNameOnAccount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingBankName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingBankBranchLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingBankAddressLine1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingBankAddressLine2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingBankCity" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingBankRegion" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingBankPostalCode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingBankCountryCode" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingTaxID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingIsResident" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingAccountStatus" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EmployeeBankingAccountCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="ReportEntryData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="ReportEntryLocationCityName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="IsBillable" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryFromLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryToLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="ReportEntryLocationName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="Country" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="StateProvince" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="UUID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *         &lt;element name="RequestData">
         *           &lt;complexType>
         *             &lt;complexContent>
         *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
         *                 &lt;attribute name="RequestName" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TotalPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="TotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="StartDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="EndDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AuthorizedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="AuthorizationRequestID" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse5" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse6" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse7" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse8" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse9" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse10" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse11" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse12" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse13" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse14" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse15" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse16" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse17" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse18" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse19" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse20" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse21" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse22" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse23" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse24" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse25" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse26" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse27" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse28" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse29" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse30" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse31" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse32" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse33" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse34" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse35" type="{http://www.w3.org/2001/XMLSchema}string" />
         *                 &lt;attribute name="FutureUse36" type="{http://www.w3.org/2001/XMLSchema}string" />
         *               &lt;/restriction>
         *             &lt;/complexContent>
         *           &lt;/complexType>
         *         &lt;/element>
         *       &lt;/sequence>
         *     &lt;/restriction>
         *   &lt;/complexContent>
         * &lt;/complexType>
         * </pre>
         * 
         * 
         */
        @XmlAccessorType(XmlAccessType.FIELD)
        @XmlType(name = "", propOrder = {
            "batchData",
            "employeeData",
            "reportData",
            "entryData",
            "creditCardData",
            "entryLocationData",
            "journalEntryData",
            "carMileageData",
            "cashAdvanceData",
            "allocationData",
            "travelAllowanceData",
            "vatTaxData",
            "assignedTravelRequestData",
            "futureUseSection",
            "expensePayData",
            "employeeBankingData",
            "reportEntryData",
            "requestData"
        })
        public static class Line {

            @XmlElement(name = "BatchData", required = true)
            protected AbstractConcur.Lines.Line.BatchData batchData;
            @XmlElement(name = "EmployeeData", required = true)
            protected AbstractConcur.Lines.Line.EmployeeData employeeData;
            @XmlElement(name = "ReportData", required = true)
            protected AbstractConcur.Lines.Line.ReportData reportData;
            @XmlElement(name = "EntryData", required = true)
            protected AbstractConcur.Lines.Line.EntryData entryData;
            @XmlElement(name = "CreditCardData", required = true)
            protected AbstractConcur.Lines.Line.CreditCardData creditCardData;
            @XmlElement(name = "EntryLocationData", required = true)
            protected AbstractConcur.Lines.Line.EntryLocationData entryLocationData;
            @XmlElement(name = "JournalEntryData", required = true)
            protected AbstractConcur.Lines.Line.JournalEntryData journalEntryData;
            @XmlElement(name = "CarMileageData", required = true)
            protected AbstractConcur.Lines.Line.CarMileageData carMileageData;
            @XmlElement(name = "CashAdvanceData", required = true)
            protected AbstractConcur.Lines.Line.CashAdvanceData cashAdvanceData;
            @XmlElement(name = "AllocationData", required = true)
            protected AbstractConcur.Lines.Line.AllocationData allocationData;
            @XmlElement(name = "TravelAllowanceData", required = true)
            protected AbstractConcur.Lines.Line.TravelAllowanceData travelAllowanceData;
            @XmlElement(name = "VATTaxData", required = true)
            protected AbstractConcur.Lines.Line.VATTaxData vatTaxData;
            @XmlElement(name = "AssignedTravelRequestData", required = true)
            protected AbstractConcur.Lines.Line.AssignedTravelRequestData assignedTravelRequestData;
            @XmlElement(name = "FutureUseSection", required = true)
            protected AbstractConcur.Lines.Line.FutureUseSection futureUseSection;
            @XmlElement(name = "ExpensePayData", required = true)
            protected AbstractConcur.Lines.Line.ExpensePayData expensePayData;
            @XmlElement(name = "EmployeeBankingData", required = true)
            protected AbstractConcur.Lines.Line.EmployeeBankingData employeeBankingData;
            @XmlElement(name = "ReportEntryData", required = true)
            protected AbstractConcur.Lines.Line.ReportEntryData reportEntryData;
            @XmlElement(name = "RequestData", required = true)
            protected AbstractConcur.Lines.Line.RequestData requestData;

            /**
             * Obtiene el valor de la propiedad batchData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.BatchData }
             *     
             */
            public AbstractConcur.Lines.Line.BatchData getBatchData() {
                return batchData;
            }

            /**
             * Define el valor de la propiedad batchData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.BatchData }
             *     
             */
            public void setBatchData(AbstractConcur.Lines.Line.BatchData value) {
                this.batchData = value;
            }

            /**
             * Obtiene el valor de la propiedad employeeData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.EmployeeData }
             *     
             */
            public AbstractConcur.Lines.Line.EmployeeData getEmployeeData() {
                return employeeData;
            }

            /**
             * Define el valor de la propiedad employeeData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.EmployeeData }
             *     
             */
            public void setEmployeeData(AbstractConcur.Lines.Line.EmployeeData value) {
                this.employeeData = value;
            }

            /**
             * Obtiene el valor de la propiedad reportData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.ReportData }
             *     
             */
            public AbstractConcur.Lines.Line.ReportData getReportData() {
                return reportData;
            }

            /**
             * Define el valor de la propiedad reportData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.ReportData }
             *     
             */
            public void setReportData(AbstractConcur.Lines.Line.ReportData value) {
                this.reportData = value;
            }

            /**
             * Obtiene el valor de la propiedad entryData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.EntryData }
             *     
             */
            public AbstractConcur.Lines.Line.EntryData getEntryData() {
                return entryData;
            }

            /**
             * Define el valor de la propiedad entryData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.EntryData }
             *     
             */
            public void setEntryData(AbstractConcur.Lines.Line.EntryData value) {
                this.entryData = value;
            }

            /**
             * Obtiene el valor de la propiedad creditCardData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.CreditCardData }
             *     
             */
            public AbstractConcur.Lines.Line.CreditCardData getCreditCardData() {
                return creditCardData;
            }

            /**
             * Define el valor de la propiedad creditCardData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.CreditCardData }
             *     
             */
            public void setCreditCardData(AbstractConcur.Lines.Line.CreditCardData value) {
                this.creditCardData = value;
            }

            /**
             * Obtiene el valor de la propiedad entryLocationData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.EntryLocationData }
             *     
             */
            public AbstractConcur.Lines.Line.EntryLocationData getEntryLocationData() {
                return entryLocationData;
            }

            /**
             * Define el valor de la propiedad entryLocationData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.EntryLocationData }
             *     
             */
            public void setEntryLocationData(AbstractConcur.Lines.Line.EntryLocationData value) {
                this.entryLocationData = value;
            }

            /**
             * Obtiene el valor de la propiedad journalEntryData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.JournalEntryData }
             *     
             */
            public AbstractConcur.Lines.Line.JournalEntryData getJournalEntryData() {
                return journalEntryData;
            }

            /**
             * Define el valor de la propiedad journalEntryData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.JournalEntryData }
             *     
             */
            public void setJournalEntryData(AbstractConcur.Lines.Line.JournalEntryData value) {
                this.journalEntryData = value;
            }

            /**
             * Obtiene el valor de la propiedad carMileageData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.CarMileageData }
             *     
             */
            public AbstractConcur.Lines.Line.CarMileageData getCarMileageData() {
                return carMileageData;
            }

            /**
             * Define el valor de la propiedad carMileageData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.CarMileageData }
             *     
             */
            public void setCarMileageData(AbstractConcur.Lines.Line.CarMileageData value) {
                this.carMileageData = value;
            }

            /**
             * Obtiene el valor de la propiedad cashAdvanceData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.CashAdvanceData }
             *     
             */
            public AbstractConcur.Lines.Line.CashAdvanceData getCashAdvanceData() {
                return cashAdvanceData;
            }

            /**
             * Define el valor de la propiedad cashAdvanceData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.CashAdvanceData }
             *     
             */
            public void setCashAdvanceData(AbstractConcur.Lines.Line.CashAdvanceData value) {
                this.cashAdvanceData = value;
            }

            /**
             * Obtiene el valor de la propiedad allocationData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.AllocationData }
             *     
             */
            public AbstractConcur.Lines.Line.AllocationData getAllocationData() {
                return allocationData;
            }

            /**
             * Define el valor de la propiedad allocationData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.AllocationData }
             *     
             */
            public void setAllocationData(AbstractConcur.Lines.Line.AllocationData value) {
                this.allocationData = value;
            }

            /**
             * Obtiene el valor de la propiedad travelAllowanceData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.TravelAllowanceData }
             *     
             */
            public AbstractConcur.Lines.Line.TravelAllowanceData getTravelAllowanceData() {
                return travelAllowanceData;
            }

            /**
             * Define el valor de la propiedad travelAllowanceData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.TravelAllowanceData }
             *     
             */
            public void setTravelAllowanceData(AbstractConcur.Lines.Line.TravelAllowanceData value) {
                this.travelAllowanceData = value;
            }

            /**
             * Obtiene el valor de la propiedad vatTaxData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.VATTaxData }
             *     
             */
            public AbstractConcur.Lines.Line.VATTaxData getVATTaxData() {
                return vatTaxData;
            }

            /**
             * Define el valor de la propiedad vatTaxData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.VATTaxData }
             *     
             */
            public void setVATTaxData(AbstractConcur.Lines.Line.VATTaxData value) {
                this.vatTaxData = value;
            }

            /**
             * Obtiene el valor de la propiedad assignedTravelRequestData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.AssignedTravelRequestData }
             *     
             */
            public AbstractConcur.Lines.Line.AssignedTravelRequestData getAssignedTravelRequestData() {
                return assignedTravelRequestData;
            }

            /**
             * Define el valor de la propiedad assignedTravelRequestData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.AssignedTravelRequestData }
             *     
             */
            public void setAssignedTravelRequestData(AbstractConcur.Lines.Line.AssignedTravelRequestData value) {
                this.assignedTravelRequestData = value;
            }

            /**
             * Obtiene el valor de la propiedad futureUseSection.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.FutureUseSection }
             *     
             */
            public AbstractConcur.Lines.Line.FutureUseSection getFutureUseSection() {
                return futureUseSection;
            }

            /**
             * Define el valor de la propiedad futureUseSection.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.FutureUseSection }
             *     
             */
            public void setFutureUseSection(AbstractConcur.Lines.Line.FutureUseSection value) {
                this.futureUseSection = value;
            }

            /**
             * Obtiene el valor de la propiedad expensePayData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.ExpensePayData }
             *     
             */
            public AbstractConcur.Lines.Line.ExpensePayData getExpensePayData() {
                return expensePayData;
            }

            /**
             * Define el valor de la propiedad expensePayData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.ExpensePayData }
             *     
             */
            public void setExpensePayData(AbstractConcur.Lines.Line.ExpensePayData value) {
                this.expensePayData = value;
            }

            /**
             * Obtiene el valor de la propiedad employeeBankingData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.EmployeeBankingData }
             *     
             */
            public AbstractConcur.Lines.Line.EmployeeBankingData getEmployeeBankingData() {
                return employeeBankingData;
            }

            /**
             * Define el valor de la propiedad employeeBankingData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.EmployeeBankingData }
             *     
             */
            public void setEmployeeBankingData(AbstractConcur.Lines.Line.EmployeeBankingData value) {
                this.employeeBankingData = value;
            }

            /**
             * Obtiene el valor de la propiedad reportEntryData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.ReportEntryData }
             *     
             */
            public AbstractConcur.Lines.Line.ReportEntryData getReportEntryData() {
                return reportEntryData;
            }

            /**
             * Define el valor de la propiedad reportEntryData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.ReportEntryData }
             *     
             */
            public void setReportEntryData(AbstractConcur.Lines.Line.ReportEntryData value) {
                this.reportEntryData = value;
            }

            /**
             * Obtiene el valor de la propiedad requestData.
             * 
             * @return
             *     possible object is
             *     {@link AbstractConcur.Lines.Line.RequestData }
             *     
             */
            public AbstractConcur.Lines.Line.RequestData getRequestData() {
                return requestData;
            }

            /**
             * Define el valor de la propiedad requestData.
             * 
             * @param value
             *     allowed object is
             *     {@link AbstractConcur.Lines.Line.RequestData }
             *     
             */
            public void setRequestData(AbstractConcur.Lines.Line.RequestData value) {
                this.requestData = value;
            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="AllocationAllocKey" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationPercentage" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class AllocationData {

                @XmlAttribute(name = "AllocationAllocKey")
                protected String allocationAllocKey;
                @XmlAttribute(name = "AllocationPercentage")
                protected String allocationPercentage;
                @XmlAttribute(name = "AllocationCustom1-Tipo")
                protected String allocationCustom1Tipo;
                @XmlAttribute(name = "AllocationCustom2-Depto")
                protected String allocationCustom2Depto;
                @XmlAttribute(name = "AllocationCustom3")
                protected String allocationCustom3;
                @XmlAttribute(name = "AllocationCustom4")
                protected String allocationCustom4;
                @XmlAttribute(name = "AllocationCustom5")
                protected String allocationCustom5;
                @XmlAttribute(name = "AllocationCustom6")
                protected String allocationCustom6;
                @XmlAttribute(name = "AllocationCustom7")
                protected String allocationCustom7;
                @XmlAttribute(name = "AllocationCustom8")
                protected String allocationCustom8;
                @XmlAttribute(name = "AllocationCustom9")
                protected String allocationCustom9;
                @XmlAttribute(name = "AllocationCustom10")
                protected String allocationCustom10;
                @XmlAttribute(name = "AllocationCustom11")
                protected String allocationCustom11;
                @XmlAttribute(name = "AllocationCustom12")
                protected String allocationCustom12;
                @XmlAttribute(name = "AllocationCustom13")
                protected String allocationCustom13;
                @XmlAttribute(name = "AllocationCustom14")
                protected String allocationCustom14;
                @XmlAttribute(name = "AllocationCustom15")
                protected String allocationCustom15;
                @XmlAttribute(name = "AllocationCustom16")
                protected String allocationCustom16;
                @XmlAttribute(name = "AllocationCustom17")
                protected String allocationCustom17;
                @XmlAttribute(name = "AllocationCustom18")
                protected String allocationCustom18;
                @XmlAttribute(name = "AllocationCustom19")
                protected String allocationCustom19;
                @XmlAttribute(name = "AllocationCustom20")
                protected String allocationCustom20;
                @XmlAttribute(name = "FutureUse")
                protected String futureUse;

                /**
                 * Obtiene el valor de la propiedad allocationAllocKey.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationAllocKey() {
                    return allocationAllocKey;
                }

                /**
                 * Define el valor de la propiedad allocationAllocKey.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationAllocKey(String value) {
                    this.allocationAllocKey = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationPercentage.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationPercentage() {
                    return allocationPercentage;
                }

                /**
                 * Define el valor de la propiedad allocationPercentage.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationPercentage(String value) {
                    this.allocationPercentage = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom1Tipo.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom1Tipo() {
                    return allocationCustom1Tipo;
                }

                /**
                 * Define el valor de la propiedad allocationCustom1Tipo.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom1Tipo(String value) {
                    this.allocationCustom1Tipo = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom2Depto.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom2Depto() {
                    return allocationCustom2Depto;
                }

                /**
                 * Define el valor de la propiedad allocationCustom2Depto.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom2Depto(String value) {
                    this.allocationCustom2Depto = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom3() {
                    return allocationCustom3;
                }

                /**
                 * Define el valor de la propiedad allocationCustom3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom3(String value) {
                    this.allocationCustom3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom4() {
                    return allocationCustom4;
                }

                /**
                 * Define el valor de la propiedad allocationCustom4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom4(String value) {
                    this.allocationCustom4 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom5.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom5() {
                    return allocationCustom5;
                }

                /**
                 * Define el valor de la propiedad allocationCustom5.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom5(String value) {
                    this.allocationCustom5 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom6.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom6() {
                    return allocationCustom6;
                }

                /**
                 * Define el valor de la propiedad allocationCustom6.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom6(String value) {
                    this.allocationCustom6 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom7.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom7() {
                    return allocationCustom7;
                }

                /**
                 * Define el valor de la propiedad allocationCustom7.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom7(String value) {
                    this.allocationCustom7 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom8.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom8() {
                    return allocationCustom8;
                }

                /**
                 * Define el valor de la propiedad allocationCustom8.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom8(String value) {
                    this.allocationCustom8 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom9.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom9() {
                    return allocationCustom9;
                }

                /**
                 * Define el valor de la propiedad allocationCustom9.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom9(String value) {
                    this.allocationCustom9 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom10.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom10() {
                    return allocationCustom10;
                }

                /**
                 * Define el valor de la propiedad allocationCustom10.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom10(String value) {
                    this.allocationCustom10 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom11.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom11() {
                    return allocationCustom11;
                }

                /**
                 * Define el valor de la propiedad allocationCustom11.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom11(String value) {
                    this.allocationCustom11 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom12.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom12() {
                    return allocationCustom12;
                }

                /**
                 * Define el valor de la propiedad allocationCustom12.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom12(String value) {
                    this.allocationCustom12 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom13.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom13() {
                    return allocationCustom13;
                }

                /**
                 * Define el valor de la propiedad allocationCustom13.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom13(String value) {
                    this.allocationCustom13 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom14.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom14() {
                    return allocationCustom14;
                }

                /**
                 * Define el valor de la propiedad allocationCustom14.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom14(String value) {
                    this.allocationCustom14 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom15.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom15() {
                    return allocationCustom15;
                }

                /**
                 * Define el valor de la propiedad allocationCustom15.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom15(String value) {
                    this.allocationCustom15 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom16.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom16() {
                    return allocationCustom16;
                }

                /**
                 * Define el valor de la propiedad allocationCustom16.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom16(String value) {
                    this.allocationCustom16 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom17.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom17() {
                    return allocationCustom17;
                }

                /**
                 * Define el valor de la propiedad allocationCustom17.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom17(String value) {
                    this.allocationCustom17 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom18.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom18() {
                    return allocationCustom18;
                }

                /**
                 * Define el valor de la propiedad allocationCustom18.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom18(String value) {
                    this.allocationCustom18 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom19.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom19() {
                    return allocationCustom19;
                }

                /**
                 * Define el valor de la propiedad allocationCustom19.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom19(String value) {
                    this.allocationCustom19 = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationCustom20.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationCustom20() {
                    return allocationCustom20;
                }

                /**
                 * Define el valor de la propiedad allocationCustom20.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationCustom20(String value) {
                    this.allocationCustom20 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse() {
                    return futureUse;
                }

                /**
                 * Define el valor de la propiedad futureUse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse(String value) {
                    this.futureUse = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="TravelRequestName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AuthRequestTotalPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TravelRequestTotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TravelRequestStartDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TravelRequestEndDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TravelRequestAuthorizedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class AssignedTravelRequestData {

                @XmlAttribute(name = "TravelRequestName")
                protected String travelRequestName;
                @XmlAttribute(name = "AuthRequestTotalPostedAmount")
                protected String authRequestTotalPostedAmount;
                @XmlAttribute(name = "TravelRequestTotalApprovedAmount")
                protected String travelRequestTotalApprovedAmount;
                @XmlAttribute(name = "TravelRequestStartDate")
                protected String travelRequestStartDate;
                @XmlAttribute(name = "TravelRequestEndDate")
                protected String travelRequestEndDate;
                @XmlAttribute(name = "TravelRequestAuthorizedDate")
                protected String travelRequestAuthorizedDate;

                /**
                 * Obtiene el valor de la propiedad travelRequestName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTravelRequestName() {
                    return travelRequestName;
                }

                /**
                 * Define el valor de la propiedad travelRequestName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTravelRequestName(String value) {
                    this.travelRequestName = value;
                }

                /**
                 * Obtiene el valor de la propiedad authRequestTotalPostedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAuthRequestTotalPostedAmount() {
                    return authRequestTotalPostedAmount;
                }

                /**
                 * Define el valor de la propiedad authRequestTotalPostedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAuthRequestTotalPostedAmount(String value) {
                    this.authRequestTotalPostedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad travelRequestTotalApprovedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTravelRequestTotalApprovedAmount() {
                    return travelRequestTotalApprovedAmount;
                }

                /**
                 * Define el valor de la propiedad travelRequestTotalApprovedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTravelRequestTotalApprovedAmount(String value) {
                    this.travelRequestTotalApprovedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad travelRequestStartDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTravelRequestStartDate() {
                    return travelRequestStartDate;
                }

                /**
                 * Define el valor de la propiedad travelRequestStartDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTravelRequestStartDate(String value) {
                    this.travelRequestStartDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad travelRequestEndDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTravelRequestEndDate() {
                    return travelRequestEndDate;
                }

                /**
                 * Define el valor de la propiedad travelRequestEndDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTravelRequestEndDate(String value) {
                    this.travelRequestEndDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad travelRequestAuthorizedDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTravelRequestAuthorizedDate() {
                    return travelRequestAuthorizedDate;
                }

                /**
                 * Define el valor de la propiedad travelRequestAuthorizedDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTravelRequestAuthorizedDate(String value) {
                    this.travelRequestAuthorizedDate = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="Constant" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="BatchID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="BatchDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="SequenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class BatchData {

                @XmlAttribute(name = "Constant")
                protected String constant;
                @XmlAttribute(name = "BatchID")
                protected String batchID;
                @XmlAttribute(name = "BatchDate")
                protected String batchDate;
                @XmlAttribute(name = "SequenceNumber")
                protected String sequenceNumber;

                /**
                 * Obtiene el valor de la propiedad constant.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getConstant() {
                    return constant;
                }

                /**
                 * Define el valor de la propiedad constant.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setConstant(String value) {
                    this.constant = value;
                }

                /**
                 * Obtiene el valor de la propiedad batchID.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getBatchID() {
                    return batchID;
                }

                /**
                 * Define el valor de la propiedad batchID.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setBatchID(String value) {
                    this.batchID = value;
                }

                /**
                 * Obtiene el valor de la propiedad batchDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getBatchDate() {
                    return batchDate;
                }

                /**
                 * Define el valor de la propiedad batchDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setBatchDate(String value) {
                    this.batchDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad sequenceNumber.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getSequenceNumber() {
                    return sequenceNumber;
                }

                /**
                 * Define el valor de la propiedad sequenceNumber.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setSequenceNumber(String value) {
                    this.sequenceNumber = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="CarBusinessDistance" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CarPersonalDistance" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CarPassengerCount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="VehicleID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class CarMileageData {

                @XmlAttribute(name = "CarBusinessDistance")
                protected String carBusinessDistance;
                @XmlAttribute(name = "CarPersonalDistance")
                protected String carPersonalDistance;
                @XmlAttribute(name = "CarPassengerCount")
                protected String carPassengerCount;
                @XmlAttribute(name = "VehicleID")
                protected String vehicleID;
                @XmlAttribute(name = "FutureUse")
                protected String futureUse;
                @XmlAttribute(name = "FutureUse1")
                protected String futureUse1;

                /**
                 * Obtiene el valor de la propiedad carBusinessDistance.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCarBusinessDistance() {
                    return carBusinessDistance;
                }

                /**
                 * Define el valor de la propiedad carBusinessDistance.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCarBusinessDistance(String value) {
                    this.carBusinessDistance = value;
                }

                /**
                 * Obtiene el valor de la propiedad carPersonalDistance.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCarPersonalDistance() {
                    return carPersonalDistance;
                }

                /**
                 * Define el valor de la propiedad carPersonalDistance.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCarPersonalDistance(String value) {
                    this.carPersonalDistance = value;
                }

                /**
                 * Obtiene el valor de la propiedad carPassengerCount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCarPassengerCount() {
                    return carPassengerCount;
                }

                /**
                 * Define el valor de la propiedad carPassengerCount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCarPassengerCount(String value) {
                    this.carPassengerCount = value;
                }

                /**
                 * Obtiene el valor de la propiedad vehicleID.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getVehicleID() {
                    return vehicleID;
                }

                /**
                 * Define el valor de la propiedad vehicleID.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setVehicleID(String value) {
                    this.vehicleID = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse() {
                    return futureUse;
                }

                /**
                 * Define el valor de la propiedad futureUse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse(String value) {
                    this.futureUse = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse1() {
                    return futureUse1;
                }

                /**
                 * Define el valor de la propiedad futureUse1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse1(String value) {
                    this.futureUse1 = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="CashAdvanceAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CARequestCurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CARequestCurrencyNumISO" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CashAdvanceExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CACurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CACurrencyNumISO" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CashAdvanceIssueDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CashAdvancePaymentCode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CashAdvanceTransactionType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CashAdvanceRequestDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CAKey" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CashAdvanceReturnsAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CashAdvanceReturnReceived" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CashAdvanceUtilizedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class CashAdvanceData {

                @XmlAttribute(name = "CashAdvanceAmount")
                protected String cashAdvanceAmount;
                @XmlAttribute(name = "CARequestCurrencyAlphaISO")
                protected String caRequestCurrencyAlphaISO;
                @XmlAttribute(name = "CARequestCurrencyNumISO")
                protected String caRequestCurrencyNumISO;
                @XmlAttribute(name = "CashAdvanceExchangeRate")
                protected String cashAdvanceExchangeRate;
                @XmlAttribute(name = "CACurrencyAlphaISO")
                protected String caCurrencyAlphaISO;
                @XmlAttribute(name = "CACurrencyNumISO")
                protected String caCurrencyNumISO;
                @XmlAttribute(name = "CashAdvanceIssueDate")
                protected String cashAdvanceIssueDate;
                @XmlAttribute(name = "CashAdvancePaymentCode")
                protected String cashAdvancePaymentCode;
                @XmlAttribute(name = "CashAdvanceTransactionType")
                protected String cashAdvanceTransactionType;
                @XmlAttribute(name = "CashAdvanceRequestDate")
                protected String cashAdvanceRequestDate;
                @XmlAttribute(name = "CAKey")
                protected String caKey;
                @XmlAttribute(name = "FutureUse")
                protected String futureUse;
                @XmlAttribute(name = "CashAdvanceReturnsAmount")
                protected String cashAdvanceReturnsAmount;
                @XmlAttribute(name = "CashAdvanceReturnReceived")
                protected String cashAdvanceReturnReceived;
                @XmlAttribute(name = "CashAdvanceUtilizedAmount")
                protected String cashAdvanceUtilizedAmount;
                @XmlAttribute(name = "FutureUse1")
                protected String futureUse1;
                @XmlAttribute(name = "FutureUse2")
                protected String futureUse2;
                @XmlAttribute(name = "FutureUse3")
                protected String futureUse3;
                @XmlAttribute(name = "FutureUse4")
                protected String futureUse4;

                /**
                 * Obtiene el valor de la propiedad cashAdvanceAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCashAdvanceAmount() {
                    return cashAdvanceAmount;
                }

                /**
                 * Define el valor de la propiedad cashAdvanceAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCashAdvanceAmount(String value) {
                    this.cashAdvanceAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad caRequestCurrencyAlphaISO.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCARequestCurrencyAlphaISO() {
                    return caRequestCurrencyAlphaISO;
                }

                /**
                 * Define el valor de la propiedad caRequestCurrencyAlphaISO.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCARequestCurrencyAlphaISO(String value) {
                    this.caRequestCurrencyAlphaISO = value;
                }

                /**
                 * Obtiene el valor de la propiedad caRequestCurrencyNumISO.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCARequestCurrencyNumISO() {
                    return caRequestCurrencyNumISO;
                }

                /**
                 * Define el valor de la propiedad caRequestCurrencyNumISO.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCARequestCurrencyNumISO(String value) {
                    this.caRequestCurrencyNumISO = value;
                }

                /**
                 * Obtiene el valor de la propiedad cashAdvanceExchangeRate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCashAdvanceExchangeRate() {
                    return cashAdvanceExchangeRate;
                }

                /**
                 * Define el valor de la propiedad cashAdvanceExchangeRate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCashAdvanceExchangeRate(String value) {
                    this.cashAdvanceExchangeRate = value;
                }

                /**
                 * Obtiene el valor de la propiedad caCurrencyAlphaISO.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCACurrencyAlphaISO() {
                    return caCurrencyAlphaISO;
                }

                /**
                 * Define el valor de la propiedad caCurrencyAlphaISO.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCACurrencyAlphaISO(String value) {
                    this.caCurrencyAlphaISO = value;
                }

                /**
                 * Obtiene el valor de la propiedad caCurrencyNumISO.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCACurrencyNumISO() {
                    return caCurrencyNumISO;
                }

                /**
                 * Define el valor de la propiedad caCurrencyNumISO.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCACurrencyNumISO(String value) {
                    this.caCurrencyNumISO = value;
                }

                /**
                 * Obtiene el valor de la propiedad cashAdvanceIssueDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCashAdvanceIssueDate() {
                    return cashAdvanceIssueDate;
                }

                /**
                 * Define el valor de la propiedad cashAdvanceIssueDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCashAdvanceIssueDate(String value) {
                    this.cashAdvanceIssueDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad cashAdvancePaymentCode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCashAdvancePaymentCode() {
                    return cashAdvancePaymentCode;
                }

                /**
                 * Define el valor de la propiedad cashAdvancePaymentCode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCashAdvancePaymentCode(String value) {
                    this.cashAdvancePaymentCode = value;
                }

                /**
                 * Obtiene el valor de la propiedad cashAdvanceTransactionType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCashAdvanceTransactionType() {
                    return cashAdvanceTransactionType;
                }

                /**
                 * Define el valor de la propiedad cashAdvanceTransactionType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCashAdvanceTransactionType(String value) {
                    this.cashAdvanceTransactionType = value;
                }

                /**
                 * Obtiene el valor de la propiedad cashAdvanceRequestDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCashAdvanceRequestDate() {
                    return cashAdvanceRequestDate;
                }

                /**
                 * Define el valor de la propiedad cashAdvanceRequestDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCashAdvanceRequestDate(String value) {
                    this.cashAdvanceRequestDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad caKey.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCAKey() {
                    return caKey;
                }

                /**
                 * Define el valor de la propiedad caKey.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCAKey(String value) {
                    this.caKey = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse() {
                    return futureUse;
                }

                /**
                 * Define el valor de la propiedad futureUse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse(String value) {
                    this.futureUse = value;
                }

                /**
                 * Obtiene el valor de la propiedad cashAdvanceReturnsAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCashAdvanceReturnsAmount() {
                    return cashAdvanceReturnsAmount;
                }

                /**
                 * Define el valor de la propiedad cashAdvanceReturnsAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCashAdvanceReturnsAmount(String value) {
                    this.cashAdvanceReturnsAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad cashAdvanceReturnReceived.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCashAdvanceReturnReceived() {
                    return cashAdvanceReturnReceived;
                }

                /**
                 * Define el valor de la propiedad cashAdvanceReturnReceived.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCashAdvanceReturnReceived(String value) {
                    this.cashAdvanceReturnReceived = value;
                }

                /**
                 * Obtiene el valor de la propiedad cashAdvanceUtilizedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCashAdvanceUtilizedAmount() {
                    return cashAdvanceUtilizedAmount;
                }

                /**
                 * Define el valor de la propiedad cashAdvanceUtilizedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCashAdvanceUtilizedAmount(String value) {
                    this.cashAdvanceUtilizedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse1() {
                    return futureUse1;
                }

                /**
                 * Define el valor de la propiedad futureUse1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse1(String value) {
                    this.futureUse1 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse2() {
                    return futureUse2;
                }

                /**
                 * Define el valor de la propiedad futureUse2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse2(String value) {
                    this.futureUse2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse3() {
                    return futureUse3;
                }

                /**
                 * Define el valor de la propiedad futureUse3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse3(String value) {
                    this.futureUse3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse4() {
                    return futureUse4;
                }

                /**
                 * Define el valor de la propiedad futureUse4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse4(String value) {
                    this.futureUse4 = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="BilledCreditCardAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="BilledCreditCardDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionJRKey" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="REFNO" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CCTKey" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CCTType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionPostedCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionPostedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="MCCODE" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionMerchantName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionMerchantCity" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionMerchantState" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionMerchantCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionMerchantREFNUM" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TransactionBillingType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="BillToEmployeeExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="BillingAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="IndividualCreditCardAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="IndividualCreditCardDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="MerchantDoingBusinessAs" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AcquirerReferenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class CreditCardData {

                @XmlAttribute(name = "BilledCreditCardAccountNumber")
                protected String billedCreditCardAccountNumber;
                @XmlAttribute(name = "BilledCreditCardDescription")
                protected String billedCreditCardDescription;
                @XmlAttribute(name = "TransactionJRKey")
                protected String transactionJRKey;
                @XmlAttribute(name = "REFNO")
                protected String refno;
                @XmlAttribute(name = "CCTKey")
                protected String cctKey;
                @XmlAttribute(name = "CCTType")
                protected String cctType;
                @XmlAttribute(name = "TransactionID")
                protected String transactionID;
                @XmlAttribute(name = "TransactionAmount")
                protected String transactionAmount;
                @XmlAttribute(name = "TransactionTaxAmount")
                protected String transactionTaxAmount;
                @XmlAttribute(name = "TransactionCurrency")
                protected String transactionCurrency;
                @XmlAttribute(name = "TransactionPostedAmount")
                protected String transactionPostedAmount;
                @XmlAttribute(name = "TransactionPostedCurrency")
                protected String transactionPostedCurrency;
                @XmlAttribute(name = "TransactionDate")
                protected String transactionDate;
                @XmlAttribute(name = "TransactionPostedDate")
                protected String transactionPostedDate;
                @XmlAttribute(name = "TransactionDescription")
                protected String transactionDescription;
                @XmlAttribute(name = "MCCODE")
                protected String mccode;
                @XmlAttribute(name = "TransactionMerchantName")
                protected String transactionMerchantName;
                @XmlAttribute(name = "TransactionMerchantCity")
                protected String transactionMerchantCity;
                @XmlAttribute(name = "TransactionMerchantState")
                protected String transactionMerchantState;
                @XmlAttribute(name = "TransactionMerchantCountry")
                protected String transactionMerchantCountry;
                @XmlAttribute(name = "TransactionMerchantREFNUM")
                protected String transactionMerchantREFNUM;
                @XmlAttribute(name = "TransactionBillingType")
                protected String transactionBillingType;
                @XmlAttribute(name = "BillToEmployeeExchangeRate")
                protected String billToEmployeeExchangeRate;
                @XmlAttribute(name = "BillingAmount")
                protected String billingAmount;
                @XmlAttribute(name = "IndividualCreditCardAccountNumber")
                protected String individualCreditCardAccountNumber;
                @XmlAttribute(name = "IndividualCreditCardDescription")
                protected String individualCreditCardDescription;
                @XmlAttribute(name = "MerchantDoingBusinessAs")
                protected String merchantDoingBusinessAs;
                @XmlAttribute(name = "AcquirerReferenceNumber")
                protected String acquirerReferenceNumber;

                /**
                 * Obtiene el valor de la propiedad billedCreditCardAccountNumber.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getBilledCreditCardAccountNumber() {
                    return billedCreditCardAccountNumber;
                }

                /**
                 * Define el valor de la propiedad billedCreditCardAccountNumber.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setBilledCreditCardAccountNumber(String value) {
                    this.billedCreditCardAccountNumber = value;
                }

                /**
                 * Obtiene el valor de la propiedad billedCreditCardDescription.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getBilledCreditCardDescription() {
                    return billedCreditCardDescription;
                }

                /**
                 * Define el valor de la propiedad billedCreditCardDescription.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setBilledCreditCardDescription(String value) {
                    this.billedCreditCardDescription = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionJRKey.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionJRKey() {
                    return transactionJRKey;
                }

                /**
                 * Define el valor de la propiedad transactionJRKey.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionJRKey(String value) {
                    this.transactionJRKey = value;
                }

                /**
                 * Obtiene el valor de la propiedad refno.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getREFNO() {
                    return refno;
                }

                /**
                 * Define el valor de la propiedad refno.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setREFNO(String value) {
                    this.refno = value;
                }

                /**
                 * Obtiene el valor de la propiedad cctKey.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCCTKey() {
                    return cctKey;
                }

                /**
                 * Define el valor de la propiedad cctKey.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCCTKey(String value) {
                    this.cctKey = value;
                }

                /**
                 * Obtiene el valor de la propiedad cctType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCCTType() {
                    return cctType;
                }

                /**
                 * Define el valor de la propiedad cctType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCCTType(String value) {
                    this.cctType = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionID.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionID() {
                    return transactionID;
                }

                /**
                 * Define el valor de la propiedad transactionID.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionID(String value) {
                    this.transactionID = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionAmount() {
                    return transactionAmount;
                }

                /**
                 * Define el valor de la propiedad transactionAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionAmount(String value) {
                    this.transactionAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionTaxAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionTaxAmount() {
                    return transactionTaxAmount;
                }

                /**
                 * Define el valor de la propiedad transactionTaxAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionTaxAmount(String value) {
                    this.transactionTaxAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionCurrency.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionCurrency() {
                    return transactionCurrency;
                }

                /**
                 * Define el valor de la propiedad transactionCurrency.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionCurrency(String value) {
                    this.transactionCurrency = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionPostedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionPostedAmount() {
                    return transactionPostedAmount;
                }

                /**
                 * Define el valor de la propiedad transactionPostedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionPostedAmount(String value) {
                    this.transactionPostedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionPostedCurrency.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionPostedCurrency() {
                    return transactionPostedCurrency;
                }

                /**
                 * Define el valor de la propiedad transactionPostedCurrency.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionPostedCurrency(String value) {
                    this.transactionPostedCurrency = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionDate() {
                    return transactionDate;
                }

                /**
                 * Define el valor de la propiedad transactionDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionDate(String value) {
                    this.transactionDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionPostedDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionPostedDate() {
                    return transactionPostedDate;
                }

                /**
                 * Define el valor de la propiedad transactionPostedDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionPostedDate(String value) {
                    this.transactionPostedDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionDescription.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionDescription() {
                    return transactionDescription;
                }

                /**
                 * Define el valor de la propiedad transactionDescription.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionDescription(String value) {
                    this.transactionDescription = value;
                }

                /**
                 * Obtiene el valor de la propiedad mccode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getMCCODE() {
                    return mccode;
                }

                /**
                 * Define el valor de la propiedad mccode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setMCCODE(String value) {
                    this.mccode = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionMerchantName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionMerchantName() {
                    return transactionMerchantName;
                }

                /**
                 * Define el valor de la propiedad transactionMerchantName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionMerchantName(String value) {
                    this.transactionMerchantName = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionMerchantCity.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionMerchantCity() {
                    return transactionMerchantCity;
                }

                /**
                 * Define el valor de la propiedad transactionMerchantCity.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionMerchantCity(String value) {
                    this.transactionMerchantCity = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionMerchantState.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionMerchantState() {
                    return transactionMerchantState;
                }

                /**
                 * Define el valor de la propiedad transactionMerchantState.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionMerchantState(String value) {
                    this.transactionMerchantState = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionMerchantCountry.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionMerchantCountry() {
                    return transactionMerchantCountry;
                }

                /**
                 * Define el valor de la propiedad transactionMerchantCountry.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionMerchantCountry(String value) {
                    this.transactionMerchantCountry = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionMerchantREFNUM.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionMerchantREFNUM() {
                    return transactionMerchantREFNUM;
                }

                /**
                 * Define el valor de la propiedad transactionMerchantREFNUM.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionMerchantREFNUM(String value) {
                    this.transactionMerchantREFNUM = value;
                }

                /**
                 * Obtiene el valor de la propiedad transactionBillingType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTransactionBillingType() {
                    return transactionBillingType;
                }

                /**
                 * Define el valor de la propiedad transactionBillingType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTransactionBillingType(String value) {
                    this.transactionBillingType = value;
                }

                /**
                 * Obtiene el valor de la propiedad billToEmployeeExchangeRate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getBillToEmployeeExchangeRate() {
                    return billToEmployeeExchangeRate;
                }

                /**
                 * Define el valor de la propiedad billToEmployeeExchangeRate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setBillToEmployeeExchangeRate(String value) {
                    this.billToEmployeeExchangeRate = value;
                }

                /**
                 * Obtiene el valor de la propiedad billingAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getBillingAmount() {
                    return billingAmount;
                }

                /**
                 * Define el valor de la propiedad billingAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setBillingAmount(String value) {
                    this.billingAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad individualCreditCardAccountNumber.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getIndividualCreditCardAccountNumber() {
                    return individualCreditCardAccountNumber;
                }

                /**
                 * Define el valor de la propiedad individualCreditCardAccountNumber.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setIndividualCreditCardAccountNumber(String value) {
                    this.individualCreditCardAccountNumber = value;
                }

                /**
                 * Obtiene el valor de la propiedad individualCreditCardDescription.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getIndividualCreditCardDescription() {
                    return individualCreditCardDescription;
                }

                /**
                 * Define el valor de la propiedad individualCreditCardDescription.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setIndividualCreditCardDescription(String value) {
                    this.individualCreditCardDescription = value;
                }

                /**
                 * Obtiene el valor de la propiedad merchantDoingBusinessAs.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getMerchantDoingBusinessAs() {
                    return merchantDoingBusinessAs;
                }

                /**
                 * Define el valor de la propiedad merchantDoingBusinessAs.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setMerchantDoingBusinessAs(String value) {
                    this.merchantDoingBusinessAs = value;
                }

                /**
                 * Obtiene el valor de la propiedad acquirerReferenceNumber.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAcquirerReferenceNumber() {
                    return acquirerReferenceNumber;
                }

                /**
                 * Define el valor de la propiedad acquirerReferenceNumber.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAcquirerReferenceNumber(String value) {
                    this.acquirerReferenceNumber = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="EmployeeBankingAccountisActive" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingBankAccountType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingNameOnAccount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingBankName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingBankBranchLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingBankAddressLine1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingBankAddressLine2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingBankCity" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingBankRegion" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingBankPostalCode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingBankCountryCode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingTaxID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingIsResident" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingAccountStatus" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeBankingAccountCurrency" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class EmployeeBankingData {

                @XmlAttribute(name = "EmployeeBankingAccountisActive")
                protected String employeeBankingAccountisActive;
                @XmlAttribute(name = "EmployeeBankingBankAccountType")
                protected String employeeBankingBankAccountType;
                @XmlAttribute(name = "EmployeeBankingNameOnAccount")
                protected String employeeBankingNameOnAccount;
                @XmlAttribute(name = "EmployeeBankingBankName")
                protected String employeeBankingBankName;
                @XmlAttribute(name = "EmployeeBankingBankBranchLocation")
                protected String employeeBankingBankBranchLocation;
                @XmlAttribute(name = "EmployeeBankingBankAddressLine1")
                protected String employeeBankingBankAddressLine1;
                @XmlAttribute(name = "EmployeeBankingBankAddressLine2")
                protected String employeeBankingBankAddressLine2;
                @XmlAttribute(name = "EmployeeBankingBankCity")
                protected String employeeBankingBankCity;
                @XmlAttribute(name = "EmployeeBankingBankRegion")
                protected String employeeBankingBankRegion;
                @XmlAttribute(name = "EmployeeBankingBankPostalCode")
                protected String employeeBankingBankPostalCode;
                @XmlAttribute(name = "EmployeeBankingBankCountryCode")
                protected String employeeBankingBankCountryCode;
                @XmlAttribute(name = "EmployeeBankingTaxID")
                protected String employeeBankingTaxID;
                @XmlAttribute(name = "EmployeeBankingIsResident")
                protected String employeeBankingIsResident;
                @XmlAttribute(name = "EmployeeBankingAccountStatus")
                protected String employeeBankingAccountStatus;
                @XmlAttribute(name = "EmployeeBankingAccountCurrency")
                protected String employeeBankingAccountCurrency;
                @XmlAttribute(name = "FutureUse")
                protected String futureUse;
                @XmlAttribute(name = "FutureUse1")
                protected String futureUse1;
                @XmlAttribute(name = "FutureUse2")
                protected String futureUse2;
                @XmlAttribute(name = "FutureUse3")
                protected String futureUse3;
                @XmlAttribute(name = "FutureUse4")
                protected String futureUse4;

                /**
                 * Obtiene el valor de la propiedad employeeBankingAccountisActive.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingAccountisActive() {
                    return employeeBankingAccountisActive;
                }

                /**
                 * Define el valor de la propiedad employeeBankingAccountisActive.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingAccountisActive(String value) {
                    this.employeeBankingAccountisActive = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingBankAccountType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingBankAccountType() {
                    return employeeBankingBankAccountType;
                }

                /**
                 * Define el valor de la propiedad employeeBankingBankAccountType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingBankAccountType(String value) {
                    this.employeeBankingBankAccountType = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingNameOnAccount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingNameOnAccount() {
                    return employeeBankingNameOnAccount;
                }

                /**
                 * Define el valor de la propiedad employeeBankingNameOnAccount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingNameOnAccount(String value) {
                    this.employeeBankingNameOnAccount = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingBankName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingBankName() {
                    return employeeBankingBankName;
                }

                /**
                 * Define el valor de la propiedad employeeBankingBankName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingBankName(String value) {
                    this.employeeBankingBankName = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingBankBranchLocation.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingBankBranchLocation() {
                    return employeeBankingBankBranchLocation;
                }

                /**
                 * Define el valor de la propiedad employeeBankingBankBranchLocation.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingBankBranchLocation(String value) {
                    this.employeeBankingBankBranchLocation = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingBankAddressLine1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingBankAddressLine1() {
                    return employeeBankingBankAddressLine1;
                }

                /**
                 * Define el valor de la propiedad employeeBankingBankAddressLine1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingBankAddressLine1(String value) {
                    this.employeeBankingBankAddressLine1 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingBankAddressLine2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingBankAddressLine2() {
                    return employeeBankingBankAddressLine2;
                }

                /**
                 * Define el valor de la propiedad employeeBankingBankAddressLine2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingBankAddressLine2(String value) {
                    this.employeeBankingBankAddressLine2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingBankCity.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingBankCity() {
                    return employeeBankingBankCity;
                }

                /**
                 * Define el valor de la propiedad employeeBankingBankCity.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingBankCity(String value) {
                    this.employeeBankingBankCity = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingBankRegion.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingBankRegion() {
                    return employeeBankingBankRegion;
                }

                /**
                 * Define el valor de la propiedad employeeBankingBankRegion.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingBankRegion(String value) {
                    this.employeeBankingBankRegion = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingBankPostalCode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingBankPostalCode() {
                    return employeeBankingBankPostalCode;
                }

                /**
                 * Define el valor de la propiedad employeeBankingBankPostalCode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingBankPostalCode(String value) {
                    this.employeeBankingBankPostalCode = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingBankCountryCode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingBankCountryCode() {
                    return employeeBankingBankCountryCode;
                }

                /**
                 * Define el valor de la propiedad employeeBankingBankCountryCode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingBankCountryCode(String value) {
                    this.employeeBankingBankCountryCode = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingTaxID.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingTaxID() {
                    return employeeBankingTaxID;
                }

                /**
                 * Define el valor de la propiedad employeeBankingTaxID.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingTaxID(String value) {
                    this.employeeBankingTaxID = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingIsResident.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingIsResident() {
                    return employeeBankingIsResident;
                }

                /**
                 * Define el valor de la propiedad employeeBankingIsResident.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingIsResident(String value) {
                    this.employeeBankingIsResident = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingAccountStatus.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingAccountStatus() {
                    return employeeBankingAccountStatus;
                }

                /**
                 * Define el valor de la propiedad employeeBankingAccountStatus.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingAccountStatus(String value) {
                    this.employeeBankingAccountStatus = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeBankingAccountCurrency.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeBankingAccountCurrency() {
                    return employeeBankingAccountCurrency;
                }

                /**
                 * Define el valor de la propiedad employeeBankingAccountCurrency.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeBankingAccountCurrency(String value) {
                    this.employeeBankingAccountCurrency = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse() {
                    return futureUse;
                }

                /**
                 * Define el valor de la propiedad futureUse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse(String value) {
                    this.futureUse = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse1() {
                    return futureUse1;
                }

                /**
                 * Define el valor de la propiedad futureUse1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse1(String value) {
                    this.futureUse1 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse2() {
                    return futureUse2;
                }

                /**
                 * Define el valor de la propiedad futureUse2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse2(String value) {
                    this.futureUse2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse3() {
                    return futureUse3;
                }

                /**
                 * Define el valor de la propiedad futureUse3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse3(String value) {
                    this.futureUse3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse4() {
                    return futureUse4;
                }

                /**
                 * Define el valor de la propiedad futureUse4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse4(String value) {
                    this.futureUse4 = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="EMPID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="LastName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FirstName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="MI" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="GroupID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ACHBankAccountNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ACHBankRoutingNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeLoginID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeEmailAddress" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EmployeeCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse5" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class EmployeeData {

                @XmlAttribute(name = "EMPID")
                protected String empid;
                @XmlAttribute(name = "LastName")
                protected String lastName;
                @XmlAttribute(name = "FirstName")
                protected String firstName;
                @XmlAttribute(name = "MI")
                protected String mi;
                @XmlAttribute(name = "GroupID")
                protected String groupID;
                @XmlAttribute(name = "EmployeeOrgUnit1-Tipo")
                protected String employeeOrgUnit1Tipo;
                @XmlAttribute(name = "EmployeeOrgUnit2-Depto")
                protected String employeeOrgUnit2Depto;
                @XmlAttribute(name = "EmployeeOrgUnit3")
                protected String employeeOrgUnit3;
                @XmlAttribute(name = "EmployeeOrgUnit4")
                protected String employeeOrgUnit4;
                @XmlAttribute(name = "EmployeeOrgUnit5")
                protected String employeeOrgUnit5;
                @XmlAttribute(name = "EmployeeOrgUnit6")
                protected String employeeOrgUnit6;
                @XmlAttribute(name = "ACHBankAccountNumber")
                protected String achBankAccountNumber;
                @XmlAttribute(name = "ACHBankRoutingNumber")
                protected String achBankRoutingNumber;
                @XmlAttribute(name = "FutureUse")
                protected String futureUse;
                @XmlAttribute(name = "EmployeeLoginID")
                protected String employeeLoginID;
                @XmlAttribute(name = "EmployeeEmailAddress")
                protected String employeeEmailAddress;
                @XmlAttribute(name = "EmployeeCustom1")
                protected String employeeCustom1;
                @XmlAttribute(name = "EmployeeCustom2")
                protected String employeeCustom2;
                @XmlAttribute(name = "EmployeeCustom3")
                protected String employeeCustom3;
                @XmlAttribute(name = "EmployeeCustom4")
                protected String employeeCustom4;
                @XmlAttribute(name = "EmployeeCustom5")
                protected String employeeCustom5;
                @XmlAttribute(name = "EmployeeCustom6")
                protected String employeeCustom6;
                @XmlAttribute(name = "EmployeeCustom7")
                protected String employeeCustom7;
                @XmlAttribute(name = "EmployeeCustom8")
                protected String employeeCustom8;
                @XmlAttribute(name = "EmployeeCustom9")
                protected String employeeCustom9;
                @XmlAttribute(name = "EmployeeCustom10")
                protected String employeeCustom10;
                @XmlAttribute(name = "EmployeeCustom11")
                protected String employeeCustom11;
                @XmlAttribute(name = "EmployeeCustom12")
                protected String employeeCustom12;
                @XmlAttribute(name = "EmployeeCustom13")
                protected String employeeCustom13;
                @XmlAttribute(name = "EmployeeCustom14")
                protected String employeeCustom14;
                @XmlAttribute(name = "EmployeeCustom15")
                protected String employeeCustom15;
                @XmlAttribute(name = "EmployeeCustom16")
                protected String employeeCustom16;
                @XmlAttribute(name = "EmployeeCustom17")
                protected String employeeCustom17;
                @XmlAttribute(name = "EmployeeCustom18")
                protected String employeeCustom18;
                @XmlAttribute(name = "EmployeeCustom19")
                protected String employeeCustom19;
                @XmlAttribute(name = "EmployeeCustom20")
                protected String employeeCustom20;
                @XmlAttribute(name = "FutureUse1")
                protected String futureUse1;
                @XmlAttribute(name = "FutureUse2")
                protected String futureUse2;
                @XmlAttribute(name = "FutureUse3")
                protected String futureUse3;
                @XmlAttribute(name = "FutureUse4")
                protected String futureUse4;
                @XmlAttribute(name = "FutureUse5")
                protected String futureUse5;

                /**
                 * Obtiene el valor de la propiedad empid.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEMPID() {
                    return empid;
                }

                /**
                 * Define el valor de la propiedad empid.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEMPID(String value) {
                    this.empid = value;
                }

                /**
                 * Obtiene el valor de la propiedad lastName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getLastName() {
                    return lastName;
                }

                /**
                 * Define el valor de la propiedad lastName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setLastName(String value) {
                    this.lastName = value;
                }

                /**
                 * Obtiene el valor de la propiedad firstName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFirstName() {
                    return firstName;
                }

                /**
                 * Define el valor de la propiedad firstName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFirstName(String value) {
                    this.firstName = value;
                }

                /**
                 * Obtiene el valor de la propiedad mi.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getMI() {
                    return mi;
                }

                /**
                 * Define el valor de la propiedad mi.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setMI(String value) {
                    this.mi = value;
                }

                /**
                 * Obtiene el valor de la propiedad groupID.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getGroupID() {
                    return groupID;
                }

                /**
                 * Define el valor de la propiedad groupID.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setGroupID(String value) {
                    this.groupID = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeOrgUnit1Tipo.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeOrgUnit1Tipo() {
                    return employeeOrgUnit1Tipo;
                }

                /**
                 * Define el valor de la propiedad employeeOrgUnit1Tipo.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeOrgUnit1Tipo(String value) {
                    this.employeeOrgUnit1Tipo = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeOrgUnit2Depto.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeOrgUnit2Depto() {
                    return employeeOrgUnit2Depto;
                }

                /**
                 * Define el valor de la propiedad employeeOrgUnit2Depto.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeOrgUnit2Depto(String value) {
                    this.employeeOrgUnit2Depto = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeOrgUnit3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeOrgUnit3() {
                    return employeeOrgUnit3;
                }

                /**
                 * Define el valor de la propiedad employeeOrgUnit3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeOrgUnit3(String value) {
                    this.employeeOrgUnit3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeOrgUnit4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeOrgUnit4() {
                    return employeeOrgUnit4;
                }

                /**
                 * Define el valor de la propiedad employeeOrgUnit4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeOrgUnit4(String value) {
                    this.employeeOrgUnit4 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeOrgUnit5.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeOrgUnit5() {
                    return employeeOrgUnit5;
                }

                /**
                 * Define el valor de la propiedad employeeOrgUnit5.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeOrgUnit5(String value) {
                    this.employeeOrgUnit5 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeOrgUnit6.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeOrgUnit6() {
                    return employeeOrgUnit6;
                }

                /**
                 * Define el valor de la propiedad employeeOrgUnit6.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeOrgUnit6(String value) {
                    this.employeeOrgUnit6 = value;
                }

                /**
                 * Obtiene el valor de la propiedad achBankAccountNumber.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getACHBankAccountNumber() {
                    return achBankAccountNumber;
                }

                /**
                 * Define el valor de la propiedad achBankAccountNumber.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setACHBankAccountNumber(String value) {
                    this.achBankAccountNumber = value;
                }

                /**
                 * Obtiene el valor de la propiedad achBankRoutingNumber.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getACHBankRoutingNumber() {
                    return achBankRoutingNumber;
                }

                /**
                 * Define el valor de la propiedad achBankRoutingNumber.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setACHBankRoutingNumber(String value) {
                    this.achBankRoutingNumber = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse() {
                    return futureUse;
                }

                /**
                 * Define el valor de la propiedad futureUse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse(String value) {
                    this.futureUse = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeLoginID.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeLoginID() {
                    return employeeLoginID;
                }

                /**
                 * Define el valor de la propiedad employeeLoginID.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeLoginID(String value) {
                    this.employeeLoginID = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeEmailAddress.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeEmailAddress() {
                    return employeeEmailAddress;
                }

                /**
                 * Define el valor de la propiedad employeeEmailAddress.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeEmailAddress(String value) {
                    this.employeeEmailAddress = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom1() {
                    return employeeCustom1;
                }

                /**
                 * Define el valor de la propiedad employeeCustom1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom1(String value) {
                    this.employeeCustom1 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom2() {
                    return employeeCustom2;
                }

                /**
                 * Define el valor de la propiedad employeeCustom2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom2(String value) {
                    this.employeeCustom2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom3() {
                    return employeeCustom3;
                }

                /**
                 * Define el valor de la propiedad employeeCustom3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom3(String value) {
                    this.employeeCustom3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom4() {
                    return employeeCustom4;
                }

                /**
                 * Define el valor de la propiedad employeeCustom4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom4(String value) {
                    this.employeeCustom4 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom5.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom5() {
                    return employeeCustom5;
                }

                /**
                 * Define el valor de la propiedad employeeCustom5.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom5(String value) {
                    this.employeeCustom5 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom6.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom6() {
                    return employeeCustom6;
                }

                /**
                 * Define el valor de la propiedad employeeCustom6.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom6(String value) {
                    this.employeeCustom6 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom7.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom7() {
                    return employeeCustom7;
                }

                /**
                 * Define el valor de la propiedad employeeCustom7.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom7(String value) {
                    this.employeeCustom7 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom8.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom8() {
                    return employeeCustom8;
                }

                /**
                 * Define el valor de la propiedad employeeCustom8.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom8(String value) {
                    this.employeeCustom8 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom9.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom9() {
                    return employeeCustom9;
                }

                /**
                 * Define el valor de la propiedad employeeCustom9.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom9(String value) {
                    this.employeeCustom9 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom10.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom10() {
                    return employeeCustom10;
                }

                /**
                 * Define el valor de la propiedad employeeCustom10.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom10(String value) {
                    this.employeeCustom10 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom11.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom11() {
                    return employeeCustom11;
                }

                /**
                 * Define el valor de la propiedad employeeCustom11.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom11(String value) {
                    this.employeeCustom11 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom12.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom12() {
                    return employeeCustom12;
                }

                /**
                 * Define el valor de la propiedad employeeCustom12.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom12(String value) {
                    this.employeeCustom12 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom13.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom13() {
                    return employeeCustom13;
                }

                /**
                 * Define el valor de la propiedad employeeCustom13.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom13(String value) {
                    this.employeeCustom13 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom14.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom14() {
                    return employeeCustom14;
                }

                /**
                 * Define el valor de la propiedad employeeCustom14.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom14(String value) {
                    this.employeeCustom14 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom15.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom15() {
                    return employeeCustom15;
                }

                /**
                 * Define el valor de la propiedad employeeCustom15.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom15(String value) {
                    this.employeeCustom15 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom16.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom16() {
                    return employeeCustom16;
                }

                /**
                 * Define el valor de la propiedad employeeCustom16.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom16(String value) {
                    this.employeeCustom16 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom17.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom17() {
                    return employeeCustom17;
                }

                /**
                 * Define el valor de la propiedad employeeCustom17.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom17(String value) {
                    this.employeeCustom17 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom18.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom18() {
                    return employeeCustom18;
                }

                /**
                 * Define el valor de la propiedad employeeCustom18.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom18(String value) {
                    this.employeeCustom18 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom19.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom19() {
                    return employeeCustom19;
                }

                /**
                 * Define el valor de la propiedad employeeCustom19.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom19(String value) {
                    this.employeeCustom19 = value;
                }

                /**
                 * Obtiene el valor de la propiedad employeeCustom20.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEmployeeCustom20() {
                    return employeeCustom20;
                }

                /**
                 * Define el valor de la propiedad employeeCustom20.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEmployeeCustom20(String value) {
                    this.employeeCustom20 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse1() {
                    return futureUse1;
                }

                /**
                 * Define el valor de la propiedad futureUse1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse1(String value) {
                    this.futureUse1 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse2() {
                    return futureUse2;
                }

                /**
                 * Define el valor de la propiedad futureUse2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse2(String value) {
                    this.futureUse2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse3() {
                    return futureUse3;
                }

                /**
                 * Define el valor de la propiedad futureUse3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse3(String value) {
                    this.futureUse3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse4() {
                    return futureUse4;
                }

                /**
                 * Define el valor de la propiedad futureUse4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse4(String value) {
                    this.futureUse4 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse5.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse5() {
                    return futureUse5;
                }

                /**
                 * Define el valor de la propiedad futureUse5.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse5(String value) {
                    this.futureUse5 = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="EntryId" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EntryTransactionType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ExpenseType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EntryTransactionDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="SpendCurrencyAlphaISO" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="CurrencyExchangeRate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ExchangeRateDirection" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="IsPersonal" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EntryDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="VendorName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="VendorDescription" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReceiptReceived" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReceiptType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TotalEmployeeAttendee" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AttendeeCountSpouse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AttendeeCountBusiness" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom1-SGAGrouping" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom2-LG_Transaction_Type" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom3-Location" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom4-ProyectoSN" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom5-Proyecto" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom6-Subcategoría" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom7-RFC-TaxID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom8-Num.Factura" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom21" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom22" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom23" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom24" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom25" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom26" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom27" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom28" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom29" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom30" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom31" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom32" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom33" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom34" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom35" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom36" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom37" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom38" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom39" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryCustom40" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EntryTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EntryPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EntryApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EntryPaymentCode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EntryPaymentCodeName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportPaymentReimbursementType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="BillDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryPaymentTypeName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class EntryData {

                @XmlAttribute(name = "EntryId")
                protected String entryId;
                @XmlAttribute(name = "EntryTransactionType")
                protected String entryTransactionType;
                @XmlAttribute(name = "ExpenseType")
                protected String expenseType;
                @XmlAttribute(name = "EntryTransactionDate")
                protected String entryTransactionDate;
                @XmlAttribute(name = "SpendCurrencyAlphaISO")
                protected String spendCurrencyAlphaISO;
                @XmlAttribute(name = "CurrencyExchangeRate")
                protected String currencyExchangeRate;
                @XmlAttribute(name = "ExchangeRateDirection")
                protected String exchangeRateDirection;
                @XmlAttribute(name = "IsPersonal")
                protected String isPersonal;
                @XmlAttribute(name = "EntryDescription")
                protected String entryDescription;
                @XmlAttribute(name = "VendorName")
                protected String vendorName;
                @XmlAttribute(name = "VendorDescription")
                protected String vendorDescription;
                @XmlAttribute(name = "ReceiptReceived")
                protected String receiptReceived;
                @XmlAttribute(name = "ReceiptType")
                protected String receiptType;
                @XmlAttribute(name = "TotalEmployeeAttendee")
                protected String totalEmployeeAttendee;
                @XmlAttribute(name = "AttendeeCountSpouse")
                protected String attendeeCountSpouse;
                @XmlAttribute(name = "AttendeeCountBusiness")
                protected String attendeeCountBusiness;
                @XmlAttribute(name = "ReportEntryOrgUnit1-Tipo")
                protected String reportEntryOrgUnit1Tipo;
                @XmlAttribute(name = "ReportEntryOrgUnit2-Depto")
                protected String reportEntryOrgUnit2Depto;
                @XmlAttribute(name = "ReportEntryOrgUnit3")
                protected String reportEntryOrgUnit3;
                @XmlAttribute(name = "ReportEntryOrgUnit4")
                protected String reportEntryOrgUnit4;
                @XmlAttribute(name = "ReportEntryOrgUnit5")
                protected String reportEntryOrgUnit5;
                @XmlAttribute(name = "ReportEntryOrgUnit6")
                protected String reportEntryOrgUnit6;
                @XmlAttribute(name = "ReportEntryCustom1-SGAGrouping")
                protected String reportEntryCustom1SGAGrouping;
                @XmlAttribute(name = "ReportEntryCustom2-LG_Transaction_Type")
                protected String reportEntryCustom2LGTransactionType;
                @XmlAttribute(name = "ReportEntryCustom3-Location")
                protected String reportEntryCustom3Location;
                @XmlAttribute(name = "ReportEntryCustom4-ProyectoSN")
                protected String reportEntryCustom4ProyectoSN;
                @XmlAttribute(name = "ReportEntryCustom5-Proyecto")
                protected String reportEntryCustom5Proyecto;
                @XmlAttribute(name = "ReportEntryCustom6-Subcategor\u00eda")
                protected String reportEntryCustom6Subcategoría;
                @XmlAttribute(name = "ReportEntryCustom7-RFC-TaxID")
                protected String reportEntryCustom7RFCTaxID;
                @XmlAttribute(name = "ReportEntryCustom8-Num.Factura")
                protected String reportEntryCustom8NumFactura;
                @XmlAttribute(name = "ReportEntryCustom9")
                protected String reportEntryCustom9;
                @XmlAttribute(name = "ReportEntryCustom10")
                protected String reportEntryCustom10;
                @XmlAttribute(name = "ReportEntryCustom11")
                protected String reportEntryCustom11;
                @XmlAttribute(name = "ReportEntryCustom12")
                protected String reportEntryCustom12;
                @XmlAttribute(name = "ReportEntryCustom13")
                protected String reportEntryCustom13;
                @XmlAttribute(name = "ReportEntryCustom14")
                protected String reportEntryCustom14;
                @XmlAttribute(name = "ReportEntryCustom15")
                protected String reportEntryCustom15;
                @XmlAttribute(name = "ReportEntryCustom16")
                protected String reportEntryCustom16;
                @XmlAttribute(name = "ReportEntryCustom17")
                protected String reportEntryCustom17;
                @XmlAttribute(name = "ReportEntryCustom18")
                protected String reportEntryCustom18;
                @XmlAttribute(name = "ReportEntryCustom19")
                protected String reportEntryCustom19;
                @XmlAttribute(name = "ReportEntryCustom20")
                protected String reportEntryCustom20;
                @XmlAttribute(name = "ReportEntryCustom21")
                protected String reportEntryCustom21;
                @XmlAttribute(name = "ReportEntryCustom22")
                protected String reportEntryCustom22;
                @XmlAttribute(name = "ReportEntryCustom23")
                protected String reportEntryCustom23;
                @XmlAttribute(name = "ReportEntryCustom24")
                protected String reportEntryCustom24;
                @XmlAttribute(name = "ReportEntryCustom25")
                protected String reportEntryCustom25;
                @XmlAttribute(name = "ReportEntryCustom26")
                protected String reportEntryCustom26;
                @XmlAttribute(name = "ReportEntryCustom27")
                protected String reportEntryCustom27;
                @XmlAttribute(name = "ReportEntryCustom28")
                protected String reportEntryCustom28;
                @XmlAttribute(name = "ReportEntryCustom29")
                protected String reportEntryCustom29;
                @XmlAttribute(name = "ReportEntryCustom30")
                protected String reportEntryCustom30;
                @XmlAttribute(name = "ReportEntryCustom31")
                protected String reportEntryCustom31;
                @XmlAttribute(name = "ReportEntryCustom32")
                protected String reportEntryCustom32;
                @XmlAttribute(name = "ReportEntryCustom33")
                protected String reportEntryCustom33;
                @XmlAttribute(name = "ReportEntryCustom34")
                protected String reportEntryCustom34;
                @XmlAttribute(name = "ReportEntryCustom35")
                protected String reportEntryCustom35;
                @XmlAttribute(name = "ReportEntryCustom36")
                protected String reportEntryCustom36;
                @XmlAttribute(name = "ReportEntryCustom37")
                protected String reportEntryCustom37;
                @XmlAttribute(name = "ReportEntryCustom38")
                protected String reportEntryCustom38;
                @XmlAttribute(name = "ReportEntryCustom39")
                protected String reportEntryCustom39;
                @XmlAttribute(name = "ReportEntryCustom40")
                protected String reportEntryCustom40;
                @XmlAttribute(name = "EntryTransactionAmount")
                protected String entryTransactionAmount;
                @XmlAttribute(name = "EntryPostedAmount")
                protected String entryPostedAmount;
                @XmlAttribute(name = "EntryApprovedAmount")
                protected String entryApprovedAmount;
                @XmlAttribute(name = "EntryPaymentCode")
                protected String entryPaymentCode;
                @XmlAttribute(name = "EntryPaymentCodeName")
                protected String entryPaymentCodeName;
                @XmlAttribute(name = "ReportPaymentReimbursementType")
                protected String reportPaymentReimbursementType;
                @XmlAttribute(name = "BillDate")
                protected String billDate;
                @XmlAttribute(name = "ReportEntryPaymentTypeName")
                protected String reportEntryPaymentTypeName;

                /**
                 * Obtiene el valor de la propiedad entryId.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEntryId() {
                    return entryId;
                }

                /**
                 * Define el valor de la propiedad entryId.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEntryId(String value) {
                    this.entryId = value;
                }

                /**
                 * Obtiene el valor de la propiedad entryTransactionType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEntryTransactionType() {
                    return entryTransactionType;
                }

                /**
                 * Define el valor de la propiedad entryTransactionType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEntryTransactionType(String value) {
                    this.entryTransactionType = value;
                }

                /**
                 * Obtiene el valor de la propiedad expenseType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getExpenseType() {
                    return expenseType;
                }

                /**
                 * Define el valor de la propiedad expenseType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setExpenseType(String value) {
                    this.expenseType = value;
                }

                /**
                 * Obtiene el valor de la propiedad entryTransactionDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEntryTransactionDate() {
                    return entryTransactionDate;
                }

                /**
                 * Define el valor de la propiedad entryTransactionDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEntryTransactionDate(String value) {
                    this.entryTransactionDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad spendCurrencyAlphaISO.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getSpendCurrencyAlphaISO() {
                    return spendCurrencyAlphaISO;
                }

                /**
                 * Define el valor de la propiedad spendCurrencyAlphaISO.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setSpendCurrencyAlphaISO(String value) {
                    this.spendCurrencyAlphaISO = value;
                }

                /**
                 * Obtiene el valor de la propiedad currencyExchangeRate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCurrencyExchangeRate() {
                    return currencyExchangeRate;
                }

                /**
                 * Define el valor de la propiedad currencyExchangeRate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCurrencyExchangeRate(String value) {
                    this.currencyExchangeRate = value;
                }

                /**
                 * Obtiene el valor de la propiedad exchangeRateDirection.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getExchangeRateDirection() {
                    return exchangeRateDirection;
                }

                /**
                 * Define el valor de la propiedad exchangeRateDirection.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setExchangeRateDirection(String value) {
                    this.exchangeRateDirection = value;
                }

                /**
                 * Obtiene el valor de la propiedad isPersonal.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getIsPersonal() {
                    return isPersonal;
                }

                /**
                 * Define el valor de la propiedad isPersonal.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setIsPersonal(String value) {
                    this.isPersonal = value;
                }

                /**
                 * Obtiene el valor de la propiedad entryDescription.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEntryDescription() {
                    return entryDescription;
                }

                /**
                 * Define el valor de la propiedad entryDescription.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEntryDescription(String value) {
                    this.entryDescription = value;
                }

                /**
                 * Obtiene el valor de la propiedad vendorName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getVendorName() {
                    return vendorName;
                }

                /**
                 * Define el valor de la propiedad vendorName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setVendorName(String value) {
                    this.vendorName = value;
                }

                /**
                 * Obtiene el valor de la propiedad vendorDescription.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getVendorDescription() {
                    return vendorDescription;
                }

                /**
                 * Define el valor de la propiedad vendorDescription.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setVendorDescription(String value) {
                    this.vendorDescription = value;
                }

                /**
                 * Obtiene el valor de la propiedad receiptReceived.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReceiptReceived() {
                    return receiptReceived;
                }

                /**
                 * Define el valor de la propiedad receiptReceived.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReceiptReceived(String value) {
                    this.receiptReceived = value;
                }

                /**
                 * Obtiene el valor de la propiedad receiptType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReceiptType() {
                    return receiptType;
                }

                /**
                 * Define el valor de la propiedad receiptType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReceiptType(String value) {
                    this.receiptType = value;
                }

                /**
                 * Obtiene el valor de la propiedad totalEmployeeAttendee.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTotalEmployeeAttendee() {
                    return totalEmployeeAttendee;
                }

                /**
                 * Define el valor de la propiedad totalEmployeeAttendee.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTotalEmployeeAttendee(String value) {
                    this.totalEmployeeAttendee = value;
                }

                /**
                 * Obtiene el valor de la propiedad attendeeCountSpouse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAttendeeCountSpouse() {
                    return attendeeCountSpouse;
                }

                /**
                 * Define el valor de la propiedad attendeeCountSpouse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAttendeeCountSpouse(String value) {
                    this.attendeeCountSpouse = value;
                }

                /**
                 * Obtiene el valor de la propiedad attendeeCountBusiness.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAttendeeCountBusiness() {
                    return attendeeCountBusiness;
                }

                /**
                 * Define el valor de la propiedad attendeeCountBusiness.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAttendeeCountBusiness(String value) {
                    this.attendeeCountBusiness = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryOrgUnit1Tipo.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryOrgUnit1Tipo() {
                    return reportEntryOrgUnit1Tipo;
                }

                /**
                 * Define el valor de la propiedad reportEntryOrgUnit1Tipo.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryOrgUnit1Tipo(String value) {
                    this.reportEntryOrgUnit1Tipo = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryOrgUnit2Depto.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryOrgUnit2Depto() {
                    return reportEntryOrgUnit2Depto;
                }

                /**
                 * Define el valor de la propiedad reportEntryOrgUnit2Depto.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryOrgUnit2Depto(String value) {
                    this.reportEntryOrgUnit2Depto = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryOrgUnit3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryOrgUnit3() {
                    return reportEntryOrgUnit3;
                }

                /**
                 * Define el valor de la propiedad reportEntryOrgUnit3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryOrgUnit3(String value) {
                    this.reportEntryOrgUnit3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryOrgUnit4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryOrgUnit4() {
                    return reportEntryOrgUnit4;
                }

                /**
                 * Define el valor de la propiedad reportEntryOrgUnit4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryOrgUnit4(String value) {
                    this.reportEntryOrgUnit4 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryOrgUnit5.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryOrgUnit5() {
                    return reportEntryOrgUnit5;
                }

                /**
                 * Define el valor de la propiedad reportEntryOrgUnit5.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryOrgUnit5(String value) {
                    this.reportEntryOrgUnit5 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryOrgUnit6.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryOrgUnit6() {
                    return reportEntryOrgUnit6;
                }

                /**
                 * Define el valor de la propiedad reportEntryOrgUnit6.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryOrgUnit6(String value) {
                    this.reportEntryOrgUnit6 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom1SGAGrouping.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom1SGAGrouping() {
                    return reportEntryCustom1SGAGrouping;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom1SGAGrouping.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom1SGAGrouping(String value) {
                    this.reportEntryCustom1SGAGrouping = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom2LGTransactionType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom2LGTransactionType() {
                    return reportEntryCustom2LGTransactionType;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom2LGTransactionType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom2LGTransactionType(String value) {
                    this.reportEntryCustom2LGTransactionType = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom3Location.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom3Location() {
                    return reportEntryCustom3Location;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom3Location.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom3Location(String value) {
                    this.reportEntryCustom3Location = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom4ProyectoSN.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom4ProyectoSN() {
                    return reportEntryCustom4ProyectoSN;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom4ProyectoSN.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom4ProyectoSN(String value) {
                    this.reportEntryCustom4ProyectoSN = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom5Proyecto.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom5Proyecto() {
                    return reportEntryCustom5Proyecto;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom5Proyecto.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom5Proyecto(String value) {
                    this.reportEntryCustom5Proyecto = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom6Subcategoría.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom6Subcategoría() {
                    return reportEntryCustom6Subcategoría;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom6Subcategoría.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom6Subcategoría(String value) {
                    this.reportEntryCustom6Subcategoría = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom7RFCTaxID.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom7RFCTaxID() {
                    return reportEntryCustom7RFCTaxID;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom7RFCTaxID.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom7RFCTaxID(String value) {
                    this.reportEntryCustom7RFCTaxID = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom8NumFactura.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom8NumFactura() {
                    return reportEntryCustom8NumFactura;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom8NumFactura.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom8NumFactura(String value) {
                    this.reportEntryCustom8NumFactura = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom9.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom9() {
                    return reportEntryCustom9;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom9.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom9(String value) {
                    this.reportEntryCustom9 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom10.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom10() {
                    return reportEntryCustom10;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom10.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom10(String value) {
                    this.reportEntryCustom10 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom11.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom11() {
                    return reportEntryCustom11;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom11.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom11(String value) {
                    this.reportEntryCustom11 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom12.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom12() {
                    return reportEntryCustom12;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom12.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom12(String value) {
                    this.reportEntryCustom12 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom13.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom13() {
                    return reportEntryCustom13;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom13.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom13(String value) {
                    this.reportEntryCustom13 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom14.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom14() {
                    return reportEntryCustom14;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom14.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom14(String value) {
                    this.reportEntryCustom14 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom15.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom15() {
                    return reportEntryCustom15;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom15.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom15(String value) {
                    this.reportEntryCustom15 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom16.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom16() {
                    return reportEntryCustom16;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom16.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom16(String value) {
                    this.reportEntryCustom16 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom17.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom17() {
                    return reportEntryCustom17;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom17.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom17(String value) {
                    this.reportEntryCustom17 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom18.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom18() {
                    return reportEntryCustom18;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom18.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom18(String value) {
                    this.reportEntryCustom18 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom19.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom19() {
                    return reportEntryCustom19;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom19.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom19(String value) {
                    this.reportEntryCustom19 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom20.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom20() {
                    return reportEntryCustom20;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom20.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom20(String value) {
                    this.reportEntryCustom20 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom21.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom21() {
                    return reportEntryCustom21;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom21.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom21(String value) {
                    this.reportEntryCustom21 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom22.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom22() {
                    return reportEntryCustom22;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom22.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom22(String value) {
                    this.reportEntryCustom22 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom23.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom23() {
                    return reportEntryCustom23;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom23.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom23(String value) {
                    this.reportEntryCustom23 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom24.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom24() {
                    return reportEntryCustom24;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom24.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom24(String value) {
                    this.reportEntryCustom24 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom25.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom25() {
                    return reportEntryCustom25;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom25.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom25(String value) {
                    this.reportEntryCustom25 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom26.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom26() {
                    return reportEntryCustom26;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom26.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom26(String value) {
                    this.reportEntryCustom26 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom27.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom27() {
                    return reportEntryCustom27;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom27.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom27(String value) {
                    this.reportEntryCustom27 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom28.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom28() {
                    return reportEntryCustom28;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom28.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom28(String value) {
                    this.reportEntryCustom28 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom29.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom29() {
                    return reportEntryCustom29;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom29.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom29(String value) {
                    this.reportEntryCustom29 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom30.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom30() {
                    return reportEntryCustom30;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom30.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom30(String value) {
                    this.reportEntryCustom30 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom31.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom31() {
                    return reportEntryCustom31;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom31.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom31(String value) {
                    this.reportEntryCustom31 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom32.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom32() {
                    return reportEntryCustom32;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom32.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom32(String value) {
                    this.reportEntryCustom32 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom33.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom33() {
                    return reportEntryCustom33;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom33.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom33(String value) {
                    this.reportEntryCustom33 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom34.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom34() {
                    return reportEntryCustom34;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom34.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom34(String value) {
                    this.reportEntryCustom34 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom35.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom35() {
                    return reportEntryCustom35;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom35.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom35(String value) {
                    this.reportEntryCustom35 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom36.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom36() {
                    return reportEntryCustom36;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom36.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom36(String value) {
                    this.reportEntryCustom36 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom37.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom37() {
                    return reportEntryCustom37;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom37.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom37(String value) {
                    this.reportEntryCustom37 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom38.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom38() {
                    return reportEntryCustom38;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom38.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom38(String value) {
                    this.reportEntryCustom38 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom39.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom39() {
                    return reportEntryCustom39;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom39.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom39(String value) {
                    this.reportEntryCustom39 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryCustom40.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryCustom40() {
                    return reportEntryCustom40;
                }

                /**
                 * Define el valor de la propiedad reportEntryCustom40.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryCustom40(String value) {
                    this.reportEntryCustom40 = value;
                }

                /**
                 * Obtiene el valor de la propiedad entryTransactionAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEntryTransactionAmount() {
                    return entryTransactionAmount;
                }

                /**
                 * Define el valor de la propiedad entryTransactionAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEntryTransactionAmount(String value) {
                    this.entryTransactionAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad entryPostedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEntryPostedAmount() {
                    return entryPostedAmount;
                }

                /**
                 * Define el valor de la propiedad entryPostedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEntryPostedAmount(String value) {
                    this.entryPostedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad entryApprovedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEntryApprovedAmount() {
                    return entryApprovedAmount;
                }

                /**
                 * Define el valor de la propiedad entryApprovedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEntryApprovedAmount(String value) {
                    this.entryApprovedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad entryPaymentCode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEntryPaymentCode() {
                    return entryPaymentCode;
                }

                /**
                 * Define el valor de la propiedad entryPaymentCode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEntryPaymentCode(String value) {
                    this.entryPaymentCode = value;
                }

                /**
                 * Obtiene el valor de la propiedad entryPaymentCodeName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEntryPaymentCodeName() {
                    return entryPaymentCodeName;
                }

                /**
                 * Define el valor de la propiedad entryPaymentCodeName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEntryPaymentCodeName(String value) {
                    this.entryPaymentCodeName = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportPaymentReimbursementType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportPaymentReimbursementType() {
                    return reportPaymentReimbursementType;
                }

                /**
                 * Define el valor de la propiedad reportPaymentReimbursementType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportPaymentReimbursementType(String value) {
                    this.reportPaymentReimbursementType = value;
                }

                /**
                 * Obtiene el valor de la propiedad billDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getBillDate() {
                    return billDate;
                }

                /**
                 * Define el valor de la propiedad billDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setBillDate(String value) {
                    this.billDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryPaymentTypeName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryPaymentTypeName() {
                    return reportEntryPaymentTypeName;
                }

                /**
                 * Define el valor de la propiedad reportEntryPaymentTypeName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryPaymentTypeName(String value) {
                    this.reportEntryPaymentTypeName = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="EntryCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EntryCountrySub" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="DomesticForeign" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="MarketCode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ProcessorReferenceNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class EntryLocationData {

                @XmlAttribute(name = "EntryCountry")
                protected String entryCountry;
                @XmlAttribute(name = "EntryCountrySub")
                protected String entryCountrySub;
                @XmlAttribute(name = "DomesticForeign")
                protected String domesticForeign;
                @XmlAttribute(name = "MarketCode")
                protected String marketCode;
                @XmlAttribute(name = "ProcessorReferenceNumber")
                protected String processorReferenceNumber;

                /**
                 * Obtiene el valor de la propiedad entryCountry.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEntryCountry() {
                    return entryCountry;
                }

                /**
                 * Define el valor de la propiedad entryCountry.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEntryCountry(String value) {
                    this.entryCountry = value;
                }

                /**
                 * Obtiene el valor de la propiedad entryCountrySub.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEntryCountrySub() {
                    return entryCountrySub;
                }

                /**
                 * Define el valor de la propiedad entryCountrySub.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEntryCountrySub(String value) {
                    this.entryCountrySub = value;
                }

                /**
                 * Obtiene el valor de la propiedad domesticForeign.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getDomesticForeign() {
                    return domesticForeign;
                }

                /**
                 * Define el valor de la propiedad domesticForeign.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setDomesticForeign(String value) {
                    this.domesticForeign = value;
                }

                /**
                 * Obtiene el valor de la propiedad marketCode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getMarketCode() {
                    return marketCode;
                }

                /**
                 * Define el valor de la propiedad marketCode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setMarketCode(String value) {
                    this.marketCode = value;
                }

                /**
                 * Obtiene el valor de la propiedad processorReferenceNumber.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getProcessorReferenceNumber() {
                    return processorReferenceNumber;
                }

                /**
                 * Define el valor de la propiedad processorReferenceNumber.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setProcessorReferenceNumber(String value) {
                    this.processorReferenceNumber = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="CashAccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="LiabilityAccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EstimatedPaymentDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FundingTrace" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="RequestedDisbursementDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class ExpensePayData {

                @XmlAttribute(name = "CashAccountCode")
                protected String cashAccountCode;
                @XmlAttribute(name = "LiabilityAccountCode")
                protected String liabilityAccountCode;
                @XmlAttribute(name = "EstimatedPaymentDate")
                protected String estimatedPaymentDate;
                @XmlAttribute(name = "FundingTrace")
                protected String fundingTrace;
                @XmlAttribute(name = "RequestedDisbursementDate")
                protected String requestedDisbursementDate;
                @XmlAttribute(name = "FutureUse")
                protected String futureUse;
                @XmlAttribute(name = "FutureUse1")
                protected String futureUse1;
                @XmlAttribute(name = "FutureUse2")
                protected String futureUse2;
                @XmlAttribute(name = "FutureUse3")
                protected String futureUse3;
                @XmlAttribute(name = "FutureUse4")
                protected String futureUse4;

                /**
                 * Obtiene el valor de la propiedad cashAccountCode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCashAccountCode() {
                    return cashAccountCode;
                }

                /**
                 * Define el valor de la propiedad cashAccountCode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCashAccountCode(String value) {
                    this.cashAccountCode = value;
                }

                /**
                 * Obtiene el valor de la propiedad liabilityAccountCode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getLiabilityAccountCode() {
                    return liabilityAccountCode;
                }

                /**
                 * Define el valor de la propiedad liabilityAccountCode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setLiabilityAccountCode(String value) {
                    this.liabilityAccountCode = value;
                }

                /**
                 * Obtiene el valor de la propiedad estimatedPaymentDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEstimatedPaymentDate() {
                    return estimatedPaymentDate;
                }

                /**
                 * Define el valor de la propiedad estimatedPaymentDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEstimatedPaymentDate(String value) {
                    this.estimatedPaymentDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad fundingTrace.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFundingTrace() {
                    return fundingTrace;
                }

                /**
                 * Define el valor de la propiedad fundingTrace.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFundingTrace(String value) {
                    this.fundingTrace = value;
                }

                /**
                 * Obtiene el valor de la propiedad requestedDisbursementDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getRequestedDisbursementDate() {
                    return requestedDisbursementDate;
                }

                /**
                 * Define el valor de la propiedad requestedDisbursementDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setRequestedDisbursementDate(String value) {
                    this.requestedDisbursementDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse() {
                    return futureUse;
                }

                /**
                 * Define el valor de la propiedad futureUse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse(String value) {
                    this.futureUse = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse1() {
                    return futureUse1;
                }

                /**
                 * Define el valor de la propiedad futureUse1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse1(String value) {
                    this.futureUse1 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse2() {
                    return futureUse2;
                }

                /**
                 * Define el valor de la propiedad futureUse2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse2(String value) {
                    this.futureUse2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse3() {
                    return futureUse3;
                }

                /**
                 * Define el valor de la propiedad futureUse3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse3(String value) {
                    this.futureUse3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse4() {
                    return futureUse4;
                }

                /**
                 * Define el valor de la propiedad futureUse4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse4(String value) {
                    this.futureUse4 = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class FutureUseSection {

                @XmlAttribute(name = "FutureUse")
                protected String futureUse;
                @XmlAttribute(name = "FutureUse1")
                protected String futureUse1;
                @XmlAttribute(name = "FutureUse2")
                protected String futureUse2;

                /**
                 * Obtiene el valor de la propiedad futureUse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse() {
                    return futureUse;
                }

                /**
                 * Define el valor de la propiedad futureUse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse(String value) {
                    this.futureUse = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse1() {
                    return futureUse1;
                }

                /**
                 * Define el valor de la propiedad futureUse1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse1(String value) {
                    this.futureUse1 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse2() {
                    return futureUse2;
                }

                /**
                 * Define el valor de la propiedad futureUse2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse2(String value) {
                    this.futureUse2 = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="PayerPayType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="PayerPayCode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="PayeePayType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="PayeePayCode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AccountCode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="DRCR" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="JournalAmt" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="JournalKey" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class JournalEntryData {

                @XmlAttribute(name = "PayerPayType")
                protected String payerPayType;
                @XmlAttribute(name = "PayerPayCode")
                protected String payerPayCode;
                @XmlAttribute(name = "PayeePayType")
                protected String payeePayType;
                @XmlAttribute(name = "PayeePayCode")
                protected String payeePayCode;
                @XmlAttribute(name = "AccountCode")
                protected String accountCode;
                @XmlAttribute(name = "DRCR")
                protected String drcr;
                @XmlAttribute(name = "JournalAmt")
                protected String journalAmt;
                @XmlAttribute(name = "JournalKey")
                protected String journalKey;

                /**
                 * Obtiene el valor de la propiedad payerPayType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getPayerPayType() {
                    return payerPayType;
                }

                /**
                 * Define el valor de la propiedad payerPayType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setPayerPayType(String value) {
                    this.payerPayType = value;
                }

                /**
                 * Obtiene el valor de la propiedad payerPayCode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getPayerPayCode() {
                    return payerPayCode;
                }

                /**
                 * Define el valor de la propiedad payerPayCode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setPayerPayCode(String value) {
                    this.payerPayCode = value;
                }

                /**
                 * Obtiene el valor de la propiedad payeePayType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getPayeePayType() {
                    return payeePayType;
                }

                /**
                 * Define el valor de la propiedad payeePayType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setPayeePayType(String value) {
                    this.payeePayType = value;
                }

                /**
                 * Obtiene el valor de la propiedad payeePayCode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getPayeePayCode() {
                    return payeePayCode;
                }

                /**
                 * Define el valor de la propiedad payeePayCode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setPayeePayCode(String value) {
                    this.payeePayCode = value;
                }

                /**
                 * Obtiene el valor de la propiedad accountCode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAccountCode() {
                    return accountCode;
                }

                /**
                 * Define el valor de la propiedad accountCode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAccountCode(String value) {
                    this.accountCode = value;
                }

                /**
                 * Obtiene el valor de la propiedad drcr.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getDRCR() {
                    return drcr;
                }

                /**
                 * Define el valor de la propiedad drcr.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setDRCR(String value) {
                    this.drcr = value;
                }

                /**
                 * Obtiene el valor de la propiedad journalAmt.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getJournalAmt() {
                    return journalAmt;
                }

                /**
                 * Define el valor de la propiedad journalAmt.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setJournalAmt(String value) {
                    this.journalAmt = value;
                }

                /**
                 * Obtiene el valor de la propiedad journalKey.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getJournalKey() {
                    return journalKey;
                }

                /**
                 * Define el valor de la propiedad journalKey.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setJournalKey(String value) {
                    this.journalKey = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="ReportID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportKey" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Ledger" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReimbursementCurrencyAlphaISE" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="HomeCountry" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportSubmitDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportUserDefinedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportPaymentProcessingDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportImageRequired" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportHasVATEntry" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportHasTAEntry" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportTotalPostAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportTotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportPolicyName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportOrgUnit1-Tipo" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportOrgUnit2-Depto" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportOrgUnit3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportOrgUnit4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportOrgUnit5" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportOrgUnit6" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom1-SGAGrouping" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom5" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom6" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom7" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom8" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom9" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom10" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom11" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom12" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom13" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom14" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom15" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom16" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom17" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom18" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom19" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportCustom20" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="PersonalExpenses" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TotalAmountClaimed" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AmountDueEmployee" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AmountDueCompanyCard" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AmountNotApproved" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AmountCompanyPaid" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AmountDueCompany" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="PaymentConfirmedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AmountDueEmployee2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AmountDueCompanyCard2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TotalTaxAdjustedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="NetAdjustedTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class ReportData {

                @XmlAttribute(name = "ReportID")
                protected String reportID;
                @XmlAttribute(name = "ReportKey")
                protected String reportKey;
                @XmlAttribute(name = "Ledger")
                protected String ledger;
                @XmlAttribute(name = "ReimbursementCurrencyAlphaISE")
                protected String reimbursementCurrencyAlphaISE;
                @XmlAttribute(name = "HomeCountry")
                protected String homeCountry;
                @XmlAttribute(name = "ReportSubmitDate")
                protected String reportSubmitDate;
                @XmlAttribute(name = "ReportUserDefinedDate")
                protected String reportUserDefinedDate;
                @XmlAttribute(name = "ReportPaymentProcessingDate")
                protected String reportPaymentProcessingDate;
                @XmlAttribute(name = "ReportName")
                protected String reportName;
                @XmlAttribute(name = "ReportImageRequired")
                protected String reportImageRequired;
                @XmlAttribute(name = "ReportHasVATEntry")
                protected String reportHasVATEntry;
                @XmlAttribute(name = "ReportHasTAEntry")
                protected String reportHasTAEntry;
                @XmlAttribute(name = "ReportTotalPostAmount")
                protected String reportTotalPostAmount;
                @XmlAttribute(name = "ReportTotalApprovedAmount")
                protected String reportTotalApprovedAmount;
                @XmlAttribute(name = "ReportPolicyName")
                protected String reportPolicyName;
                @XmlAttribute(name = "FutureUse")
                protected String futureUse;
                @XmlAttribute(name = "ReportOrgUnit1-Tipo")
                protected String reportOrgUnit1Tipo;
                @XmlAttribute(name = "ReportOrgUnit2-Depto")
                protected String reportOrgUnit2Depto;
                @XmlAttribute(name = "ReportOrgUnit3")
                protected String reportOrgUnit3;
                @XmlAttribute(name = "ReportOrgUnit4")
                protected String reportOrgUnit4;
                @XmlAttribute(name = "ReportOrgUnit5")
                protected String reportOrgUnit5;
                @XmlAttribute(name = "ReportOrgUnit6")
                protected String reportOrgUnit6;
                @XmlAttribute(name = "ReportCustom1-SGAGrouping")
                protected String reportCustom1SGAGrouping;
                @XmlAttribute(name = "ReportCustom2")
                protected String reportCustom2;
                @XmlAttribute(name = "ReportCustom3")
                protected String reportCustom3;
                @XmlAttribute(name = "ReportCustom4")
                protected String reportCustom4;
                @XmlAttribute(name = "ReportCustom5")
                protected String reportCustom5;
                @XmlAttribute(name = "ReportCustom6")
                protected String reportCustom6;
                @XmlAttribute(name = "ReportCustom7")
                protected String reportCustom7;
                @XmlAttribute(name = "ReportCustom8")
                protected String reportCustom8;
                @XmlAttribute(name = "ReportCustom9")
                protected String reportCustom9;
                @XmlAttribute(name = "ReportCustom10")
                protected String reportCustom10;
                @XmlAttribute(name = "ReportCustom11")
                protected String reportCustom11;
                @XmlAttribute(name = "ReportCustom12")
                protected String reportCustom12;
                @XmlAttribute(name = "ReportCustom13")
                protected String reportCustom13;
                @XmlAttribute(name = "ReportCustom14")
                protected String reportCustom14;
                @XmlAttribute(name = "ReportCustom15")
                protected String reportCustom15;
                @XmlAttribute(name = "ReportCustom16")
                protected String reportCustom16;
                @XmlAttribute(name = "ReportCustom17")
                protected String reportCustom17;
                @XmlAttribute(name = "ReportCustom18")
                protected String reportCustom18;
                @XmlAttribute(name = "ReportCustom19")
                protected String reportCustom19;
                @XmlAttribute(name = "ReportCustom20")
                protected String reportCustom20;
                @XmlAttribute(name = "PersonalExpenses")
                protected String personalExpenses;
                @XmlAttribute(name = "TotalAmountClaimed")
                protected String totalAmountClaimed;
                @XmlAttribute(name = "AmountDueEmployee")
                protected String amountDueEmployee;
                @XmlAttribute(name = "AmountDueCompanyCard")
                protected String amountDueCompanyCard;
                @XmlAttribute(name = "AmountNotApproved")
                protected String amountNotApproved;
                @XmlAttribute(name = "AmountCompanyPaid")
                protected String amountCompanyPaid;
                @XmlAttribute(name = "AmountDueCompany")
                protected String amountDueCompany;
                @XmlAttribute(name = "PaymentConfirmedAmount")
                protected String paymentConfirmedAmount;
                @XmlAttribute(name = "AmountDueEmployee2")
                protected String amountDueEmployee2;
                @XmlAttribute(name = "AmountDueCompanyCard2")
                protected String amountDueCompanyCard2;
                @XmlAttribute(name = "ReportType")
                protected String reportType;
                @XmlAttribute(name = "TotalTaxAdjustedAmount")
                protected String totalTaxAdjustedAmount;
                @XmlAttribute(name = "NetAdjustedTaxAmount")
                protected String netAdjustedTaxAmount;
                @XmlAttribute(name = "FutureUse1")
                protected String futureUse1;
                @XmlAttribute(name = "FutureUse2")
                protected String futureUse2;
                @XmlAttribute(name = "FutureUse3")
                protected String futureUse3;

                /**
                 * Obtiene el valor de la propiedad reportID.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportID() {
                    return reportID;
                }

                /**
                 * Define el valor de la propiedad reportID.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportID(String value) {
                    this.reportID = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportKey.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportKey() {
                    return reportKey;
                }

                /**
                 * Define el valor de la propiedad reportKey.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportKey(String value) {
                    this.reportKey = value;
                }

                /**
                 * Obtiene el valor de la propiedad ledger.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getLedger() {
                    return ledger;
                }

                /**
                 * Define el valor de la propiedad ledger.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setLedger(String value) {
                    this.ledger = value;
                }

                /**
                 * Obtiene el valor de la propiedad reimbursementCurrencyAlphaISE.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReimbursementCurrencyAlphaISE() {
                    return reimbursementCurrencyAlphaISE;
                }

                /**
                 * Define el valor de la propiedad reimbursementCurrencyAlphaISE.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReimbursementCurrencyAlphaISE(String value) {
                    this.reimbursementCurrencyAlphaISE = value;
                }

                /**
                 * Obtiene el valor de la propiedad homeCountry.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getHomeCountry() {
                    return homeCountry;
                }

                /**
                 * Define el valor de la propiedad homeCountry.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setHomeCountry(String value) {
                    this.homeCountry = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportSubmitDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportSubmitDate() {
                    return reportSubmitDate;
                }

                /**
                 * Define el valor de la propiedad reportSubmitDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportSubmitDate(String value) {
                    this.reportSubmitDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportUserDefinedDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportUserDefinedDate() {
                    return reportUserDefinedDate;
                }

                /**
                 * Define el valor de la propiedad reportUserDefinedDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportUserDefinedDate(String value) {
                    this.reportUserDefinedDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportPaymentProcessingDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportPaymentProcessingDate() {
                    return reportPaymentProcessingDate;
                }

                /**
                 * Define el valor de la propiedad reportPaymentProcessingDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportPaymentProcessingDate(String value) {
                    this.reportPaymentProcessingDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportName() {
                    return reportName;
                }

                /**
                 * Define el valor de la propiedad reportName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportName(String value) {
                    this.reportName = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportImageRequired.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportImageRequired() {
                    return reportImageRequired;
                }

                /**
                 * Define el valor de la propiedad reportImageRequired.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportImageRequired(String value) {
                    this.reportImageRequired = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportHasVATEntry.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportHasVATEntry() {
                    return reportHasVATEntry;
                }

                /**
                 * Define el valor de la propiedad reportHasVATEntry.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportHasVATEntry(String value) {
                    this.reportHasVATEntry = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportHasTAEntry.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportHasTAEntry() {
                    return reportHasTAEntry;
                }

                /**
                 * Define el valor de la propiedad reportHasTAEntry.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportHasTAEntry(String value) {
                    this.reportHasTAEntry = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportTotalPostAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportTotalPostAmount() {
                    return reportTotalPostAmount;
                }

                /**
                 * Define el valor de la propiedad reportTotalPostAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportTotalPostAmount(String value) {
                    this.reportTotalPostAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportTotalApprovedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportTotalApprovedAmount() {
                    return reportTotalApprovedAmount;
                }

                /**
                 * Define el valor de la propiedad reportTotalApprovedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportTotalApprovedAmount(String value) {
                    this.reportTotalApprovedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportPolicyName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportPolicyName() {
                    return reportPolicyName;
                }

                /**
                 * Define el valor de la propiedad reportPolicyName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportPolicyName(String value) {
                    this.reportPolicyName = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse() {
                    return futureUse;
                }

                /**
                 * Define el valor de la propiedad futureUse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse(String value) {
                    this.futureUse = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportOrgUnit1Tipo.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportOrgUnit1Tipo() {
                    return reportOrgUnit1Tipo;
                }

                /**
                 * Define el valor de la propiedad reportOrgUnit1Tipo.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportOrgUnit1Tipo(String value) {
                    this.reportOrgUnit1Tipo = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportOrgUnit2Depto.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportOrgUnit2Depto() {
                    return reportOrgUnit2Depto;
                }

                /**
                 * Define el valor de la propiedad reportOrgUnit2Depto.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportOrgUnit2Depto(String value) {
                    this.reportOrgUnit2Depto = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportOrgUnit3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportOrgUnit3() {
                    return reportOrgUnit3;
                }

                /**
                 * Define el valor de la propiedad reportOrgUnit3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportOrgUnit3(String value) {
                    this.reportOrgUnit3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportOrgUnit4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportOrgUnit4() {
                    return reportOrgUnit4;
                }

                /**
                 * Define el valor de la propiedad reportOrgUnit4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportOrgUnit4(String value) {
                    this.reportOrgUnit4 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportOrgUnit5.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportOrgUnit5() {
                    return reportOrgUnit5;
                }

                /**
                 * Define el valor de la propiedad reportOrgUnit5.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportOrgUnit5(String value) {
                    this.reportOrgUnit5 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportOrgUnit6.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportOrgUnit6() {
                    return reportOrgUnit6;
                }

                /**
                 * Define el valor de la propiedad reportOrgUnit6.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportOrgUnit6(String value) {
                    this.reportOrgUnit6 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom1SGAGrouping.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom1SGAGrouping() {
                    return reportCustom1SGAGrouping;
                }

                /**
                 * Define el valor de la propiedad reportCustom1SGAGrouping.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom1SGAGrouping(String value) {
                    this.reportCustom1SGAGrouping = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom2() {
                    return reportCustom2;
                }

                /**
                 * Define el valor de la propiedad reportCustom2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom2(String value) {
                    this.reportCustom2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom3() {
                    return reportCustom3;
                }

                /**
                 * Define el valor de la propiedad reportCustom3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom3(String value) {
                    this.reportCustom3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom4() {
                    return reportCustom4;
                }

                /**
                 * Define el valor de la propiedad reportCustom4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom4(String value) {
                    this.reportCustom4 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom5.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom5() {
                    return reportCustom5;
                }

                /**
                 * Define el valor de la propiedad reportCustom5.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom5(String value) {
                    this.reportCustom5 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom6.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom6() {
                    return reportCustom6;
                }

                /**
                 * Define el valor de la propiedad reportCustom6.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom6(String value) {
                    this.reportCustom6 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom7.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom7() {
                    return reportCustom7;
                }

                /**
                 * Define el valor de la propiedad reportCustom7.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom7(String value) {
                    this.reportCustom7 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom8.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom8() {
                    return reportCustom8;
                }

                /**
                 * Define el valor de la propiedad reportCustom8.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom8(String value) {
                    this.reportCustom8 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom9.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom9() {
                    return reportCustom9;
                }

                /**
                 * Define el valor de la propiedad reportCustom9.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom9(String value) {
                    this.reportCustom9 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom10.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom10() {
                    return reportCustom10;
                }

                /**
                 * Define el valor de la propiedad reportCustom10.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom10(String value) {
                    this.reportCustom10 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom11.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom11() {
                    return reportCustom11;
                }

                /**
                 * Define el valor de la propiedad reportCustom11.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom11(String value) {
                    this.reportCustom11 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom12.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom12() {
                    return reportCustom12;
                }

                /**
                 * Define el valor de la propiedad reportCustom12.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom12(String value) {
                    this.reportCustom12 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom13.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom13() {
                    return reportCustom13;
                }

                /**
                 * Define el valor de la propiedad reportCustom13.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom13(String value) {
                    this.reportCustom13 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom14.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom14() {
                    return reportCustom14;
                }

                /**
                 * Define el valor de la propiedad reportCustom14.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom14(String value) {
                    this.reportCustom14 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom15.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom15() {
                    return reportCustom15;
                }

                /**
                 * Define el valor de la propiedad reportCustom15.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom15(String value) {
                    this.reportCustom15 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom16.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom16() {
                    return reportCustom16;
                }

                /**
                 * Define el valor de la propiedad reportCustom16.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom16(String value) {
                    this.reportCustom16 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom17.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom17() {
                    return reportCustom17;
                }

                /**
                 * Define el valor de la propiedad reportCustom17.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom17(String value) {
                    this.reportCustom17 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom18.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom18() {
                    return reportCustom18;
                }

                /**
                 * Define el valor de la propiedad reportCustom18.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom18(String value) {
                    this.reportCustom18 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom19.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom19() {
                    return reportCustom19;
                }

                /**
                 * Define el valor de la propiedad reportCustom19.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom19(String value) {
                    this.reportCustom19 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportCustom20.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportCustom20() {
                    return reportCustom20;
                }

                /**
                 * Define el valor de la propiedad reportCustom20.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportCustom20(String value) {
                    this.reportCustom20 = value;
                }

                /**
                 * Obtiene el valor de la propiedad personalExpenses.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getPersonalExpenses() {
                    return personalExpenses;
                }

                /**
                 * Define el valor de la propiedad personalExpenses.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setPersonalExpenses(String value) {
                    this.personalExpenses = value;
                }

                /**
                 * Obtiene el valor de la propiedad totalAmountClaimed.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTotalAmountClaimed() {
                    return totalAmountClaimed;
                }

                /**
                 * Define el valor de la propiedad totalAmountClaimed.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTotalAmountClaimed(String value) {
                    this.totalAmountClaimed = value;
                }

                /**
                 * Obtiene el valor de la propiedad amountDueEmployee.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAmountDueEmployee() {
                    return amountDueEmployee;
                }

                /**
                 * Define el valor de la propiedad amountDueEmployee.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAmountDueEmployee(String value) {
                    this.amountDueEmployee = value;
                }

                /**
                 * Obtiene el valor de la propiedad amountDueCompanyCard.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAmountDueCompanyCard() {
                    return amountDueCompanyCard;
                }

                /**
                 * Define el valor de la propiedad amountDueCompanyCard.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAmountDueCompanyCard(String value) {
                    this.amountDueCompanyCard = value;
                }

                /**
                 * Obtiene el valor de la propiedad amountNotApproved.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAmountNotApproved() {
                    return amountNotApproved;
                }

                /**
                 * Define el valor de la propiedad amountNotApproved.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAmountNotApproved(String value) {
                    this.amountNotApproved = value;
                }

                /**
                 * Obtiene el valor de la propiedad amountCompanyPaid.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAmountCompanyPaid() {
                    return amountCompanyPaid;
                }

                /**
                 * Define el valor de la propiedad amountCompanyPaid.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAmountCompanyPaid(String value) {
                    this.amountCompanyPaid = value;
                }

                /**
                 * Obtiene el valor de la propiedad amountDueCompany.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAmountDueCompany() {
                    return amountDueCompany;
                }

                /**
                 * Define el valor de la propiedad amountDueCompany.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAmountDueCompany(String value) {
                    this.amountDueCompany = value;
                }

                /**
                 * Obtiene el valor de la propiedad paymentConfirmedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getPaymentConfirmedAmount() {
                    return paymentConfirmedAmount;
                }

                /**
                 * Define el valor de la propiedad paymentConfirmedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setPaymentConfirmedAmount(String value) {
                    this.paymentConfirmedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad amountDueEmployee2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAmountDueEmployee2() {
                    return amountDueEmployee2;
                }

                /**
                 * Define el valor de la propiedad amountDueEmployee2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAmountDueEmployee2(String value) {
                    this.amountDueEmployee2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad amountDueCompanyCard2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAmountDueCompanyCard2() {
                    return amountDueCompanyCard2;
                }

                /**
                 * Define el valor de la propiedad amountDueCompanyCard2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAmountDueCompanyCard2(String value) {
                    this.amountDueCompanyCard2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportType() {
                    return reportType;
                }

                /**
                 * Define el valor de la propiedad reportType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportType(String value) {
                    this.reportType = value;
                }

                /**
                 * Obtiene el valor de la propiedad totalTaxAdjustedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTotalTaxAdjustedAmount() {
                    return totalTaxAdjustedAmount;
                }

                /**
                 * Define el valor de la propiedad totalTaxAdjustedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTotalTaxAdjustedAmount(String value) {
                    this.totalTaxAdjustedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad netAdjustedTaxAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getNetAdjustedTaxAmount() {
                    return netAdjustedTaxAmount;
                }

                /**
                 * Define el valor de la propiedad netAdjustedTaxAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setNetAdjustedTaxAmount(String value) {
                    this.netAdjustedTaxAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse1() {
                    return futureUse1;
                }

                /**
                 * Define el valor de la propiedad futureUse1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse1(String value) {
                    this.futureUse1 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse2() {
                    return futureUse2;
                }

                /**
                 * Define el valor de la propiedad futureUse2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse2(String value) {
                    this.futureUse2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse3() {
                    return futureUse3;
                }

                /**
                 * Define el valor de la propiedad futureUse3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse3(String value) {
                    this.futureUse3 = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="ReportEntryLocationCityName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="IsBillable" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryFromLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryToLocation" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryLocationName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Country" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="StateProvince" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="UUID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class ReportEntryData {

                @XmlAttribute(name = "ReportEntryLocationCityName")
                protected String reportEntryLocationCityName;
                @XmlAttribute(name = "IsBillable")
                protected String isBillable;
                @XmlAttribute(name = "ReportEntryFromLocation")
                protected String reportEntryFromLocation;
                @XmlAttribute(name = "ReportEntryToLocation")
                protected String reportEntryToLocation;
                @XmlAttribute(name = "ReportEntryLocationName")
                protected String reportEntryLocationName;
                @XmlAttribute(name = "Country")
                protected String country;
                @XmlAttribute(name = "StateProvince")
                protected String stateProvince;
                @XmlAttribute(name = "UUID")
                protected String uuid;
                @XmlAttribute(name = "FutureUse")
                protected String futureUse;
                @XmlAttribute(name = "FutureUse1")
                protected String futureUse1;
                @XmlAttribute(name = "FutureUse2")
                protected String futureUse2;
                @XmlAttribute(name = "FutureUse3")
                protected String futureUse3;
                @XmlAttribute(name = "FutureUse4")
                protected String futureUse4;

                /**
                 * Obtiene el valor de la propiedad reportEntryLocationCityName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryLocationCityName() {
                    return reportEntryLocationCityName;
                }

                /**
                 * Define el valor de la propiedad reportEntryLocationCityName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryLocationCityName(String value) {
                    this.reportEntryLocationCityName = value;
                }

                /**
                 * Obtiene el valor de la propiedad isBillable.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getIsBillable() {
                    return isBillable;
                }

                /**
                 * Define el valor de la propiedad isBillable.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setIsBillable(String value) {
                    this.isBillable = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryFromLocation.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryFromLocation() {
                    return reportEntryFromLocation;
                }

                /**
                 * Define el valor de la propiedad reportEntryFromLocation.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryFromLocation(String value) {
                    this.reportEntryFromLocation = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryToLocation.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryToLocation() {
                    return reportEntryToLocation;
                }

                /**
                 * Define el valor de la propiedad reportEntryToLocation.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryToLocation(String value) {
                    this.reportEntryToLocation = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryLocationName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryLocationName() {
                    return reportEntryLocationName;
                }

                /**
                 * Define el valor de la propiedad reportEntryLocationName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryLocationName(String value) {
                    this.reportEntryLocationName = value;
                }

                /**
                 * Obtiene el valor de la propiedad country.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getCountry() {
                    return country;
                }

                /**
                 * Define el valor de la propiedad country.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setCountry(String value) {
                    this.country = value;
                }

                /**
                 * Obtiene el valor de la propiedad stateProvince.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getStateProvince() {
                    return stateProvince;
                }

                /**
                 * Define el valor de la propiedad stateProvince.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setStateProvince(String value) {
                    this.stateProvince = value;
                }

                /**
                 * Obtiene el valor de la propiedad uuid.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getUUID() {
                    return uuid;
                }

                /**
                 * Define el valor de la propiedad uuid.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setUUID(String value) {
                    this.uuid = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse() {
                    return futureUse;
                }

                /**
                 * Define el valor de la propiedad futureUse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse(String value) {
                    this.futureUse = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse1() {
                    return futureUse1;
                }

                /**
                 * Define el valor de la propiedad futureUse1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse1(String value) {
                    this.futureUse1 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse2() {
                    return futureUse2;
                }

                /**
                 * Define el valor de la propiedad futureUse2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse2(String value) {
                    this.futureUse2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse3() {
                    return futureUse3;
                }

                /**
                 * Define el valor de la propiedad futureUse3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse3(String value) {
                    this.futureUse3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse4() {
                    return futureUse4;
                }

                /**
                 * Define el valor de la propiedad futureUse4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse4(String value) {
                    this.futureUse4 = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="RequestName" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TotalPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TotalApprovedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="StartDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="EndDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AuthorizedDate" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AuthorizationRequestID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse5" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse6" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse7" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse8" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse9" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse10" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse11" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse12" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse13" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse14" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse15" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse16" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse17" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse18" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse19" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse20" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse21" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse22" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse23" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse24" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse25" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse26" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse27" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse28" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse29" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse30" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse31" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse32" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse33" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse34" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse35" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse36" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class RequestData {

                @XmlAttribute(name = "RequestName")
                protected String requestName;
                @XmlAttribute(name = "TotalPostedAmount")
                protected String totalPostedAmount;
                @XmlAttribute(name = "TotalApprovedAmount")
                protected String totalApprovedAmount;
                @XmlAttribute(name = "StartDate")
                protected String startDate;
                @XmlAttribute(name = "EndDate")
                protected String endDate;
                @XmlAttribute(name = "AuthorizedDate")
                protected String authorizedDate;
                @XmlAttribute(name = "AuthorizationRequestID")
                protected String authorizationRequestID;
                @XmlAttribute(name = "FutureUse")
                protected String futureUse;
                @XmlAttribute(name = "FutureUse1")
                protected String futureUse1;
                @XmlAttribute(name = "FutureUse2")
                protected String futureUse2;
                @XmlAttribute(name = "FutureUse3")
                protected String futureUse3;
                @XmlAttribute(name = "FutureUse4")
                protected String futureUse4;
                @XmlAttribute(name = "FutureUse5")
                protected String futureUse5;
                @XmlAttribute(name = "FutureUse6")
                protected String futureUse6;
                @XmlAttribute(name = "FutureUse7")
                protected String futureUse7;
                @XmlAttribute(name = "FutureUse8")
                protected String futureUse8;
                @XmlAttribute(name = "FutureUse9")
                protected String futureUse9;
                @XmlAttribute(name = "FutureUse10")
                protected String futureUse10;
                @XmlAttribute(name = "FutureUse11")
                protected String futureUse11;
                @XmlAttribute(name = "FutureUse12")
                protected String futureUse12;
                @XmlAttribute(name = "FutureUse13")
                protected String futureUse13;
                @XmlAttribute(name = "FutureUse14")
                protected String futureUse14;
                @XmlAttribute(name = "FutureUse15")
                protected String futureUse15;
                @XmlAttribute(name = "FutureUse16")
                protected String futureUse16;
                @XmlAttribute(name = "FutureUse17")
                protected String futureUse17;
                @XmlAttribute(name = "FutureUse18")
                protected String futureUse18;
                @XmlAttribute(name = "FutureUse19")
                protected String futureUse19;
                @XmlAttribute(name = "FutureUse20")
                protected String futureUse20;
                @XmlAttribute(name = "FutureUse21")
                protected String futureUse21;
                @XmlAttribute(name = "FutureUse22")
                protected String futureUse22;
                @XmlAttribute(name = "FutureUse23")
                protected String futureUse23;
                @XmlAttribute(name = "FutureUse24")
                protected String futureUse24;
                @XmlAttribute(name = "FutureUse25")
                protected String futureUse25;
                @XmlAttribute(name = "FutureUse26")
                protected String futureUse26;
                @XmlAttribute(name = "FutureUse27")
                protected String futureUse27;
                @XmlAttribute(name = "FutureUse28")
                protected String futureUse28;
                @XmlAttribute(name = "FutureUse29")
                protected String futureUse29;
                @XmlAttribute(name = "FutureUse30")
                protected String futureUse30;
                @XmlAttribute(name = "FutureUse31")
                protected String futureUse31;
                @XmlAttribute(name = "FutureUse32")
                protected String futureUse32;
                @XmlAttribute(name = "FutureUse33")
                protected String futureUse33;
                @XmlAttribute(name = "FutureUse34")
                protected String futureUse34;
                @XmlAttribute(name = "FutureUse35")
                protected String futureUse35;
                @XmlAttribute(name = "FutureUse36")
                protected String futureUse36;

                /**
                 * Obtiene el valor de la propiedad requestName.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getRequestName() {
                    return requestName;
                }

                /**
                 * Define el valor de la propiedad requestName.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setRequestName(String value) {
                    this.requestName = value;
                }

                /**
                 * Obtiene el valor de la propiedad totalPostedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTotalPostedAmount() {
                    return totalPostedAmount;
                }

                /**
                 * Define el valor de la propiedad totalPostedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTotalPostedAmount(String value) {
                    this.totalPostedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad totalApprovedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTotalApprovedAmount() {
                    return totalApprovedAmount;
                }

                /**
                 * Define el valor de la propiedad totalApprovedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTotalApprovedAmount(String value) {
                    this.totalApprovedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad startDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getStartDate() {
                    return startDate;
                }

                /**
                 * Define el valor de la propiedad startDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setStartDate(String value) {
                    this.startDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad endDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getEndDate() {
                    return endDate;
                }

                /**
                 * Define el valor de la propiedad endDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setEndDate(String value) {
                    this.endDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad authorizedDate.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAuthorizedDate() {
                    return authorizedDate;
                }

                /**
                 * Define el valor de la propiedad authorizedDate.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAuthorizedDate(String value) {
                    this.authorizedDate = value;
                }

                /**
                 * Obtiene el valor de la propiedad authorizationRequestID.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAuthorizationRequestID() {
                    return authorizationRequestID;
                }

                /**
                 * Define el valor de la propiedad authorizationRequestID.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAuthorizationRequestID(String value) {
                    this.authorizationRequestID = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse() {
                    return futureUse;
                }

                /**
                 * Define el valor de la propiedad futureUse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse(String value) {
                    this.futureUse = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse1() {
                    return futureUse1;
                }

                /**
                 * Define el valor de la propiedad futureUse1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse1(String value) {
                    this.futureUse1 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse2() {
                    return futureUse2;
                }

                /**
                 * Define el valor de la propiedad futureUse2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse2(String value) {
                    this.futureUse2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse3() {
                    return futureUse3;
                }

                /**
                 * Define el valor de la propiedad futureUse3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse3(String value) {
                    this.futureUse3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse4() {
                    return futureUse4;
                }

                /**
                 * Define el valor de la propiedad futureUse4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse4(String value) {
                    this.futureUse4 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse5.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse5() {
                    return futureUse5;
                }

                /**
                 * Define el valor de la propiedad futureUse5.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse5(String value) {
                    this.futureUse5 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse6.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse6() {
                    return futureUse6;
                }

                /**
                 * Define el valor de la propiedad futureUse6.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse6(String value) {
                    this.futureUse6 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse7.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse7() {
                    return futureUse7;
                }

                /**
                 * Define el valor de la propiedad futureUse7.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse7(String value) {
                    this.futureUse7 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse8.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse8() {
                    return futureUse8;
                }

                /**
                 * Define el valor de la propiedad futureUse8.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse8(String value) {
                    this.futureUse8 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse9.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse9() {
                    return futureUse9;
                }

                /**
                 * Define el valor de la propiedad futureUse9.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse9(String value) {
                    this.futureUse9 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse10.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse10() {
                    return futureUse10;
                }

                /**
                 * Define el valor de la propiedad futureUse10.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse10(String value) {
                    this.futureUse10 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse11.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse11() {
                    return futureUse11;
                }

                /**
                 * Define el valor de la propiedad futureUse11.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse11(String value) {
                    this.futureUse11 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse12.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse12() {
                    return futureUse12;
                }

                /**
                 * Define el valor de la propiedad futureUse12.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse12(String value) {
                    this.futureUse12 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse13.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse13() {
                    return futureUse13;
                }

                /**
                 * Define el valor de la propiedad futureUse13.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse13(String value) {
                    this.futureUse13 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse14.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse14() {
                    return futureUse14;
                }

                /**
                 * Define el valor de la propiedad futureUse14.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse14(String value) {
                    this.futureUse14 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse15.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse15() {
                    return futureUse15;
                }

                /**
                 * Define el valor de la propiedad futureUse15.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse15(String value) {
                    this.futureUse15 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse16.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse16() {
                    return futureUse16;
                }

                /**
                 * Define el valor de la propiedad futureUse16.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse16(String value) {
                    this.futureUse16 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse17.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse17() {
                    return futureUse17;
                }

                /**
                 * Define el valor de la propiedad futureUse17.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse17(String value) {
                    this.futureUse17 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse18.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse18() {
                    return futureUse18;
                }

                /**
                 * Define el valor de la propiedad futureUse18.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse18(String value) {
                    this.futureUse18 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse19.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse19() {
                    return futureUse19;
                }

                /**
                 * Define el valor de la propiedad futureUse19.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse19(String value) {
                    this.futureUse19 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse20.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse20() {
                    return futureUse20;
                }

                /**
                 * Define el valor de la propiedad futureUse20.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse20(String value) {
                    this.futureUse20 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse21.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse21() {
                    return futureUse21;
                }

                /**
                 * Define el valor de la propiedad futureUse21.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse21(String value) {
                    this.futureUse21 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse22.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse22() {
                    return futureUse22;
                }

                /**
                 * Define el valor de la propiedad futureUse22.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse22(String value) {
                    this.futureUse22 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse23.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse23() {
                    return futureUse23;
                }

                /**
                 * Define el valor de la propiedad futureUse23.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse23(String value) {
                    this.futureUse23 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse24.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse24() {
                    return futureUse24;
                }

                /**
                 * Define el valor de la propiedad futureUse24.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse24(String value) {
                    this.futureUse24 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse25.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse25() {
                    return futureUse25;
                }

                /**
                 * Define el valor de la propiedad futureUse25.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse25(String value) {
                    this.futureUse25 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse26.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse26() {
                    return futureUse26;
                }

                /**
                 * Define el valor de la propiedad futureUse26.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse26(String value) {
                    this.futureUse26 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse27.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse27() {
                    return futureUse27;
                }

                /**
                 * Define el valor de la propiedad futureUse27.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse27(String value) {
                    this.futureUse27 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse28.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse28() {
                    return futureUse28;
                }

                /**
                 * Define el valor de la propiedad futureUse28.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse28(String value) {
                    this.futureUse28 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse29.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse29() {
                    return futureUse29;
                }

                /**
                 * Define el valor de la propiedad futureUse29.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse29(String value) {
                    this.futureUse29 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse30.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse30() {
                    return futureUse30;
                }

                /**
                 * Define el valor de la propiedad futureUse30.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse30(String value) {
                    this.futureUse30 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse31.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse31() {
                    return futureUse31;
                }

                /**
                 * Define el valor de la propiedad futureUse31.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse31(String value) {
                    this.futureUse31 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse32.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse32() {
                    return futureUse32;
                }

                /**
                 * Define el valor de la propiedad futureUse32.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse32(String value) {
                    this.futureUse32 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse33.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse33() {
                    return futureUse33;
                }

                /**
                 * Define el valor de la propiedad futureUse33.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse33(String value) {
                    this.futureUse33 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse34.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse34() {
                    return futureUse34;
                }

                /**
                 * Define el valor de la propiedad futureUse34.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse34(String value) {
                    this.futureUse34 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse35.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse35() {
                    return futureUse35;
                }

                /**
                 * Define el valor de la propiedad futureUse35.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse35(String value) {
                    this.futureUse35 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse36.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse36() {
                    return futureUse36;
                }

                /**
                 * Define el valor de la propiedad futureUse36.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse36(String value) {
                    this.futureUse36 = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="TAReimbursementtype" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TADisplaylimit" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TAAllowanceLimit" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllowableThreshold" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TAFixedMealLodgingType" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="BaseAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllowanceAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TAFixedOvernight" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TAFixedBreakfastProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TAFixedLunchProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="TAFixedDinnerProvidedFlag" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse-RESforBankAccount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse-RESforRoutingNumber" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class TravelAllowanceData {

                @XmlAttribute(name = "TAReimbursementtype")
                protected String taReimbursementtype;
                @XmlAttribute(name = "TADisplaylimit")
                protected String taDisplaylimit;
                @XmlAttribute(name = "TAAllowanceLimit")
                protected String taAllowanceLimit;
                @XmlAttribute(name = "AllowableThreshold")
                protected String allowableThreshold;
                @XmlAttribute(name = "TAFixedMealLodgingType")
                protected String taFixedMealLodgingType;
                @XmlAttribute(name = "BaseAmount")
                protected String baseAmount;
                @XmlAttribute(name = "AllowanceAmount")
                protected String allowanceAmount;
                @XmlAttribute(name = "TAFixedOvernight")
                protected String taFixedOvernight;
                @XmlAttribute(name = "TAFixedBreakfastProvidedFlag")
                protected String taFixedBreakfastProvidedFlag;
                @XmlAttribute(name = "TAFixedLunchProvidedFlag")
                protected String taFixedLunchProvidedFlag;
                @XmlAttribute(name = "TAFixedDinnerProvidedFlag")
                protected String taFixedDinnerProvidedFlag;
                @XmlAttribute(name = "FutureUse-RESforBankAccount")
                protected String futureUseRESforBankAccount;
                @XmlAttribute(name = "FutureUse-RESforRoutingNumber")
                protected String futureUseRESforRoutingNumber;

                /**
                 * Obtiene el valor de la propiedad taReimbursementtype.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTAReimbursementtype() {
                    return taReimbursementtype;
                }

                /**
                 * Define el valor de la propiedad taReimbursementtype.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTAReimbursementtype(String value) {
                    this.taReimbursementtype = value;
                }

                /**
                 * Obtiene el valor de la propiedad taDisplaylimit.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTADisplaylimit() {
                    return taDisplaylimit;
                }

                /**
                 * Define el valor de la propiedad taDisplaylimit.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTADisplaylimit(String value) {
                    this.taDisplaylimit = value;
                }

                /**
                 * Obtiene el valor de la propiedad taAllowanceLimit.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTAAllowanceLimit() {
                    return taAllowanceLimit;
                }

                /**
                 * Define el valor de la propiedad taAllowanceLimit.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTAAllowanceLimit(String value) {
                    this.taAllowanceLimit = value;
                }

                /**
                 * Obtiene el valor de la propiedad allowableThreshold.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllowableThreshold() {
                    return allowableThreshold;
                }

                /**
                 * Define el valor de la propiedad allowableThreshold.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllowableThreshold(String value) {
                    this.allowableThreshold = value;
                }

                /**
                 * Obtiene el valor de la propiedad taFixedMealLodgingType.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTAFixedMealLodgingType() {
                    return taFixedMealLodgingType;
                }

                /**
                 * Define el valor de la propiedad taFixedMealLodgingType.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTAFixedMealLodgingType(String value) {
                    this.taFixedMealLodgingType = value;
                }

                /**
                 * Obtiene el valor de la propiedad baseAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getBaseAmount() {
                    return baseAmount;
                }

                /**
                 * Define el valor de la propiedad baseAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setBaseAmount(String value) {
                    this.baseAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad allowanceAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllowanceAmount() {
                    return allowanceAmount;
                }

                /**
                 * Define el valor de la propiedad allowanceAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllowanceAmount(String value) {
                    this.allowanceAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad taFixedOvernight.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTAFixedOvernight() {
                    return taFixedOvernight;
                }

                /**
                 * Define el valor de la propiedad taFixedOvernight.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTAFixedOvernight(String value) {
                    this.taFixedOvernight = value;
                }

                /**
                 * Obtiene el valor de la propiedad taFixedBreakfastProvidedFlag.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTAFixedBreakfastProvidedFlag() {
                    return taFixedBreakfastProvidedFlag;
                }

                /**
                 * Define el valor de la propiedad taFixedBreakfastProvidedFlag.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTAFixedBreakfastProvidedFlag(String value) {
                    this.taFixedBreakfastProvidedFlag = value;
                }

                /**
                 * Obtiene el valor de la propiedad taFixedLunchProvidedFlag.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTAFixedLunchProvidedFlag() {
                    return taFixedLunchProvidedFlag;
                }

                /**
                 * Define el valor de la propiedad taFixedLunchProvidedFlag.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTAFixedLunchProvidedFlag(String value) {
                    this.taFixedLunchProvidedFlag = value;
                }

                /**
                 * Obtiene el valor de la propiedad taFixedDinnerProvidedFlag.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTAFixedDinnerProvidedFlag() {
                    return taFixedDinnerProvidedFlag;
                }

                /**
                 * Define el valor de la propiedad taFixedDinnerProvidedFlag.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTAFixedDinnerProvidedFlag(String value) {
                    this.taFixedDinnerProvidedFlag = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUseRESforBankAccount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUseRESforBankAccount() {
                    return futureUseRESforBankAccount;
                }

                /**
                 * Define el valor de la propiedad futureUseRESforBankAccount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUseRESforBankAccount(String value) {
                    this.futureUseRESforBankAccount = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUseRESforRoutingNumber.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUseRESforRoutingNumber() {
                    return futureUseRESforRoutingNumber;
                }

                /**
                 * Define el valor de la propiedad futureUseRESforRoutingNumber.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUseRESforRoutingNumber(String value) {
                    this.futureUseRESforRoutingNumber = value;
                }

            }


            /**
             * <p>Clase Java para anonymous complex type.
             * 
             * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
             * 
             * <pre>
             * &lt;complexType>
             *   &lt;complexContent>
             *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
             *       &lt;attribute name="Taxauthorityname" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Taxlabel" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Taxtransactionamount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Taxpostedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Taxsource" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Taxreclaimtransactionamount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Taxreclaimpostedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Taxcode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReclaimDomestic" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Taxadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Taxreclaimadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Taxreclaimcode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="Taxreclaimtransactionadjustedamount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryTaxAllocationReclaimCode" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AuthRequestID" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryTotalTaxPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="NetTaxAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="ReportEntryTotal" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="NetAdjusted" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationTotalTaxTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationTotalTaxPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationTotalTaxReclaimTransactionAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationTotalTaxReclaimPostedAmount" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="AllocationTotalTaxReclaimTransactionAdjust" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse1" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse2" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse3" type="{http://www.w3.org/2001/XMLSchema}string" />
             *       &lt;attribute name="FutureUse4" type="{http://www.w3.org/2001/XMLSchema}string" />
             *     &lt;/restriction>
             *   &lt;/complexContent>
             * &lt;/complexType>
             * </pre>
             * 
             * 
             */
            @XmlAccessorType(XmlAccessType.FIELD)
            @XmlType(name = "")
            public static class VATTaxData {

                @XmlAttribute(name = "Taxauthorityname")
                protected String taxauthorityname;
                @XmlAttribute(name = "Taxlabel")
                protected String taxlabel;
                @XmlAttribute(name = "Taxtransactionamount")
                protected String taxtransactionamount;
                @XmlAttribute(name = "Taxpostedamount")
                protected String taxpostedamount;
                @XmlAttribute(name = "Taxsource")
                protected String taxsource;
                @XmlAttribute(name = "Taxreclaimtransactionamount")
                protected String taxreclaimtransactionamount;
                @XmlAttribute(name = "Taxreclaimpostedamount")
                protected String taxreclaimpostedamount;
                @XmlAttribute(name = "Taxcode")
                protected String taxcode;
                @XmlAttribute(name = "ReclaimDomestic")
                protected String reclaimDomestic;
                @XmlAttribute(name = "Taxadjustedamount")
                protected String taxadjustedamount;
                @XmlAttribute(name = "Taxreclaimadjustedamount")
                protected String taxreclaimadjustedamount;
                @XmlAttribute(name = "Taxreclaimcode")
                protected String taxreclaimcode;
                @XmlAttribute(name = "Taxreclaimtransactionadjustedamount")
                protected String taxreclaimtransactionadjustedamount;
                @XmlAttribute(name = "ReportEntryTaxAllocationReclaimCode")
                protected String reportEntryTaxAllocationReclaimCode;
                @XmlAttribute(name = "AuthRequestID")
                protected String authRequestID;
                @XmlAttribute(name = "ReportEntryTotalTaxPostedAmount")
                protected String reportEntryTotalTaxPostedAmount;
                @XmlAttribute(name = "NetTaxAmount")
                protected String netTaxAmount;
                @XmlAttribute(name = "ReportEntryTotal")
                protected String reportEntryTotal;
                @XmlAttribute(name = "NetAdjusted")
                protected String netAdjusted;
                @XmlAttribute(name = "AllocationTotalTaxTransactionAmount")
                protected String allocationTotalTaxTransactionAmount;
                @XmlAttribute(name = "AllocationTotalTaxPostedAmount")
                protected String allocationTotalTaxPostedAmount;
                @XmlAttribute(name = "AllocationTotalTaxReclaimTransactionAmount")
                protected String allocationTotalTaxReclaimTransactionAmount;
                @XmlAttribute(name = "AllocationTotalTaxReclaimPostedAmount")
                protected String allocationTotalTaxReclaimPostedAmount;
                @XmlAttribute(name = "AllocationTotalTaxReclaimTransactionAdjust")
                protected String allocationTotalTaxReclaimTransactionAdjust;
                @XmlAttribute(name = "FutureUse")
                protected String futureUse;
                @XmlAttribute(name = "FutureUse1")
                protected String futureUse1;
                @XmlAttribute(name = "FutureUse2")
                protected String futureUse2;
                @XmlAttribute(name = "FutureUse3")
                protected String futureUse3;
                @XmlAttribute(name = "FutureUse4")
                protected String futureUse4;

                /**
                 * Obtiene el valor de la propiedad taxauthorityname.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxauthorityname() {
                    return taxauthorityname;
                }

                /**
                 * Define el valor de la propiedad taxauthorityname.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxauthorityname(String value) {
                    this.taxauthorityname = value;
                }

                /**
                 * Obtiene el valor de la propiedad taxlabel.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxlabel() {
                    return taxlabel;
                }

                /**
                 * Define el valor de la propiedad taxlabel.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxlabel(String value) {
                    this.taxlabel = value;
                }

                /**
                 * Obtiene el valor de la propiedad taxtransactionamount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxtransactionamount() {
                    return taxtransactionamount;
                }

                /**
                 * Define el valor de la propiedad taxtransactionamount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxtransactionamount(String value) {
                    this.taxtransactionamount = value;
                }

                /**
                 * Obtiene el valor de la propiedad taxpostedamount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxpostedamount() {
                    return taxpostedamount;
                }

                /**
                 * Define el valor de la propiedad taxpostedamount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxpostedamount(String value) {
                    this.taxpostedamount = value;
                }

                /**
                 * Obtiene el valor de la propiedad taxsource.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxsource() {
                    return taxsource;
                }

                /**
                 * Define el valor de la propiedad taxsource.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxsource(String value) {
                    this.taxsource = value;
                }

                /**
                 * Obtiene el valor de la propiedad taxreclaimtransactionamount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxreclaimtransactionamount() {
                    return taxreclaimtransactionamount;
                }

                /**
                 * Define el valor de la propiedad taxreclaimtransactionamount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxreclaimtransactionamount(String value) {
                    this.taxreclaimtransactionamount = value;
                }

                /**
                 * Obtiene el valor de la propiedad taxreclaimpostedamount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxreclaimpostedamount() {
                    return taxreclaimpostedamount;
                }

                /**
                 * Define el valor de la propiedad taxreclaimpostedamount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxreclaimpostedamount(String value) {
                    this.taxreclaimpostedamount = value;
                }

                /**
                 * Obtiene el valor de la propiedad taxcode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxcode() {
                    return taxcode;
                }

                /**
                 * Define el valor de la propiedad taxcode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxcode(String value) {
                    this.taxcode = value;
                }

                /**
                 * Obtiene el valor de la propiedad reclaimDomestic.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReclaimDomestic() {
                    return reclaimDomestic;
                }

                /**
                 * Define el valor de la propiedad reclaimDomestic.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReclaimDomestic(String value) {
                    this.reclaimDomestic = value;
                }

                /**
                 * Obtiene el valor de la propiedad taxadjustedamount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxadjustedamount() {
                    return taxadjustedamount;
                }

                /**
                 * Define el valor de la propiedad taxadjustedamount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxadjustedamount(String value) {
                    this.taxadjustedamount = value;
                }

                /**
                 * Obtiene el valor de la propiedad taxreclaimadjustedamount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxreclaimadjustedamount() {
                    return taxreclaimadjustedamount;
                }

                /**
                 * Define el valor de la propiedad taxreclaimadjustedamount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxreclaimadjustedamount(String value) {
                    this.taxreclaimadjustedamount = value;
                }

                /**
                 * Obtiene el valor de la propiedad taxreclaimcode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxreclaimcode() {
                    return taxreclaimcode;
                }

                /**
                 * Define el valor de la propiedad taxreclaimcode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxreclaimcode(String value) {
                    this.taxreclaimcode = value;
                }

                /**
                 * Obtiene el valor de la propiedad taxreclaimtransactionadjustedamount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getTaxreclaimtransactionadjustedamount() {
                    return taxreclaimtransactionadjustedamount;
                }

                /**
                 * Define el valor de la propiedad taxreclaimtransactionadjustedamount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setTaxreclaimtransactionadjustedamount(String value) {
                    this.taxreclaimtransactionadjustedamount = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryTaxAllocationReclaimCode.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryTaxAllocationReclaimCode() {
                    return reportEntryTaxAllocationReclaimCode;
                }

                /**
                 * Define el valor de la propiedad reportEntryTaxAllocationReclaimCode.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryTaxAllocationReclaimCode(String value) {
                    this.reportEntryTaxAllocationReclaimCode = value;
                }

                /**
                 * Obtiene el valor de la propiedad authRequestID.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAuthRequestID() {
                    return authRequestID;
                }

                /**
                 * Define el valor de la propiedad authRequestID.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAuthRequestID(String value) {
                    this.authRequestID = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryTotalTaxPostedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryTotalTaxPostedAmount() {
                    return reportEntryTotalTaxPostedAmount;
                }

                /**
                 * Define el valor de la propiedad reportEntryTotalTaxPostedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryTotalTaxPostedAmount(String value) {
                    this.reportEntryTotalTaxPostedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad netTaxAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getNetTaxAmount() {
                    return netTaxAmount;
                }

                /**
                 * Define el valor de la propiedad netTaxAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setNetTaxAmount(String value) {
                    this.netTaxAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad reportEntryTotal.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getReportEntryTotal() {
                    return reportEntryTotal;
                }

                /**
                 * Define el valor de la propiedad reportEntryTotal.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setReportEntryTotal(String value) {
                    this.reportEntryTotal = value;
                }

                /**
                 * Obtiene el valor de la propiedad netAdjusted.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getNetAdjusted() {
                    return netAdjusted;
                }

                /**
                 * Define el valor de la propiedad netAdjusted.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setNetAdjusted(String value) {
                    this.netAdjusted = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationTotalTaxTransactionAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationTotalTaxTransactionAmount() {
                    return allocationTotalTaxTransactionAmount;
                }

                /**
                 * Define el valor de la propiedad allocationTotalTaxTransactionAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationTotalTaxTransactionAmount(String value) {
                    this.allocationTotalTaxTransactionAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationTotalTaxPostedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationTotalTaxPostedAmount() {
                    return allocationTotalTaxPostedAmount;
                }

                /**
                 * Define el valor de la propiedad allocationTotalTaxPostedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationTotalTaxPostedAmount(String value) {
                    this.allocationTotalTaxPostedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationTotalTaxReclaimTransactionAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationTotalTaxReclaimTransactionAmount() {
                    return allocationTotalTaxReclaimTransactionAmount;
                }

                /**
                 * Define el valor de la propiedad allocationTotalTaxReclaimTransactionAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationTotalTaxReclaimTransactionAmount(String value) {
                    this.allocationTotalTaxReclaimTransactionAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationTotalTaxReclaimPostedAmount.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationTotalTaxReclaimPostedAmount() {
                    return allocationTotalTaxReclaimPostedAmount;
                }

                /**
                 * Define el valor de la propiedad allocationTotalTaxReclaimPostedAmount.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationTotalTaxReclaimPostedAmount(String value) {
                    this.allocationTotalTaxReclaimPostedAmount = value;
                }

                /**
                 * Obtiene el valor de la propiedad allocationTotalTaxReclaimTransactionAdjust.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getAllocationTotalTaxReclaimTransactionAdjust() {
                    return allocationTotalTaxReclaimTransactionAdjust;
                }

                /**
                 * Define el valor de la propiedad allocationTotalTaxReclaimTransactionAdjust.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setAllocationTotalTaxReclaimTransactionAdjust(String value) {
                    this.allocationTotalTaxReclaimTransactionAdjust = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse() {
                    return futureUse;
                }

                /**
                 * Define el valor de la propiedad futureUse.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse(String value) {
                    this.futureUse = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse1.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse1() {
                    return futureUse1;
                }

                /**
                 * Define el valor de la propiedad futureUse1.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse1(String value) {
                    this.futureUse1 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse2.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse2() {
                    return futureUse2;
                }

                /**
                 * Define el valor de la propiedad futureUse2.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse2(String value) {
                    this.futureUse2 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse3.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse3() {
                    return futureUse3;
                }

                /**
                 * Define el valor de la propiedad futureUse3.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse3(String value) {
                    this.futureUse3 = value;
                }

                /**
                 * Obtiene el valor de la propiedad futureUse4.
                 * 
                 * @return
                 *     possible object is
                 *     {@link String }
                 *     
                 */
                public String getFutureUse4() {
                    return futureUse4;
                }

                /**
                 * Define el valor de la propiedad futureUse4.
                 * 
                 * @param value
                 *     allowed object is
                 *     {@link String }
                 *     
                 */
                public void setFutureUse4(String value) {
                    this.futureUse4 = value;
                }

            }

        }

    }

}
