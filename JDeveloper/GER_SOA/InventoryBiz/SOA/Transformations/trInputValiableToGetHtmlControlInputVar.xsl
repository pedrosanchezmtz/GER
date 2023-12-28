<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:tns="http://soa.estrellaroja.com.mx/SOAUtilitiesTec" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:ns0="http://soa.estrellaroja.com.mx/InventoryBiz" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:client="http://xmlns.oracle.com/InventoryBiz/InventoryBiz/bpelInventoryTransactionResult"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns2="http://soa.estrellaroja.com.mx/SOAUtilitiesTec/types">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/bpelInventoryTransactionResult.wsdl"/>
            <oracle-xsl-mapper:rootElement name="InventoryTransactionResultRq" namespace="http://soa.estrellaroja.com.mx/InventoryBiz"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../WSDLs/SOAUtilitiesTecWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetHtmlControlRq" namespace="http://soa.estrellaroja.com.mx/SOAUtilitiesTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [WED JAN 03 16:29:18 CST 2018].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:GetHtmlControlRq>
         <tns:TotalSucceeded>
            <xsl:value-of select="/ns0:InventoryTransactionResultRq/ns0:totalSuccess"/>
         </tns:TotalSucceeded>
         <tns:TotalErrors>
            <xsl:value-of select="/ns0:InventoryTransactionResultRq/ns0:totalError"/>
         </tns:TotalErrors>
         <tns:TotalProcessed>
            <xsl:value-of select="/ns0:InventoryTransactionResultRq/ns0:total"/>
         </tns:TotalProcessed>
         <tns:ErrorsDetails>
            <xsl:for-each select="/ns0:InventoryTransactionResultRq/ns0:Return/ns0:Processes/ns0:Process">
               <tns:ErrorDetail>
                  <tns:DataValue>
                     <xsl:value-of select="ns0:Id"/>
                  </tns:DataValue>
                  <tns:ErrorMessage>
                     <xsl:value-of select="concat (ns0:ProcessName,'-',ns0:Status )"/>
                  </tns:ErrorMessage>
               </tns:ErrorDetail>
            </xsl:for-each>
         </tns:ErrorsDetails>
      </tns:GetHtmlControlRq>
   </xsl:template>
</xsl:stylesheet>
