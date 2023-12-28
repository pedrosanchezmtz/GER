<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:ns0="http://soa.estrellaroja.com.mx/CustomerBiz" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:tns="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:client="http://soa.estrellaroja.com.mx/CustomerBiz/bpelCreateSite" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns3="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec/types"
                xmlns:ns4="http://soa.estrellaroja.com.mx/CoherenceTec">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelCreateSite.wsdl"/>
            <oracle-xsl-mapper:rootElement name="CreateSiteRq" namespace="http://soa.estrellaroja.com.mx/CustomerBiz"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/External/ERPIntegrationServiceTecWrapper.wsdl"/>
            <oracle-xsl-mapper:rootElement name="CreateLocationRq" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [SAT DEC 23 15:50:12 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:CreateLocationRq>
         <tns:Location>
            <tns:PostalCode>
               <xsl:value-of select="/ns0:CreateSiteRq/ns0:Site/ns0:PostalCode"/>
            </tns:PostalCode>
            <tns:StreetName>
               <xsl:value-of select="/ns0:CreateSiteRq/ns0:Site/ns0:StreetName"/>
            </tns:StreetName>
            <tns:InternalNumber>
               <xsl:value-of select="/ns0:CreateSiteRq/ns0:Site/ns0:InternalNumber"/>
            </tns:InternalNumber>
            <tns:ExternalNumber>
               <xsl:value-of select="/ns0:CreateSiteRq/ns0:Site/ns0:ExternalNumber"/>
            </tns:ExternalNumber>
            <tns:County>
               <xsl:value-of select="/ns0:CreateSiteRq/ns0:Site/ns0:County"/>
            </tns:County>
            <tns:City>
               <xsl:value-of select="/ns0:CreateSiteRq/ns0:Site/ns0:City"/>
            </tns:City>
            <tns:State>
               <xsl:value-of select="/ns0:CreateSiteRq/ns0:Site/ns0:State"/>
            </tns:State>
            <tns:Country>
               <xsl:value-of select="/ns0:CreateSiteRq/ns0:Site/ns0:Country"/>
            </tns:Country>
            <tns:Description>
               <xsl:value-of select="/ns0:CreateSiteRq/ns0:Site/ns0:SiteDescription"/>
            </tns:Description>
            <tns:Name>
               <xsl:value-of select="/ns0:CreateSiteRq/ns0:Site/ns0:SiteName"/>
            </tns:Name>
            <tns:AddressType>
               <xsl:value-of select="/ns0:CreateSiteRq/ns0:Site/ns0:SiteUseCode"/>
            </tns:AddressType>
         </tns:Location>
      </tns:CreateLocationRq>
   </xsl:template>
</xsl:stylesheet>