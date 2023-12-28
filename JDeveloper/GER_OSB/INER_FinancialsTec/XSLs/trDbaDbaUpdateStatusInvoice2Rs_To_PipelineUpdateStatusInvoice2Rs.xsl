<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/sp/dbaUpdateStatusInvoice" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:tns="http://soa.estrellaroja.com.mx/FinancialsTec" xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/External/dbaUpdateStatusInvoice_sp.xsd"/>
            <oracle-xsl-mapper:rootElement name="OutputParameters" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/sp/dbaUpdateStatusInvoice"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../Schemas/FinancialsTec.xsd"/>
            <oracle-xsl-mapper:rootElement name="UpdateStatusInvoiceRs" namespace="http://soa.estrellaroja.com.mx/FinancialsTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU FEB 01 15:14:26 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:UpdateStatusInvoiceRs>        
         <xsl:choose>
            <xsl:when test="string-length (concat (/ns0:OutputParameters/ns0:P_ERROR, /ns0:OutputParameters/ns0:P_ERROR_DESC ) ) > 0">
               <cmn:Errors>
                  <cmn:Error>
                     <cmn:ErrorCode>
                        <xsl:value-of select="/ns0:OutputParameters/ns0:P_ERROR"/>
                     </cmn:ErrorCode>
                     <cmn:ShortDescription>Error Package</cmn:ShortDescription>
                     <cmn:Description>
                        <xsl:value-of select="/ns0:OutputParameters/ns0:P_ERROR_DESC"/>
                     </cmn:Description>
                     <cmn:BusinessProcess>UpdateStatusInvoice</cmn:BusinessProcess>
                     <cmn:FailedService>FinancialsTec</cmn:FailedService>
                     <cmn:TimeStamp>
                        <xsl:value-of select="xp20:current-dateTime ( )"/>
                     </cmn:TimeStamp>
                  </cmn:Error>
               </cmn:Errors>
            </xsl:when>
            <xsl:otherwise>
         <cmn:Success/>
            </xsl:otherwise>
         </xsl:choose>
      </tns:UpdateStatusInvoiceRs>
   </xsl:template>
</xsl:stylesheet>