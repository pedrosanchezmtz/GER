<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbHierarchy"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:tns="http://soa.estrellaroja.com.mx/CommonPaymentsTec"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plt="http://schemas.xmlsoap.org/ws/2003/05/partner-link/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns1="http://xmlns.oracle.com/pcbpel/adapter/db/CommonPaymentsTec/CommonPaymentsTec/dbHierarchy"
                xmlns:jca="http://xmlns.oracle.com/pcbpel/wsdl/jca/"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns2="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:client="http://soa.estrellaroja.com.mx/CommonPaymentsTec/bpelGetPayement">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/dbHierarchy.wsdl"/>
            <oracle-xsl-mapper:rootElement name="XxerPaymentsCollection"
                                           namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbHierarchy"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelGetPayement.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetPayementRs"
                                           namespace="http://soa.estrellaroja.com.mx/CommonPaymentsTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU DEC 07 15:19:28 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:GetPayementRs>
         <xsl:if test="count(/ns0:XxerPaymentsCollection/ns0:XxerPayments)>0">
            <ns2:Success/>
         </xsl:if>
         <tns:Return>
            <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:xxerPaymentDetailsCollection">
               <tns:Payment>
                  <tns:CreatedBy>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:createdBy"/>
                  </tns:CreatedBy>
                  <tns:CreationDate>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:creationDate"/>
                  </tns:CreationDate>
                  <tns:LastUpdatedBy>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:lastUpdatedBy"/>
                  </tns:LastUpdatedBy>
                  <tns:LastUpdateDate>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:lastUpdateDate"/>
                  </tns:LastUpdateDate>
                  <tns:ObjectVersionNumber>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:objectVersionNumber"/>
                  </tns:ObjectVersionNumber>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:uuid">
                     <tns:Uuid>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:uuid"/>
                     </tns:Uuid>
                  </xsl:if>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:uuidDate">
                     <tns:UuidDate>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:uuidDate"/>
                     </tns:UuidDate>
                  </xsl:if>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:status">
                     <tns:Status>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:status"/>
                     </tns:Status>
                  </xsl:if>
                  <tns:PaymentId>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:paymentId"/>
                  </tns:PaymentId>
                  <tns:CashReceiptId>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:cashReceiptId"/>
                  </tns:CashReceiptId>
                  <tns:ReceiptNumber>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:receiptNumber"/>
                  </tns:ReceiptNumber>
                  <tns:CustomerNumber>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:customerNumber"/>
                  </tns:CustomerNumber>
                  <tns:AccountNumber>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:accountNumber"/>
                  </tns:AccountNumber>
                  <tns:SiteNumber>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:siteNumber"/>
                  </tns:SiteNumber>
                  <tns:PaymentType>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:paymentType"/>
                  </tns:PaymentType>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:currencyCode">
                     <tns:CurrencyCode>
                        <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:currencyCode/@xsi:nil">
                           <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:currencyCode/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:currencyCode"/>
                     </tns:CurrencyCode>
                  </xsl:if>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:receipMethod">
                     <tns:ReceipMethod>
                        <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:receipMethod/@xsi:nil">
                           <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:receipMethod/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:receipMethod"/>
                     </tns:ReceipMethod>
                  </xsl:if>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:subtotal">
                     <tns:SubTotal>
                        <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:subtotal/@xsi:nil">
                           <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:subtotal/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:subtotal"/>
                     </tns:SubTotal>
                  </xsl:if>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:iva">
                     <tns:Iva>
                        <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:iva/@xsi:nil">
                           <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:iva/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:iva"/>
                     </tns:Iva>
                  </xsl:if>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:total">
                     <tns:Total>
                        <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:total/@xsi:nil">
                           <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:total/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:total"/>
                     </tns:Total>
                  </xsl:if>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute1">
                     <tns:Attribute1>
                        <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute1/@xsi:nil">
                           <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute1/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute1"/>
                     </tns:Attribute1>
                  </xsl:if>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute2">
                     <tns:Attribute2>
                        <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute2/@xsi:nil">
                           <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute2/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute2"/>
                     </tns:Attribute2>
                  </xsl:if>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute3">
                     <tns:Attribute3>
                        <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute3/@xsi:nil">
                           <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute3/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute3"/>
                     </tns:Attribute3>
                  </xsl:if>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute4">
                     <tns:Attribute4>
                        <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute4/@xsi:nil">
                           <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute4/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute4"/>
                     </tns:Attribute4>
                  </xsl:if>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute5">
                     <tns:Attribute5>
                        <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute5/@xsi:nil">
                           <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                              <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute5/@xsi:nil"/>
                           </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:attribute5"/>
                     </tns:Attribute5>
                  </xsl:if>
                  <tns:SourceLastUpdatedBy>
                     <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:sourceLastUpdatedBy"/>
                  </tns:SourceLastUpdatedBy>
                  <xsl:if test="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:content">
                     <tns:TextPlainContent>
                        <xsl:value-of select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:content"/>
                     </tns:TextPlainContent>
                  </xsl:if>
                  <xsl:for-each select="/ns0:XxerPaymentsCollection/ns0:XxerPayments/ns0:xxerPaymentDetailsCollection/ns0:XxerPaymentDetails">
                     <tns:PaymentDetail>
                        <tns:CreatedBy>
                           <xsl:value-of select="ns0:createdBy"/>
                        </tns:CreatedBy>
                        <tns:CreationDate>
                           <xsl:value-of select="ns0:creationDate"/>
                        </tns:CreationDate>
                        <tns:LastUpdatedBy>
                           <xsl:value-of select="ns0:lastUpdatedBy"/>
                        </tns:LastUpdatedBy>
                        <tns:LastUpdateDate>
                           <xsl:value-of select="ns0:lastUpdateDate"/>
                        </tns:LastUpdateDate>
                        <tns:ObjectVersionNumber>
                           <xsl:value-of select="ns0:objectVersionNumber"/>
                        </tns:ObjectVersionNumber>
                        <xsl:if test="ns0:uuid">
                           <tns:Uuid>
                              <xsl:value-of select="ns0:uuid"/>
                           </tns:Uuid>
                        </xsl:if>
                        <xsl:if test="ns0:uuidDate">
                           <tns:UuidDate>
                              <xsl:value-of select="ns0:uuidDate"/>
                           </tns:UuidDate>
                        </xsl:if>
                        <xsl:if test="ns0:status">
                           <tns:Status>
                              <xsl:value-of select="ns0:status"/>
                           </tns:Status>
                        </xsl:if>
                        <tns:PaymentDetailId>
                           <xsl:value-of select="ns0:paymentDetailId"/>
                        </tns:PaymentDetailId>
                        <tns:InvoiceNumber>
                           <xsl:value-of select="ns0:invoiceNumber"/>
                        </tns:InvoiceNumber>
                        <tns:InstallmentNumber>
                           <xsl:value-of select="ns0:installmentNumber"/>
                        </tns:InstallmentNumber>
                        <tns:ReceivableApplicationId>
                           <xsl:value-of select="ns0:receivableApplicationId"/>
                        </tns:ReceivableApplicationId>
                        <tns:TrxNumber>
                           <xsl:value-of select="ns0:trxNumber"/>
                        </tns:TrxNumber>
                        <tns:BalanceBefore>
                           <xsl:value-of select="ns0:balanceBefore"/>
                        </tns:BalanceBefore>
                        <tns:BalanceAfter>
                           <xsl:value-of select="ns0:balanceAfter"/>
                        </tns:BalanceAfter>
                        <xsl:if test="ns0:currencyCode">
                           <tns:CurrencyCode>
                              <xsl:if test="ns0:currencyCode/@xsi:nil">
                                 <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                    <xsl:value-of select="ns0:currencyCode/@xsi:nil"/>
                                 </xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="ns0:currencyCode"/>
                           </tns:CurrencyCode>
                        </xsl:if>
                        <xsl:if test="ns0:total">
                           <tns:Total>
                              <xsl:if test="ns0:total/@xsi:nil">
                                 <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                    <xsl:value-of select="ns0:total/@xsi:nil"/>
                                 </xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="ns0:total"/>
                           </tns:Total>
                        </xsl:if>
                        <xsl:if test="ns0:attribute1">
                           <tns:Attribute1>
                              <xsl:if test="ns0:attribute1/@xsi:nil">
                                 <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                    <xsl:value-of select="ns0:attribute1/@xsi:nil"/>
                                 </xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="ns0:attribute1"/>
                           </tns:Attribute1>
                        </xsl:if>
                        <xsl:if test="ns0:attribute2">
                           <tns:Attribute2>
                              <xsl:if test="ns0:attribute2/@xsi:nil">
                                 <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                    <xsl:value-of select="ns0:attribute2/@xsi:nil"/>
                                 </xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="ns0:attribute2"/>
                           </tns:Attribute2>
                        </xsl:if>
                        <xsl:if test="ns0:attribute3">
                           <tns:Attribute3>
                              <xsl:if test="ns0:attribute3/@xsi:nil">
                                 <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                    <xsl:value-of select="ns0:attribute3/@xsi:nil"/>
                                 </xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="ns0:attribute3"/>
                           </tns:Attribute3>
                        </xsl:if>
                        <xsl:if test="ns0:attribute4">
                           <tns:Attribute4>
                              <xsl:if test="ns0:attribute4/@xsi:nil">
                                 <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                    <xsl:value-of select="ns0:attribute4/@xsi:nil"/>
                                 </xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="ns0:attribute4"/>
                           </tns:Attribute4>
                        </xsl:if>
                        <xsl:if test="ns0:attribute5">
                           <tns:Attribute5>
                              <xsl:if test="ns0:attribute5/@xsi:nil">
                                 <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                                    <xsl:value-of select="ns0:attribute5/@xsi:nil"/>
                                 </xsl:attribute>
                              </xsl:if>
                              <xsl:value-of select="ns0:attribute5"/>
                           </tns:Attribute5>
                        </xsl:if>
                     </tns:PaymentDetail>
                  </xsl:for-each>
               </tns:Payment>
            </xsl:if>
         </tns:Return>
      </tns:GetPayementRs>
   </xsl:template>
</xsl:stylesheet>
