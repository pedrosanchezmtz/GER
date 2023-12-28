<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/erp/ErpIntegrationServiceTec/ERPIntegrationServiceTec/erpRefCreateOrganization/types" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:ns0="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns1="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/partySite/" xmlns:ns2="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountContact/" xmlns:ns3="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountContactRole/" xmlns:ns4="http://xmlns.oracle.com/adf/svc/errors/" xmlns:ns5="http://xmlns.oracle.com/adf/svc/types/" xmlns:ns6="commonj.sdo/xml" xmlns:ns7="commonj.sdo/java" xmlns:ns8="http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/" xmlns:ns9="http://xmlns.oracle.com/apps/cdm/foundation/parties/relationshipService/" xmlns:cus="http://soa.estrellaroja.com.mx/Customers/Types" xmlns:ns10="http://xmlns.oracle.com/apps/financials/receivables/customers/customerProfileService/" xmlns:ns11="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/orgContact/" xmlns:ns12="http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/" xmlns:ns13="http://xmlns.oracle.com/apps/cdm/foundation/parties/partyService/" xmlns:ns14="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/relationship/" xmlns:ns15="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountSiteUse/" xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:ns16="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/person/" xmlns:ns17="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountRel/" xmlns:ns18="http://xmlns.oracle.com/apps/financials/receivables/customerSetup/customerProfiles/model/flex/CustomerProfileGdf/" xmlns:ns19="http://xmlns.oracle.com/apps/financials/receivables/creditManagement/creditChecking/creditCheckingService/types/" xmlns:ns20="http://xmlns.oracle.com/apps/cdm/foundation/parties/contactPointService/" xmlns:ns21="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccount/" xmlns:ns22="http://xmlns.oracle.com/apps/cdm/foundation/parties/organizationService/" xmlns:ns23="commonj.sdo" xmlns:ns24="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/organization/" xmlns:ns25="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/sourceSystemRef/" xmlns:ns26="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountSite/" xmlns:ns27="http://xmlns.oracle.com/apps/financials/receivables/creditManagement/creditChecking/creditCheckingService/" xmlns:ns28="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/contactPoint/" xmlns:ordx="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec/Orders" xmlns:ns29="http://xmlns.oracle.com/apps/financials/receivables/customerSetup/customerProfiles/model/flex/CustomerProfileDff/" xmlns:orafault="http://xmlns.oracle.com/oracleas/schema/oracle-fault-11_0" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns31="http://xmlns.oracle.com/pcbpel/adapter/erp/ErpIntegrationServiceTec/ERPIntegrationServiceTec/erpRefCreateOrganization" xmlns:ns30="http://xmlns.oracle.com/apps/cdm/foundation/parties/organizationService/applicationModule/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:types="http://xmlns.oracle.com/apps/cdm/foundation/parties/organizationService/applicationModule/types/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../Schemas/ERPIntegrationServiceTec.xsd"/>
            <oracle-xsl-mapper:rootElement name="CreateOrganizationRq" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../../WSDL/Externals/Cloud/Customers/erpRefCreateOrganization.wsdl"/>
            <oracle-xsl-mapper:rootElement name="createOrganization" namespace="http://xmlns.oracle.com/pcbpel/adapter/erp/ErpIntegrationServiceTec/ERPIntegrationServiceTec/erpRefCreateOrganization/types"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [TUE DEC 05 16:29:00 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:createOrganization>
         <tns:organizationParty>
            <ns22:CreatedByModule>HZ_WS</ns22:CreatedByModule>
            <ns22:OrganizationProfile>
               <ns22:OrganizationName>
                  <xsl:value-of select="/ns0:CreateOrganizationRq/ns0:Organization/ns0:Name"/>
               </ns22:OrganizationName>
               <ns22:PrincipalName>
                  <xsl:value-of select="/ns0:CreateOrganizationRq/ns0:Organization/ns0:Name"/>
               </ns22:PrincipalName>
               <ns22:JgzzFiscalCode>
                  <xsl:value-of select="/ns0:CreateOrganizationRq/ns0:Organization/ns0:FiscalCode"/>
               </ns22:JgzzFiscalCode>
               <ns22:OrganizationType>ORGANIZATION</ns22:OrganizationType>
               <ns22:CreatedByModule>HZ_WS</ns22:CreatedByModule>
            </ns22:OrganizationProfile>
            <ns22:PartyUsageAssignment>
               <ns13:PartyUsageCode>PARTY_OF_INTEREST</ns13:PartyUsageCode>
               <ns13:CreatedByModule>HZ_WS</ns13:CreatedByModule>
            </ns22:PartyUsageAssignment>
         </tns:organizationParty>
      </tns:createOrganization>
   </xsl:template>
</xsl:stylesheet>