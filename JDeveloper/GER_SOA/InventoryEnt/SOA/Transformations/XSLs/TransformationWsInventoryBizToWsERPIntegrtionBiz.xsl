<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:ns0="http://soa.estrellaroja.com.mx/InventoryBiz" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:tns="http://soa.estrellaroja.com.mx/ERPIntegrationBiz" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns4="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:ns3="http://soa.estrellaroja.com.mx/SOAUtilitiesTec" xmlns:client="http://soa.estrellaroja.com.mx/InventoryEnt/bpelImportInventoryTransactions" xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns1="http://soa.estrellaroja.com.mx/InventoryEnt" xmlns:ns5="http://soa.estrellaroja.com.mx/ERPIntegrationBiz/types" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelImportInventoryTransactions.wsdl"/>
            <oracle-xsl-mapper:rootElement name="InventoryBizRs" namespace="http://soa.estrellaroja.com.mx/InventoryBiz"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/ERPIntegrationBizWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="ImportToERPCloudRq" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [MON DEC 18 15:27:55 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:ImportToERPCloudRq>
         <tns:TargetInterface>
            <xsl:value-of select="dvm:lookupValue (&quot;DVMs/InventoryEntProperties.dvm&quot;, &quot;CODE&quot;, &quot;INV_TRA&quot;, &quot;VALUE&quot;, &quot;inventoryTransaction&quot; )"/>
         </tns:TargetInterface>
         <tns:File>
            <tns:Content>
               <xsl:value-of select="/ns0:InventoryBizRs/ns0:Return/ns0:ContentBase64"/>
            </tns:Content>
            <tns:FileName>
               <xsl:value-of select="dvm:lookupValue (&quot;DVMs/InventoryEntProperties.dvm&quot;, &quot;CODE&quot;, &quot;INV_ZIP_DIR&quot;, &quot;VALUE&quot;, &quot;inventoryTransaction.zip&quot; )"/>
            </tns:FileName>
            <tns:ContentType/>
            <tns:DocumentTitle/>
            <tns:DocumentName/>
         </tns:File>
      </tns:ImportToERPCloudRq>
   </xsl:template>
</xsl:stylesheet>