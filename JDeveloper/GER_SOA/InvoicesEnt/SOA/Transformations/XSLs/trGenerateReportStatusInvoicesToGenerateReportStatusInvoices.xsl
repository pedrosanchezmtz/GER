<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://soa.estrellaroja.com.mx/ERPIntegrationBiz" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" exclude-result-prefixes=" oracle-xsl-mapper xsi xsd xsl ns0 socket dvm mhdr oraxsl oraext xp20 xref"
                xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:ns2="http://soa.estrellaroja.com.mx/ERPIntegrationBiz/types"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:str="http://www.oracle.com/XSL/Transform/java/java.lang.String"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/SOA/ERPIntegrationBiz/ERPIntegrationBiz.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GenerateReportRs" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/SOA/ERPIntegrationBiz/ERPIntegrationBiz.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GenerateReportRs" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [WED JAN 17 12:28:01 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <ns0:GenerateReportRs>
         <ns0:Return>
            <ns0:xmlOut>
               <ns0:xml>
                  <xsl:value-of select="str:replaceAll(/ns0:GenerateReportRs/ns0:Return/ns0:xmlOut/ns0:xml,'&lt;STATUS_LOAD_INVOICES>','&lt;STATUS_LOAD_INVOICES xmlns=&quot;http://soa.estrellaroja.com.mx/StructureTrxInterface&quot;>')"/>
               </ns0:xml>
            </ns0:xmlOut>
         </ns0:Return>
      </ns0:GenerateReportRs>
   </xsl:template>
</xsl:stylesheet>
