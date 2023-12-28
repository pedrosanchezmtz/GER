<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbaCustomerSiteLogBs" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns0="http://soa.estrellaroja.com.mx/AuditControlTec" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../Schemas/AuditControlTec.xsd"/>
            <oracle-xsl-mapper:rootElement name="MergeCustomerSiteLogRq" namespace="http://soa.estrellaroja.com.mx/AuditControlTec"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../../Schemas/External/dbaCustomerSiteLogBs_table.xsd"/>
            <oracle-xsl-mapper:rootElement name="XxerArCustSiteLogCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbaCustomerSiteLogBs"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [FRI DEC 15 22:12:19 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:XxerArCustSiteLogCollection>
         <tns:XxerArCustSiteLog>
            <tns:customerSiteId>
               <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:CustomerSiteId"/>
            </tns:customerSiteId>
            <tns:locationId>
               <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:LocationId"/>
            </tns:locationId>
            <tns:useCode>
               <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:UseCode"/>
            </tns:useCode>
            <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:CreatedDate">
               <tns:createdDate>
                  <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:CreatedDate"/>
               </tns:createdDate>
            </xsl:if>
            <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:UpdatedDate">
               <tns:updatedDate>
                  <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:UpdatedDate/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:UpdatedDate/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:UpdatedDate"/>
               </tns:updatedDate>
            </xsl:if>
            <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute1">
               <tns:attribute1>
                  <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute1/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute1/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute1"/>
               </tns:attribute1>
            </xsl:if>
            <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute2">
               <tns:attribute2>
                  <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute2/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute2/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute2"/>
               </tns:attribute2>
            </xsl:if>
            <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute3">
               <tns:attribute3>
                  <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute3/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute3/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute3"/>
               </tns:attribute3>
            </xsl:if>
            <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute4">
               <tns:attribute4>
                  <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute4/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute4/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute4"/>
               </tns:attribute4>
            </xsl:if>
            <xsl:if test="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute5">
               <tns:attribute5>
                  <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:Attribute5"/>
               </tns:attribute5>
            </xsl:if>
            <xsl:if test="string-length (/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:PartySiteId ) > 0">
               <tns:partySiteId>
                  <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:PartySiteId"/>
               </tns:partySiteId>
            </xsl:if>
            <xsl:if test="string-length (/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:CustAcctSiteId ) > 0">
               <tns:custAcctSiteId>
                  <xsl:value-of select="/ns0:MergeCustomerSiteLogRq/ns0:CustomerSiteLog/ns0:CustAcctSiteId"/>
               </tns:custAcctSiteId>
            </xsl:if>
         </tns:XxerArCustSiteLog>
      </tns:XxerArCustSiteLogCollection>
   </xsl:template>
</xsl:stylesheet>