<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:tns="http://soa.estrellaroja.com.mx/StructureTrxInterface" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://soa.estrellaroja.com.mx/InvoicesBiz" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ns2="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns4="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"
                xmlns:ns3="http://soa.estrellaroja.com.mx/InvoicesEnt"
                xmlns:client="http://soa.estrellaroja.com.mx/InvoicesEnt/bpelLoadInvoices">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/SOA/InvoicesBiz/InvoicesBiz.wsdl"/>
            <oracle-xsl-mapper:rootElement name="UpdateUuidRs" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelLoadInvoices.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ResultUpdateUuId" namespace="http://soa.estrellaroja.com.mx/StructureTrxInterface"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [TUE JAN 30 01:03:15 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:ResultUpdateUuId>
         <xsl:for-each select="/ns0:UpdateUuidRs/ns0:Return">
            <tns:elements>
               <tns:TrxNumber>
                  <xsl:value-of select="ns0:TrxNumber"/>
               </tns:TrxNumber>
               <tns:UuId>
                  <xsl:value-of select="ns0:UuId"/>
               </tns:UuId>
               <tns:Status>
                  <xsl:value-of select="ns0:Status"/>
               </tns:Status>
            </tns:elements>
         </xsl:for-each>
      </tns:ResultUpdateUuId>
   </xsl:template>
</xsl:stylesheet>
