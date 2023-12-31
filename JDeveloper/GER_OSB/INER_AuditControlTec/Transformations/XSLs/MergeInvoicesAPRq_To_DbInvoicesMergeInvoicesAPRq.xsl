<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbInvoicesAPBs" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns0="http://soa.estrellaroja.com.mx/AuditControlTec" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../Schemas/AuditControlTec.xsd"/>
            <oracle-xsl-mapper:rootElement name="MergeInvoicesAPRq" namespace="http://soa.estrellaroja.com.mx/AuditControlTec"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../../Schemas/External/dbInvoicesAPBs_table.xsd"/>
            <oracle-xsl-mapper:rootElement name="XxerInvoicesApTblCollection" namespace="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbInvoicesAPBs"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [TUE DEC 19 16:55:38 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:XxerInvoicesApTblCollection>
         <xsl:for-each select="/ns0:MergeInvoicesAPRq/ns0:Invoices/ns0:Invoice">
            <tns:XxerInvoicesApTbl>
               <tns:invoiceId>
                  <xsl:value-of select="ns0:InvoiceId"/>
               </tns:invoiceId>
               <tns:emisorRfc>
                  <xsl:value-of select="ns0:EmisorRFC"/>
               </tns:emisorRfc>
               <tns:receptorRfc>
                  <xsl:value-of select="ns0:ReceptorRFC"/>
               </tns:receptorRfc>
               <tns:amount>
                  <xsl:value-of select="ns0:Amount"/>
               </tns:amount>
               <tns:uuid>
                  <xsl:value-of select="ns0:UUID"/>
               </tns:uuid>
               <xsl:if test="ns0:Status">
                  <tns:status>
                     <xsl:value-of select="ns0:Status"/>
                  </tns:status>
               </xsl:if>
               <xsl:if test="ns0:BusinessUnit">
                  <tns:businessUnit>
                     <xsl:value-of select="ns0:BusinessUnit"/>
                  </tns:businessUnit>
               </xsl:if>
               <xsl:if test="ns0:InvoiceNumber">
                  <tns:invoiceNumber>
                     <xsl:value-of select="ns0:InvoiceNumber"/>
                  </tns:invoiceNumber>
               </xsl:if>
               <xsl:if test="ns0:SuplierNumber">
                  <tns:supplierNumber>
                     <xsl:value-of select="ns0:SuplierNumber"/>
                  </tns:supplierNumber>
               </xsl:if>
               <xsl:if test="ns0:Attribute1">
                  <tns:attribute1>
                     <xsl:value-of select="ns0:Attribute1"/>
                  </tns:attribute1>
               </xsl:if>
               <xsl:if test="ns0:Attribute2">
                  <tns:attribute2>
                     <xsl:value-of select="ns0:Attribute2"/>
                  </tns:attribute2>
               </xsl:if>
               <xsl:if test="ns0:Attribute3">
                  <tns:attribute3>
                     <xsl:value-of select="ns0:Attribute3"/>
                  </tns:attribute3>
               </xsl:if>
               <xsl:if test="ns0:Attribute4">
                  <tns:attribute4>
                     <xsl:value-of select="ns0:Attribute4"/>
                  </tns:attribute4>
               </xsl:if>
               <xsl:if test="ns0:Attribute5">
                  <tns:attribute5>
                     <xsl:value-of select="ns0:Attribute5"/>
                  </tns:attribute5>
               </xsl:if>
               <xsl:choose>
                  <xsl:when test="string-length (ns0:CreatedBy ) = 0">
                     <tns:createdBy>
                        <xsl:value-of select="&quot;AuditControlTec&quot;"/>
                     </tns:createdBy>
                  </xsl:when>
                  <xsl:otherwise>
                     <tns:createdBy>
                        <xsl:value-of select="ns0:CreatedBy"/>
                     </tns:createdBy>
                  </xsl:otherwise>
               </xsl:choose>
               <xsl:if test="ns0:CreationDate">
                  <tns:creationDate>
                     <xsl:value-of select="ns0:CreationDate"/>
                  </tns:creationDate>
               </xsl:if>
               <xsl:if test="ns0:LastUpdatedBy">
                  <tns:lastUpdatedBy>
                     <xsl:value-of select="ns0:LastUpdatedBy"/>
                  </tns:lastUpdatedBy>
               </xsl:if>
               <xsl:if test="ns0:LastUpdateDate">
                  <tns:lastUpdateDate>
                     <xsl:value-of select="ns0:LastUpdateDate"/>
                  </tns:lastUpdateDate>
               </xsl:if>
               <xsl:if test="ns0:ObjectVersionNumber">
                  <tns:objectVersionNumber>
                     <xsl:value-of select="ns0:ObjectVersionNumber"/>
                  </tns:objectVersionNumber>
               </xsl:if>
            </tns:XxerInvoicesApTbl>
         </xsl:for-each>
      </tns:XxerInvoicesApTblCollection>
   </xsl:template>
</xsl:stylesheet>