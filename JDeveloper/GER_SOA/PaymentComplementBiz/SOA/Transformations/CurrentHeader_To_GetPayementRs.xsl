<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:ns0="http://soa.estrellaroja.com.mx/PaymentComplementBiz" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:tns="http://soa.estrellaroja.com.mx/CommonPaymentsTec" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns1="http://soa.estrellaroja.com.mx/CommonPaymentsTec/types" xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns5="http://soa.estrellaroja.com.mx/SOAUtilitiesTec"
                xmlns:client="http://soa.estrellaroja.com.mx/PaymentComplementBiz/bpelStampPaymentComplement"
                xmlns:ns2="http://schemas.oracle.com/bpel/extension"
                xmlns:ns4="http://soa.estrellaroja.com.mx/AuditControlTec"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelHandleMergedStamping.wsdl"/>
            <oracle-xsl-mapper:rootElement name="CurrentHeader" namespace="http://soa.estrellaroja.com.mx/PaymentComplementBiz"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/CommonPaymentsTecWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetPayementRs" namespace="http://soa.estrellaroja.com.mx/CommonPaymentsTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [WED DEC 13 13:57:20 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:variable name="currentUser" select="dvm:lookupValue (&quot;Dvms/Configuration.dvm&quot;, &quot;PropertyName&quot;, &quot;INTEGRATION_NAME&quot;, &quot;PropertyValue&quot;, &quot;&quot; )"/>
   <xsl:variable name="currentTimestamp" select="xp20:current-dateTime ( )"/>
   <xsl:template match="/">
      <tns:GetPayementRs>
         <cmn:Success/>
         <tns:Return>
            <tns:Payment>
               <tns:CreatedBy>
                  <xsl:value-of select="$currentUser"/>
               </tns:CreatedBy>
               <tns:CreationDate>
                  <xsl:value-of select="$currentTimestamp"/>
               </tns:CreationDate>
               <tns:LastUpdatedBy>
                  <xsl:value-of select="$currentUser"/>
               </tns:LastUpdatedBy>
               <tns:LastUpdateDate>
                  <xsl:value-of select="$currentTimestamp"/>
               </tns:LastUpdateDate>
               <tns:ObjectVersionNumber>
                  <xsl:value-of select="&quot;0&quot;"/>
               </tns:ObjectVersionNumber>
               <tns:CashReceiptId>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:CashReceiptId"/>
               </tns:CashReceiptId>
               <tns:ReceiptNumber>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiptNumber"/>
               </tns:ReceiptNumber>
               <tns:CustomerNumber>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:CustomerNumber"/>
               </tns:CustomerNumber>
               <tns:AccountNumber>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:AccountNumber"/>
               </tns:AccountNumber>
               <tns:SiteNumber>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:SiteNumber"/>
               </tns:SiteNumber>
               <tns:PaymentType>
                  <xsl:value-of select="&quot;COMPLEMENT&quot;"/>
               </tns:PaymentType>
               <xsl:if test="/ns0:CurrentHeader/ns0:Currency">
                  <tns:CurrencyCode>
                     <xsl:value-of select="/ns0:CurrentHeader/ns0:Currency"/>
                  </tns:CurrencyCode>
               </xsl:if>
               <tns:ReceipMethod>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiptMethod"/>
               </tns:ReceipMethod>
               <tns:SourceLastUpdatedBy>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:LastUpatedby"/>
               </tns:SourceLastUpdatedBy>
               <tns:TextPlainContent/>
               <xsl:for-each select="/ns0:CurrentHeader/ns0:Lines">
                  <tns:PaymentDetail>
                     <tns:CreatedBy>
                        <xsl:value-of select="$currentUser"/>
                     </tns:CreatedBy>
                     <tns:CreationDate>
                        <xsl:value-of select="$currentTimestamp"/>
                     </tns:CreationDate>
                     <tns:LastUpdatedBy>
                        <xsl:value-of select="$currentUser"/>
                     </tns:LastUpdatedBy>
                     <tns:LastUpdateDate>
                        <xsl:value-of select="$currentTimestamp"/>
                     </tns:LastUpdateDate>
                     <tns:ObjectVersionNumber>
                        <xsl:value-of select="&quot;0&quot;"/>
                     </tns:ObjectVersionNumber>
                     <tns:Uuid>
                        <xsl:value-of select="ns0:DocumentId"/>
                     </tns:Uuid>
                     <tns:InvoiceNumber>
                        <xsl:value-of select="ns0:InvoiceNumber"/>
                     </tns:InvoiceNumber>
                     <tns:InstallmentNumber>
                        <xsl:value-of select="ns0:InstallmentNumber"/>
                     </tns:InstallmentNumber>
                     <tns:ReceivableApplicationId>
                        <xsl:value-of select="ns0:ReceivableApplicationId"/>
                     </tns:ReceivableApplicationId>
                     <tns:TrxNumber>
                        <xsl:value-of select="ns0:TrxNumber"/>
                     </tns:TrxNumber>
                     <tns:BalanceBefore>
                        <xsl:value-of select="ns0:PreviousBalance"/>
                     </tns:BalanceBefore>
                     <tns:BalanceAfter>
                        <xsl:value-of select="ns0:OutStandingBalance"/>
                     </tns:BalanceAfter>
                     <tns:CurrencyCode>
                        <xsl:value-of select="ns0:Currency"/>
                     </tns:CurrencyCode>
                  </tns:PaymentDetail>
               </xsl:for-each>
            </tns:Payment>
         </tns:Return>
      </tns:GetPayementRs>
   </xsl:template>
</xsl:stylesheet>