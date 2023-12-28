<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:tns="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns0="http://xmlns.oracle.com/pcbpel/adapter/erp/ErpIntegrationServiceTec/ERPIntegrationServiceTec/erpRefUploadFileToUCM/types" xmlns:orafault="http://xmlns.oracle.com/oracleas/schema/oracle-fault-11_0" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:types="http://xmlns.oracle.com/apps/financials/commonModules/shared/model/erpIntegrationService/types/" xmlns:errors="http://xmlns.oracle.com/adf/svc/errors/" xmlns:ns1="http://xmlns.oracle.com/adf/svc/types/" xmlns:sdoXML="commonj.sdo/xml" xmlns:sdoJava="commonj.sdo/java" xmlns:ns2="http://xmlns.oracle.com/apps/financials/commonModules/shared/model/erpIntegrationService/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns3="http://xmlns.oracle.com/pcbpel/adapter/erp/ErpIntegrationServiceTec/ERPIntegrationServiceTec/erpRefUploadFileToUCM" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:sdo="commonj.sdo" xmlns:ns6="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountContactRole/" xmlns:ns7="http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/" xmlns:ns9="http://xmlns.oracle.com/apps/financials/receivables/customers/customerProfileService/" xmlns:ns10="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/orgContact/" xmlns:ns11="http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/" xmlns:ns12="http://xmlns.oracle.com/apps/cdm/foundation/parties/partyService/" xmlns:ns14="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountSiteUse/" xmlns:ns16="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountRel/" xmlns:ns23="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/sourceSystemRef/" xmlns:ns25="http://xmlns.oracle.com/apps/financials/receivables/creditManagement/creditChecking/creditCheckingService/" xmlns:ns4="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/partySite/" xmlns:ns5="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountContact/" xmlns:ns8="http://xmlns.oracle.com/apps/cdm/foundation/parties/relationshipService/" xmlns:cus="http://soa.estrellaroja.com.mx/Customers/Types" xmlns:ns13="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/relationship/" xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:ns15="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/person/" xmlns:ns17="http://xmlns.oracle.com/apps/financials/receivables/customerSetup/customerProfiles/model/flex/CustomerProfileGdf/" xmlns:ns18="http://xmlns.oracle.com/apps/financials/receivables/creditManagement/creditChecking/creditCheckingService/types/" xmlns:ns19="http://xmlns.oracle.com/apps/cdm/foundation/parties/contactPointService/" xmlns:ns20="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccount/" xmlns:ns21="http://xmlns.oracle.com/apps/cdm/foundation/parties/organizationService/" xmlns:ns22="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/organization/" xmlns:ns24="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountSite/" xmlns:ns26="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/contactPoint/" xmlns:ordx="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec/Orders" xmlns:ns27="http://xmlns.oracle.com/apps/financials/receivables/customerSetup/customerProfiles/model/flex/CustomerProfileDff/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="../../../WSDL/Externals/Cloud/ErpIntegrationService/erpRefUploadFileToUCM.wsdl"/>
            <oracle-xsl-mapper:rootElement name="uploadFileToUcmResponse" namespace="http://xmlns.oracle.com/pcbpel/adapter/erp/ErpIntegrationServiceTec/ERPIntegrationServiceTec/erpRefUploadFileToUCM/types"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="XSD">
            <oracle-xsl-mapper:schema location="../../../Schemas/ERPIntegrationServiceTec.xsd"/>
            <oracle-xsl-mapper:rootElement name="UploadFileRs" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU NOV 30 16:12:25 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:UploadFileRs>
         <tns:Return>
            
               <tns:Result>
               <xsl:for-each select="/ns0:uploadFileToUcmResponse/ns0:result">
                  <xsl:value-of select="."/>
            </xsl:for-each>   
               </tns:Result>
            
         </tns:Return>
      </tns:UploadFileRs>
   </xsl:template>
</xsl:stylesheet>