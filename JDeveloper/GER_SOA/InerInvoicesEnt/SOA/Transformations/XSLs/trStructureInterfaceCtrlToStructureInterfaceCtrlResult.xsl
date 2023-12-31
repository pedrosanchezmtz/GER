<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:ns0="http://soa.estrellaroja.com.mx/StructureTrxInterface" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" exclude-result-prefixes=" oracle-xsl-mapper xsi xsd xsl ns0 socket dvm mhdr oraxsl oraext xp20 xref"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns3="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:ns2="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns1="http://soa.estrellaroja.com.mx/InvoicesEnt"
                xmlns:client="http://soa.estrellaroja.com.mx/InvoicesEnt/bpelLoadInvoices"
                xmlns:ns4="http://soa.estrellaroja.com.mx/InvoicesBiz">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelLoadInvoices.wsdl"/>
            <oracle-xsl-mapper:rootElement name="DATA_INTER_CTRL" namespace="http://soa.estrellaroja.com.mx/StructureTrxInterface"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelLoadInvoices.wsdl"/>
            <oracle-xsl-mapper:rootElement name="DATA_INTER_CTRL" namespace="http://soa.estrellaroja.com.mx/StructureTrxInterface"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU JAN 25 10:24:59 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <ns0:DATA_INTER_CTRL>
         <ns0:P_BATCH_ID/>
         <xsl:for-each select="/ns0:DATA_INTER_CTRL/ns0:G_HEADER">
            <ns0:G_HEADER>
               <ns0:STATUS>
                  <xsl:value-of select="ns0:STATUS"/>
               </ns0:STATUS>
               <ns0:INTERFACETYPE>
                  <xsl:value-of select="ns0:INTERFACETYPE"/>
               </ns0:INTERFACETYPE>
               <ns0:BATCHID>
                  <xsl:value-of select="ns0:BATCHID"/>
               </ns0:BATCHID>
               <ns0:HEADERID>
                  <xsl:value-of select="ns0:HEADERID"/>
               </ns0:HEADERID>
               <ns0:LINEID>
                  <xsl:value-of select="ns0:LINEID"/>
               </ns0:LINEID>
               <ns0:ERRORMSG>
                  <xsl:value-of select="ns0:ERRORMSG"/>
               </ns0:ERRORMSG>
               <ns0:DATAVALUE>
                  <xsl:value-of select="oraext:left-trim (oraext:right-trim (substring-before (substring-after (ns0:DATAVALUE, &quot;ber: &quot; ), &quot;|&quot; ) ) )"/>
               </ns0:DATAVALUE>
               <ns0:LOADREQUESTID>
                  <xsl:value-of select="ns0:LOADREQUESTID"/>
               </ns0:LOADREQUESTID>
               <ns0:REQUESTID>
                  <xsl:value-of select="ns0:REQUESTID"/>
               </ns0:REQUESTID>
            </ns0:G_HEADER>
         </xsl:for-each>
      </ns0:DATA_INTER_CTRL>
   </xsl:template>
</xsl:stylesheet>
