<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:ns0="http://soa.estrellaroja.com.mx/ERPIntegrationBiz" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://soa.estrellaroja.com.mx/AuditControlTec" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:client="http://soa.estrellaroja.com.mx/ERPIntegrationBiz/bpelImportToERPCloud" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:ns2="http://soa.estrellaroja.com.mx/AuditControlTec/types" xmlns:ns3="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbXXCM_Errors" xmlns:ns4="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbXXMC_Transactions" xmlns:ns5="http://soa.estrellaroja.com.mx/ERPIntegrationBiz/types"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelImportToERPCloud.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ImportToERPCloudRs" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="oramds:/apps/SOA/ERPIntegrationBiz/ERPIntegrationBiz.xsd"/>
            <oracle-xsl-mapper:rootElement name="varInstanceId" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"/>
            <oracle-xsl-mapper:param name="varInstanceId"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/OSB/AuditControlTec/AuditControlTec.wsdl"/>
            <oracle-xsl-mapper:rootElement name="CreateLogRq" namespace="http://soa.estrellaroja.com.mx/AuditControlTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [FRI JUL 21 12:31:26 CDT 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="varInstanceId"/>
   <xsl:template match="/">
      <tns:CreateLogRq>
         <tns:CompositeError>
            <xsl:if test="/ns0:ImportToERPCloudRs/ns1:Errors/ns1:Error/ns1:ErrorCode">
               <tns:codeError>
                  <xsl:value-of select="/ns0:ImportToERPCloudRs/ns1:Errors/ns1:Error/ns1:ErrorCode"/>
               </tns:codeError>
            </xsl:if>
            <xsl:if test="/ns0:ImportToERPCloudRs/ns1:Errors/ns1:Error/ns1:ShortDescription">
               <tns:error>
                  <xsl:value-of select="/ns0:ImportToERPCloudRs/ns1:Errors/ns1:Error/ns1:ShortDescription"/>
               </tns:error>
            </xsl:if>
            <tns:serviceName>
               <xsl:value-of select="/ns0:ImportToERPCloudRs/ns1:Errors/ns1:Error/ns1:FailedService"/>
            </tns:serviceName>
            <tns:operationName>
               <xsl:value-of select="/ns0:ImportToERPCloudRs/ns1:Errors/ns1:Error/ns1:BusinessProcess"/>
            </tns:operationName>
            <tns:instanceNumber>
               <xsl:value-of select="$varInstanceId/ns0:varInstanceId"/>
            </tns:instanceNumber>
         </tns:CompositeError>
      </tns:CreateLogRq>
   </xsl:template>
</xsl:stylesheet>