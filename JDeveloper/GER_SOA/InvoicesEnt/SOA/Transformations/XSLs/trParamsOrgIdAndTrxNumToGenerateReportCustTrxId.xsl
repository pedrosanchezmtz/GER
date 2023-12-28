<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:ns0="http://soa.estrellaroja.com.mx/StructureTrxInterface" xmlns:tns="http://soa.estrellaroja.com.mx/ERPIntegrationBiz" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns2="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns1="http://soa.estrellaroja.com.mx/InvoicesEnt"
                xmlns:client="http://soa.estrellaroja.com.mx/InvoicesEnt/bpelLoadInvoices"
                xmlns:ns4="http://soa.estrellaroja.com.mx/InvoicesBiz"
                xmlns:ns3="http://soa.estrellaroja.com.mx/ERPIntegrationBiz/types"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelLoadInvoices.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ParamsToGenerateReport" namespace="http://soa.estrellaroja.com.mx/StructureTrxInterface"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/SOA/ERPIntegrationBiz/ERPIntegrationBiz.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GenerateReportRq" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [FRI JAN 26 00:47:57 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:GenerateReportRq>
         <tns:TargetInterface>
            <xsl:value-of select="&quot;TrxInterface&quot;"/>
         </tns:TargetInterface>
         <tns:IntegrationName>
            <xsl:value-of select='"TEST"'/>
         </tns:IntegrationName>
         <tns:ProcessName>
            <xsl:value-of select='"TEST"'/>
         </tns:ProcessName>
         <tns:ReportName>
            <xsl:value-of select='"XXER_AR_TRX_INTRF_CUST_TRX_ID.xdm"'/>
         </tns:ReportName>
         <tns:parameterNameValues>
            <xsl:for-each select="/ns0:ParamsToGenerateReport/ns0:Params">
               <tns:item>
                  <tns:name>
                     <xsl:value-of select="ns0:Params"/>
                  </tns:name>
                  <tns:values>
                     <tns:item>
                        <xsl:value-of select="ns0:Values"/>
                     </tns:item>
                  </tns:values>
               </tns:item>
            </xsl:for-each>
         </tns:parameterNameValues>
      </tns:GenerateReportRq>
   </xsl:template>
</xsl:stylesheet>
