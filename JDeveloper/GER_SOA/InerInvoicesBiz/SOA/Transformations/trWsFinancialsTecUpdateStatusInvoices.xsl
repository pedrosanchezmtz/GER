<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tns="http://soa.estrellaroja.com.mx/InvoicesBiz" xmlns:ns0="http://soa.estrellaroja.com.mx/FinancialsTec" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:ns2="http://soa.estrellaroja.com.mx/FinancialsTec/types"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns3="http://schemas.oracle.com/bpel/extension"
                xmlns:ns4="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"
                xmlns:client="http://soa.estrellaroja.com.mx/InvoicesBiz/bpelUpdateStatusInvoices"
                xmlns:ns5="http://soa.estrellaroja.com.mx/InvoicesBiz/ERPIntegrationServiceTec">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/FinancialsTecWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="UpdateStatusInvoiceRs" namespace="http://soa.estrellaroja.com.mx/FinancialsTec"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelUpdateStatusInvoices.wsdl"/>
            <oracle-xsl-mapper:rootElement name="UpdateStatusInvoicesRs" namespace="http://soa.estrellaroja.com.mx/InvoicesBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU FEB 01 19:57:50 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:UpdateStatusInvoicesRs>
         <tns:Return>
            <tns:NumberError>
               <xsl:value-of select="/ns0:UpdateStatusInvoiceRs/ns0:Return/ns0:NumberError"/>
            </tns:NumberError>
            <tns:ErrorDesc>
               <xsl:value-of select="/ns0:UpdateStatusInvoiceRs/ns0:Return/ns0:ErrorDesc"/>
            </tns:ErrorDesc>
         </tns:Return>
      </tns:UpdateStatusInvoicesRs>
   </xsl:template>
</xsl:stylesheet>
