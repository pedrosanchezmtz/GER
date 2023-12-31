<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://soa.estrellaroja.com.mx/AuditControlTec" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbXXER_Transactions" xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../Schemas/External/Audit/dbXXER_Transactions_table.xsd"/>
            <oracle-xsl-mapper:rootElement name="XxerIntegrationsTransactionsCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbXXER_Transactions"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../../../Schemas/AuditControlTec.xsd"/>
            <oracle-xsl-mapper:rootElement name="GetCtrlTransRs" namespace="http://soa.estrellaroja.com.mx/AuditControlTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [TUE DEC 12 18:32:56 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:GetCtrlTransRs>
         <xsl:if test="count (/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions ) > 0">
            <cmn:Success/>
         </xsl:if>
         <xsl:if test="count (/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions ) = 0">
            <cmn:Errors>
               <cmn:Error>
                  <cmn:ErrorCode>SOA-00010</cmn:ErrorCode>
                  <cmn:ShortDescription>No data found</cmn:ShortDescription>
                  <cmn:Description>Paraemters not match and no data found</cmn:Description>
                  <cmn:BusinessProcess>AuditControlTec</cmn:BusinessProcess>
                  <cmn:FailedService>GetCtrlTrans</cmn:FailedService>
                  <cmn:TimeStamp>
                     <xsl:value-of select="xp20:current-dateTime ( )"/>
                  </cmn:TimeStamp>
               </cmn:Error>
            </cmn:Errors>
         </xsl:if>
         <xsl:if test="count (/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions ) > 0">
            <tns:Return>
               <tns:transactionId>
                  <xsl:if test="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:transactionId/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:transactionId/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:transactionId"/>
               </tns:transactionId>
               <xsl:if test="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:integrationName">
                  <tns:integrationName>
                     <xsl:value-of select="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:integrationName"/>
                  </tns:integrationName>
               </xsl:if>
               <xsl:if test="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:importCreationDate">
                  <tns:importCreationDate>
                     <xsl:value-of select="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:importCreationDate"/>
                  </tns:importCreationDate>
               </xsl:if>
               <xsl:if test="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:processName">
                  <tns:processName>
                     <xsl:if test="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:processName/@xsi:nil">
                        <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                           <xsl:value-of select="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:processName/@xsi:nil"/>
                        </xsl:attribute>
                     </xsl:if>
                     <xsl:value-of select="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:processName"/>
                  </tns:processName>
               </xsl:if>
               <xsl:if test="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:creationDate">
                  <tns:creationDate>
                     <xsl:if test="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:creationDate/@xsi:nil">
                        <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                           <xsl:value-of select="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:creationDate/@xsi:nil"/>
                        </xsl:attribute>
                     </xsl:if>
                     <xsl:value-of select="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:creationDate"/>
                  </tns:creationDate>
               </xsl:if>
               <xsl:if test="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:lastUpdateDate">
                  <tns:lastUpdateDate>
                     <xsl:if test="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:lastUpdateDate/@xsi:nil">
                        <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                           <xsl:value-of select="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:lastUpdateDate/@xsi:nil"/>
                        </xsl:attribute>
                     </xsl:if>
                     <xsl:value-of select="/ns0:XxerIntegrationsTransactionsCollection/ns0:XxerIntegrationsTransactions/ns0:lastUpdateDate"/>
                  </tns:lastUpdateDate>
               </xsl:if>
            </tns:Return>
         </xsl:if>
      </tns:GetCtrlTransRs>
   </xsl:template>
</xsl:stylesheet>