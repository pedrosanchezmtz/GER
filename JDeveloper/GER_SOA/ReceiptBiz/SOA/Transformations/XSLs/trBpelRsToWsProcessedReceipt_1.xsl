<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://soa.estrellaroja.com.mx/SOAUtilitiesTec" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:tns="http://soa.estrellaroja.com.mx/ReceiptBiz" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://soa.estrellaroja.com.mx/FinancialsTec" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns1 ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:ns2="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:ns3="http://soa.estrellaroja.com.mx/FinancialsTec/types" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns4="http://soa.estrellaroja.com.mx/SOAUtilitiesTec/types" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns6="http://soa.estrellaroja.com.mx/StructureReceipt" xmlns:ns5="http://schemas.oracle.com/bpel/extension" xmlns:client="http://soa.estrellaroja.com.mx/ReceiptBiz/bpelDigitalStampReceipts">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/FinancialsTecWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ProcessedReceiptRs" namespace="http://soa.estrellaroja.com.mx/FinancialsTec"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/SOAUtilitiesTecWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetHtmlControlRq" namespace="http://soa.estrellaroja.com.mx/SOAUtilitiesTec"/>
            <oracle-xsl-mapper:param name="varHtmlInput.GetHtmlControlRq"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelDigitalStampReceipts.wsdl"/>
            <oracle-xsl-mapper:rootElement name="DigitalStampReceiptsRs" namespace="http://soa.estrellaroja.com.mx/ReceiptBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU APR 05 23:20:22 CDT 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="varHtmlInput.GetHtmlControlRq"/>
   <xsl:template match="/">
      <tns:DigitalStampReceiptsRs>
         <tns:Return>
            <tns:Data>
               <xsl:for-each select="/ns0:ProcessedReceiptRs/ns0:Return/ns0:ApplyReceipts">
                  <tns:ProcessedApplyReceipt>
                     <tns:AMOUNT>
                        <xsl:value-of select="ns0:AMOUNT"/>
                     </tns:AMOUNT>
                     <tns:RECEIPT_ID>
                        <xsl:value-of select="ns0:RECEIPT_ID"/>
                     </tns:RECEIPT_ID>
                     <tns:RECEIPT_NUMBER>
                        <xsl:value-of select="ns0:RECEIPT_NUMBER"/>
                     </tns:RECEIPT_NUMBER>
                     <tns:TRANSACTION_NUMBER>
                        <xsl:value-of select="ns0:TRANSACTION_NUMBER"/>
                     </tns:TRANSACTION_NUMBER>
                     <tns:CUSTOMER_NAME>
                        <xsl:value-of select="ns0:CUSTOMER_NAME"/>
                     </tns:CUSTOMER_NAME>
                     <tns:APPLICATION_DATE>
                        <xsl:value-of select="ns0:APPLICATION_DATE"/>
                     </tns:APPLICATION_DATE>
                     <tns:ACCOUNTING_DATE>
                        <xsl:value-of select="ns0:ACCOUNTING_DATE"/>
                     </tns:ACCOUNTING_DATE>
                     <tns:CUST_ACCOUNT_ID>
                        <xsl:value-of select="ns0:CUST_ACCOUNT_ID"/>
                     </tns:CUST_ACCOUNT_ID>
                     <tns:ORGANIZATION_ID>
                        <xsl:value-of select="ns0:ORGANIZATION_ID"/>
                     </tns:ORGANIZATION_ID>
                     <tns:CUSTOMER_TRX_ID>
                        <xsl:value-of select="ns0:CUST_ACCOUNT_ID"/>
                     </tns:CUSTOMER_TRX_ID>
                     <tns:UUID/>
                     <tns:BUSINESS_UNIT/>
                     <tns:METODO_RECIBO>
                        <xsl:value-of select="ns0:METODO_RECIBO"/>
                     </tns:METODO_RECIBO>
                     <tns:RECEIPT_APPLY_ID>
                        <xsl:value-of select="ns0:RECEIPT_APPLY_ID"/>
                     </tns:RECEIPT_APPLY_ID>
                  </tns:ProcessedApplyReceipt>
               </xsl:for-each>
            </tns:Data>
            <tns:GetHtmlControlRq>
               <tns:TotalSucceeded>
                  <xsl:value-of select="$varHtmlInput.GetHtmlControlRq/ns1:GetHtmlControlRq/ns1:TotalSucceeded"/>
               </tns:TotalSucceeded>
               <tns:TotalErrors>
                  <xsl:value-of select="$varHtmlInput.GetHtmlControlRq/ns1:GetHtmlControlRq/ns1:TotalErrors"/>
               </tns:TotalErrors>
               <tns:ErrorsDetails>
                  <xsl:for-each select="$varHtmlInput.GetHtmlControlRq/ns1:GetHtmlControlRq/ns1:ErrorsDetails/ns1:ErrorDetail">
                     <tns:ErrorDetail>
                        <tns:DataValue>
                           <xsl:value-of select="ns1:DataValue"/>
                        </tns:DataValue>
                        <tns:ErrorMessage>
                           <xsl:value-of select="ns1:ErrorMessage"/>
                        </tns:ErrorMessage>
                     </tns:ErrorDetail>
                  </xsl:for-each>
               </tns:ErrorsDetails>
            </tns:GetHtmlControlRq>
         </tns:Return>
      </tns:DigitalStampReceiptsRs>
   </xsl:template>
</xsl:stylesheet>