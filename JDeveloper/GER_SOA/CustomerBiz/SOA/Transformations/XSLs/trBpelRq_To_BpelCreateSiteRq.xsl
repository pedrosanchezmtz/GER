<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:ns0="http://soa.estrellaroja.com.mx/CustomerBiz" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns1="http://soa.estrellaroja.com.mx/FinancialsTec" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 ns1 mhdr oraext xp20 xref socket dvm oraxsl" xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns3="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:client="http://soa.estrellaroja.com.mx/CustomerBiz/bpelCreateSites" xmlns:ns4="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelCreateSites.wsdl"/>
            <oracle-xsl-mapper:rootElement name="CreateSitesRq" namespace="http://soa.estrellaroja.com.mx/CustomerBiz"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelCreateSites.wsdl"/>
            <oracle-xsl-mapper:rootElement name="GetCustomerSitesRs" namespace="http://soa.estrellaroja.com.mx/FinancialsTec"/>
            <oracle-xsl-mapper:param name="varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../WSDLs/bpelCreateSites.wsdl"/>
            <oracle-xsl-mapper:rootElement name="CreateSiteRq" namespace="http://soa.estrellaroja.com.mx/CustomerBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [FRI DEC 22 19:06:30 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs"/>
   <xsl:template match="/">
      <ns0:CreateSiteRq>
         <ns0:Site>
            <ns0:PartyId>
               <xsl:value-of select="/ns0:CreateSitesRq/ns0:PartyId"/>
            </ns0:PartyId>
            <ns0:CustomerAccountId>
               <xsl:value-of select="/ns0:CreateSitesRq/ns0:CustomerAccountId"/>
            </ns0:CustomerAccountId>
            <ns0:CustomerPartyType>
               <xsl:value-of select="/ns0:CreateSitesRq/ns0:CustomerType"/>
            </ns0:CustomerPartyType>
            <ns0:SiteName>
               <xsl:if test="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:SiteName/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                     <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:SiteName/@xsi:nil"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:SiteName"/>
            </ns0:SiteName>
            <ns0:SiteDescription>
               <xsl:if test="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:SiteDescription/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                     <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:SiteDescription/@xsi:nil"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:SiteDescription"/>
            </ns0:SiteDescription>
            <xsl:if test="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:AccountAddressSet">
               <ns0:AccountAddressSet>
                  <xsl:if test="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:AccountAddressSet/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:AccountAddressSet/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:AccountAddressSet"/>
               </ns0:AccountAddressSet>
            </xsl:if>
            <ns0:LegacyCustomerSiteId>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:CustomerSiteId"/>
            </ns0:LegacyCustomerSiteId>
            <ns0:StreetName>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:StreetName"/>
            </ns0:StreetName>
            <ns0:ExternalNumber>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:ExternalNumber"/>
            </ns0:ExternalNumber>
            <ns0:InternalNumber>
               <xsl:if test="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:InternalNumber/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                     <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:InternalNumber/@xsi:nil"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:InternalNumber"/>
            </ns0:InternalNumber>
            <ns0:PostalCode>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:PostalCode"/>
            </ns0:PostalCode>
            <ns0:Province>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:Province"/>
            </ns0:Province>
            <ns0:City>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:City"/>
            </ns0:City>
            <ns0:State>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:State"/>
            </ns0:State>
            <ns0:Country>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:Country"/>
            </ns0:Country>
            <ns0:SiteUseCode>
               <xsl:value-of select="$varInvokeWsFinancialsTecGetCustomerSitesRs.GetCustomerSitesRs/ns1:GetCustomerSitesRs/ns1:Return/ns1:CustomerSite/ns1:SiteUse"/>
            </ns0:SiteUseCode>
         </ns0:Site>
      </ns0:CreateSiteRq>
   </xsl:template>
</xsl:stylesheet>