<xsl:stylesheet version="1.0" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:ns0="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:tns="http://xmlns.oracle.com/pcbpel/adapter/erp/ErpIntegrationServiceTec/ERPIntegrationServiceTec/erpRefUploadFileToUCM/types" xmlns:ns1="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/partySite/" xmlns:ns2="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountContact/" xmlns:ns3="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountContactRole/" xmlns:ns4="http://xmlns.oracle.com/adf/svc/errors/" xmlns:ns5="http://xmlns.oracle.com/adf/svc/types/" xmlns:ns6="commonj.sdo/xml" xmlns:ns7="commonj.sdo/java" xmlns:ns8="http://xmlns.oracle.com/apps/cdm/foundation/parties/customerAccountService/" xmlns:ns9="http://xmlns.oracle.com/apps/cdm/foundation/parties/relationshipService/" xmlns:cus="http://soa.estrellaroja.com.mx/Customers/Types" xmlns:ns10="http://xmlns.oracle.com/apps/financials/receivables/customers/customerProfileService/" xmlns:ns11="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/orgContact/" xmlns:ns12="http://xmlns.oracle.com/apps/cdm/foundation/parties/personService/" xmlns:ns13="http://xmlns.oracle.com/apps/cdm/foundation/parties/partyService/" xmlns:ns14="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/relationship/" xmlns:ns15="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountSiteUse/" xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:ns16="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/person/" xmlns:ns17="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountRel/" xmlns:ns18="http://xmlns.oracle.com/apps/financials/receivables/customerSetup/customerProfiles/model/flex/CustomerProfileGdf/" xmlns:ns19="http://xmlns.oracle.com/apps/financials/receivables/creditManagement/creditChecking/creditCheckingService/types/" xmlns:ns20="http://xmlns.oracle.com/apps/cdm/foundation/parties/contactPointService/" xmlns:ns21="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccount/" xmlns:ns22="http://xmlns.oracle.com/apps/cdm/foundation/parties/organizationService/" xmlns:ns23="commonj.sdo" xmlns:ns24="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/organization/" xmlns:ns25="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/sourceSystemRef/" xmlns:ns26="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/custAccountSite/" xmlns:ns27="http://xmlns.oracle.com/apps/financials/receivables/creditManagement/creditChecking/creditCheckingService/" xmlns:ns28="http://xmlns.oracle.com/apps/cdm/foundation/parties/flex/contactPoint/" xmlns:ordx="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec/Orders" xmlns:ns29="http://xmlns.oracle.com/apps/financials/receivables/customerSetup/customerProfiles/model/flex/CustomerProfileDff/" xmlns:orafault="http://xmlns.oracle.com/oracleas/schema/oracle-fault-11_0" xmlns:plnk="http://schemas.xmlsoap.org/ws/2003/05/partner-link/" xmlns:types="http://xmlns.oracle.com/apps/financials/commonModules/shared/model/erpIntegrationService/types/" xmlns:ns30="http://xmlns.oracle.com/apps/financials/commonModules/shared/model/erpIntegrationService/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:ns31="http://xmlns.oracle.com/pcbpel/adapter/erp/ErpIntegrationServiceTec/ERPIntegrationServiceTec/erpRefUploadFileToUCM" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="../../../Schemas/ERPIntegrationServiceTec.xsd"/>
            <oracle-xsl-mapper:rootElement name="UploadFileRq" namespace="http://soa.estrellaroja.com.mx/ERPIntegrationServiceTec"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="../../../WSDL/Externals/Cloud/ErpIntegrationService/erpRefUploadFileToUCM.wsdl"/>
            <oracle-xsl-mapper:rootElement name="uploadFileToUcm" namespace="http://xmlns.oracle.com/pcbpel/adapter/erp/ErpIntegrationServiceTec/ERPIntegrationServiceTec/erpRefUploadFileToUCM/types"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [THU NOV 30 16:10:13 CST 2017].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:template match="/">
      <tns:uploadFileToUcm>
         <tns:document>
            <ns30:Content>
               <xsl:if test="/ns0:UploadFileRq/ns0:Content/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                     <xsl:value-of select="/ns0:UploadFileRq/ns0:Content/@xsi:nil"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:value-of select="/ns0:UploadFileRq/ns0:Content"/>
            </ns30:Content>
            <ns30:FileName>
               <xsl:if test="/ns0:UploadFileRq/ns0:FileName/@xsi:nil">
                  <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                     <xsl:value-of select="/ns0:UploadFileRq/ns0:FileName/@xsi:nil"/>
                  </xsl:attribute>
               </xsl:if>
               <xsl:value-of select="/ns0:UploadFileRq/ns0:FileName"/>
            </ns30:FileName>
            <xsl:if test="/ns0:UploadFileRq/ns0:ContentType">
               <ns30:ContentType>
                  <xsl:if test="/ns0:UploadFileRq/ns0:ContentType/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:UploadFileRq/ns0:ContentType/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:UploadFileRq/ns0:ContentType"/>
               </ns30:ContentType>
            </xsl:if>
            <xsl:if test="/ns0:UploadFileRq/ns0:DocumentTitle">
               <ns30:DocumentTitle>
                  <xsl:if test="/ns0:UploadFileRq/ns0:DocumentTitle/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentTitle/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentTitle"/>
               </ns30:DocumentTitle>
            </xsl:if>
            <xsl:if test="/ns0:UploadFileRq/ns0:DocumentAuthor">
               <ns30:DocumentAuthor>
                  <xsl:if test="/ns0:UploadFileRq/ns0:DocumentAuthor/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentAuthor/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentAuthor"/>
               </ns30:DocumentAuthor>
            </xsl:if>
            <xsl:if test="/ns0:UploadFileRq/ns0:DocumentSecurityGroup">
               <ns30:DocumentSecurityGroup>
                  <xsl:if test="/ns0:UploadFileRq/ns0:DocumentSecurityGroup/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentSecurityGroup/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentSecurityGroup"/>
               </ns30:DocumentSecurityGroup>
            </xsl:if>
            <xsl:if test="/ns0:UploadFileRq/ns0:DocumentAccount">
               <ns30:DocumentAccount>
                  <xsl:if test="/ns0:UploadFileRq/ns0:DocumentAccount/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentAccount/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentAccount"/>
               </ns30:DocumentAccount>
            </xsl:if>
            <xsl:if test="/ns0:UploadFileRq/ns0:DocumentName">
               <ns30:DocumentName>
                  <xsl:if test="/ns0:UploadFileRq/ns0:DocumentName/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentName/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentName"/>
               </ns30:DocumentName>
            </xsl:if>
            <xsl:if test="/ns0:UploadFileRq/ns0:DocumentId">
               <ns30:DocumentId>
                  <xsl:if test="/ns0:UploadFileRq/ns0:DocumentId/@xsi:nil">
                     <xsl:attribute name="nil" namespace="http://www.w3.org/2001/XMLSchema-instance">
                        <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentId/@xsi:nil"/>
                     </xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="/ns0:UploadFileRq/ns0:DocumentId"/>
               </ns30:DocumentId>
            </xsl:if>
         </tns:document>
      </tns:uploadFileToUcm>
   </xsl:template>
</xsl:stylesheet>