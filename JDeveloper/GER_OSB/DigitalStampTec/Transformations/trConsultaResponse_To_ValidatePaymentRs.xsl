<xsl:stylesheet version="1.0" exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns0 tns UUIDUserFunction IsUserInGroupFunction oraext IsUserInRoleFunction xp20 DVMFunctions oraxsl RuntimeTypeConversionFunctions XrefFunctions BasicCredentialsUserFunction" xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction" xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:ns0="http://tempuri.org/" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:RuntimeTypeConversionFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.RuntimeTypeConversionFunctions" xmlns:tns="http://soa.estrellaroja.com.mx/DigitalStampTec" xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction" xmlns:ns1="http://schemas.datacontract.org/2004/07/Sat.Cfdi.Negocio.ConsultaCfdi.Servicio" xmlns:cmn="http://soa.estrellaroja.com.mx/EstrellaRojaCommons" xmlns:ns2="http://www.sat.gob.mx/TimbreFiscalDigital" xmlns:cfdi="http://www.sat.gob.mx/cfd/3" xmlns:ns3="http://www.sat.gob.mx/sitio_internet/cfd/tipoDatos/tdCFDI" xmlns:ns4="http://soa.estrellaroja.com.mx/cfd/3" xmlns:ns5="http://soa.estrellaroja.com.mx/sitio_internet/cfd/tipoDatos/tdCFDI" xmlns:ns6="http://soa.estrellaroja.com.mx/TimbreFiscalDigital">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/Validator/XMLSchema_1044066430.xsd"/>
        <oracle-xsl-mapper:rootElement name="ConsultaResponse" namespace="http://tempuri.org/"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../Schemas/DigitalStampTec.xsd"/>
        <oracle-xsl-mapper:rootElement name="ValidatePaymentRs" namespace="http://soa.estrellaroja.com.mx/DigitalStampTec"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [MON DEC 11 23:12:17 CST 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:ValidatePaymentRs>
      <cmn:Success/>
      <tns:Return>
        <xsl:choose>
          <xsl:when test="/ns0:ConsultaResponse/ns0:ConsultaResult/ns1:Estado = &quot;Vigente&quot;">
            <tns:Valid>
              <xsl:value-of select="true ( )"/>
            </tns:Valid>
          </xsl:when>
          <xsl:otherwise>
            <tns:Valid>
              <xsl:value-of select="false ( )"/>
            </tns:Valid>
          </xsl:otherwise>
        </xsl:choose>
        <tns:StatusDesc>
          <xsl:value-of select="/ns0:ConsultaResponse/ns0:ConsultaResult/ns1:CodigoEstatus"/>
        </tns:StatusDesc>
      </tns:Return>
    </tns:ValidatePaymentRs>
  </xsl:template>
</xsl:stylesheet>