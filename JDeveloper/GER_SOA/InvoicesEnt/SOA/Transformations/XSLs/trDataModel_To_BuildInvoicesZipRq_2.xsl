<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:ns0="http://soa.estrellaroja.com.mx/StructureTrxInterface" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:ns1="http://soa.estrellaroja.com.mx/InvoicesEnt" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://soa.estrellaroja.com.mx/InvoicesBiz" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 ns1 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns3="http://soa.estrellaroja.com.mx/FinancialBiz"
                xmlns:ns4="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns2="http://schemas.oracle.com/bpel/extension"
                xmlns:ns5="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:client="http://soa.estrellaroja.com.mx/InvoicesEnt/bpelGetInvoices"
                xmlns:ns6="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelGetInvoices.wsdl"/>
            <oracle-xsl-mapper:rootElement name="DATA_DS_INV" namespace="http://soa.estrellaroja.com.mx/StructureTrxInterface"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelGetInvoices.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetInvoicesRq" namespace="http://soa.estrellaroja.com.mx/InvoicesEnt"/>
            <oracle-xsl-mapper:param name="inputVariable.GetInvoicesRq"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/SOA/InvoicesBiz/InvoicesBiz.wsdl"/>
            <oracle-xsl-mapper:rootElement name="BuildInvoicesZipRq" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [WED APR 11 10:09:59 CDT 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="inputVariable.GetInvoicesRq"/>
   <xsl:template match="/">
      <tns:BuildInvoicesZipRq/>
   </xsl:template>
</xsl:stylesheet>
