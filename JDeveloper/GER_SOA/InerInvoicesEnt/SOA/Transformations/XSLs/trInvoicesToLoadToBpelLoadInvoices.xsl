<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:ns1="http://soa.estrellaroja.com.mx/StructureTrxInterface" xmlns:ns0="http://soa.estrellaroja.com.mx/ERPIntegrationBiz" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:tns="http://soa.estrellaroja.com.mx/InvoicesEnt" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns2="http://soa.estrellaroja.com.mx/InvoicesBiz" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns1 ns0 ns2 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns3="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:ns6="http://soa.estrellaroja.com.mx/FinancialBiz"
                xmlns:ns4="http://soa.estrellaroja.com.mx/ERPIntegrationBiz/types"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns5="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:client="http://soa.estrellaroja.com.mx/InvoicesEnt/bpelGetInvoices"
                xmlns:ns7="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:ns8="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/ERPIntegrationBizWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ImportToERPCloudRq" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelGetInvoices.wsdl"/>
            <oracle-xsl-mapper:rootElement name="StringHelper" namespace="http://soa.estrellaroja.com.mx/StructureTrxInterface"/>
            <oracle-xsl-mapper:param name="varBatchId"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/InvoicesBizWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ListTrxNumber" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz"/>
            <oracle-xsl-mapper:param name="varCollectionTrxNumber"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelGetInvoices.wsdl"/>
            <oracle-xsl-mapper:rootElement name="LoadInvoicesRq" namespace="http://soa.estrellaroja.com.mx/InvoicesEnt"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [FRI JAN 26 15:54:19 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="varBatchId"/>
   <xsl:param name="varCollectionTrxNumber"/>
   <xsl:template match="/">
      <tns:LoadInvoicesRq>
         <tns:TargetInterface>
            <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:TargetInterface"/>
         </tns:TargetInterface>
         <tns:File>
            <tns:Content>
               <xsl:if test="/ns0:ImportToERPCloudRq/ns0:File/ns0:Content/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                     <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:Content/@xsi:nil"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:Content"/>
            </tns:Content>
            <tns:FileName>
               <xsl:if test="/ns0:ImportToERPCloudRq/ns0:File/ns0:FileName/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                     <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:FileName/@xsi:nil"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:FileName"/>
            </tns:FileName>
            <xsl:if test="/ns0:ImportToERPCloudRq/ns0:File/ns0:ContentType">
               <tns:ContentType>
                  <xsl:if test="/ns0:ImportToERPCloudRq/ns0:File/ns0:ContentType/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:ContentType/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:ContentType"/>
               </tns:ContentType>
            </xsl:if>
            <xsl:if test="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentTitle">
               <tns:DocumentTitle>
                  <xsl:if test="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentTitle/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentTitle/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentTitle"/>
               </tns:DocumentTitle>
            </xsl:if>
            <xsl:if test="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentName">
               <tns:DocumentName>
                  <xsl:if test="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentName/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentName/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentName"/>
               </tns:DocumentName>
            </xsl:if>
            <xsl:if test="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentId">
               <tns:DocumentId>
                  <xsl:if test="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentId/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentId/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:ImportToERPCloudRq/ns0:File/ns0:DocumentId"/>
               </tns:DocumentId>
            </xsl:if>
         </tns:File>
         <tns:BatchId>
            <xsl:value-of select="$varBatchId/ns1:StringHelper/ns1:ListValues/ns1:value"/>
         </tns:BatchId>
         <tns:NumLines>
            <xsl:value-of select="count ($varCollectionTrxNumber/ns2:ListTrxNumber/ns2:TrxNumberInProcess/ns2:ListTrxNumber )"/>
         </tns:NumLines>
      </tns:LoadInvoicesRq>
   </xsl:template>
</xsl:stylesheet>
