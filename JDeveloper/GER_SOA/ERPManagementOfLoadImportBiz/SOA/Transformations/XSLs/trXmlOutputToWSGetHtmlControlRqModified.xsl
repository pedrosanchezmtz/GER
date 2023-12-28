<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:ns0="http://soa.estrellaroja.com.mx/ERPManagementOfLoadImportBiz" xmlns:tns="http://soa.estrellaroja.com.mx/SOAUtilitiesTec" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:ns1="http://soa.estrellaroja.com.mx/ERPManagementOfLoadImportBiz/FndInterfaceControl" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 ns1 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns4="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:client="http://soa.estrellaroja.com.mx/ERPManagementOfLoadImportBiz/bpelSendReportInterface"
                xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns3="http://soa.estrellaroja.com.mx/SOAUtilitiesTec/types">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelSendReportInterface.wsdl"/>
            <oracle-xsl-mapper:rootElement name="SendReportInterfaceRq" namespace="http://soa.estrellaroja.com.mx/ERPManagementOfLoadImportBiz"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelSendReportInterface.wsdl"/>
            <oracle-xsl-mapper:rootElement name="DATA_DS" namespace="http://soa.estrellaroja.com.mx/ERPManagementOfLoadImportBiz/FndInterfaceControl"/>
            <oracle-xsl-mapper:param name="varFndInterfaceControl"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelSendReportInterface.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ListErrorLineId" namespace="http://soa.estrellaroja.com.mx/ERPManagementOfLoadImportBiz"/>
            <oracle-xsl-mapper:param name="varUniqueErrorsByTrxNumerLineId"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/SOA/SOAUtilitiesTec/SOAUtilitiesTec.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetHtmlControlRq" namespace="http://soa.estrellaroja.com.mx/SOAUtilitiesTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [WED MAR 14 12:41:22 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="varFndInterfaceControl"/>
   <xsl:param name="varUniqueErrorsByTrxNumerLineId"/>
   <xsl:template match="/">
      <tns:GetHtmlControlRq>
         <tns:TotalSucceeded>
            <xsl:value-of select="/ns0:SendReportInterfaceRq/ns0:Files/ns0:LinesNumber - count ($varUniqueErrorsByTrxNumerLineId/ns0:ListErrorLineId/ns0:List/ns0:LINEID )"/>
         </tns:TotalSucceeded>
         <tns:TotalErrors>
            <xsl:value-of select="count ($varUniqueErrorsByTrxNumerLineId/ns0:ListErrorLineId/ns0:List/ns0:LINEID )"/>
         </tns:TotalErrors>
         <tns:TotalProcessed>
            <xsl:value-of select="/ns0:SendReportInterfaceRq/ns0:Files/ns0:LinesNumber"/>
         </tns:TotalProcessed>
         <tns:ErrorsDetails>
            <xsl:for-each select="$varFndInterfaceControl/ns1:DATA_DS/ns1:G_HEADER">
               <tns:ErrorDetail>
                  <tns:DataValue>
                     <xsl:value-of select="ns1:DATAVALUE"/>
                  </tns:DataValue>
                  <tns:ErrorMessage>
                     <xsl:value-of select="ns1:ERRORMSG"/>
                  </tns:ErrorMessage>
               </tns:ErrorDetail>
            </xsl:for-each>
         </tns:ErrorsDetails>
      </tns:GetHtmlControlRq>
   </xsl:template>
</xsl:stylesheet>
