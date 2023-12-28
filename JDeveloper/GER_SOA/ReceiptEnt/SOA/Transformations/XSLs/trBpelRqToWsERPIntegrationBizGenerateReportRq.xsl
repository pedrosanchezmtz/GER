<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://soa.estrellaroja.com.mx/FinancialBiz" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:tns="http://soa.estrellaroja.com.mx/ERPIntegrationBiz" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:ns0="http://soa.estrellaroja.com.mx/ReceiptEnt" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns1 ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:ns2="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns4="http://soa.estrellaroja.com.mx/FinancialBiz/types" xmlns:ns3="http://soa.estrellaroja.com.mx/ReceiptEnt/types" xmlns:ns5="http://soa.estrellaroja.com.mx/ERPIntegrationBiz/types"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelCreateReceipts.wsdl"/>
            <oracle-xsl-mapper:rootElement name="CreateReceiptsRq" namespace="http://soa.estrellaroja.com.mx/ReceiptEnt"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/FinancialBizWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetRfcRs" namespace="http://soa.estrellaroja.com.mx/FinancialBiz"/>
            <oracle-xsl-mapper:param name="varInvokeWsFinancialBizGetRfcRs.GetRfcRs"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/ERPIntegrationBizWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GenerateReportRq" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU DEC 14 09:40:04 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="varInvokeWsFinancialBizGetRfcRs.GetRfcRs"/>
   <xsl:template match="/">
      <tns:GenerateReportRq>
         <tns:TargetInterface>
            <xsl:value-of select="dvm:lookupValue (&quot;DVM/dvmCreateReceiptEnt.dvm&quot;, &quot;Code&quot;, &quot;TargetInterface&quot;, &quot;Value&quot;, &quot;&quot; )"/>
         </tns:TargetInterface>
         <tns:IntegrationName>
            <xsl:value-of select="dvm:lookupValue (&quot;DVM/dvmCreateReceiptEnt.dvm&quot;, &quot;Code&quot;, &quot;IntegrationName&quot;, &quot;Value&quot;, &quot;&quot; )"/>
         </tns:IntegrationName>
         <tns:ProcessName>
            <xsl:value-of select="dvm:lookupValue (&quot;DVM/dvmCreateReceiptEnt.dvm&quot;, &quot;Code&quot;, &quot;ProcessName&quot;, &quot;Value&quot;, &quot;&quot; )"/>
         </tns:ProcessName>
         <tns:ReportName>
            <xsl:value-of select="dvm:lookupValue (&quot;DVM/dvmCreateReceiptEnt.dvm&quot;, &quot;Code&quot;, &quot;ReportName&quot;, &quot;Value&quot;, &quot;&quot; )"/>
         </tns:ReportName>
         <tns:parameterNameValues>
            <tns:item>
               <tns:name>
                  <xsl:value-of select="dvm:lookupValue (&quot;DVM/dvmCreateReceiptEnt.dvm&quot;, &quot;Code&quot;, &quot;PRfc&quot;, &quot;Value&quot;, &quot;&quot; )"/>
               </tns:name>
               <tns:values>
                  <xsl:for-each select="$varInvokeWsFinancialBizGetRfcRs.GetRfcRs/ns1:GetRfcRs/ns1:Return/ns1:RfcData">
                     <tns:item>
                        <xsl:value-of select="ns1:Rfc"/>
                     </tns:item>
                  </xsl:for-each>
               </tns:values>
            </tns:item>
         </tns:parameterNameValues>
      </tns:GenerateReportRq>
   </xsl:template>
</xsl:stylesheet>