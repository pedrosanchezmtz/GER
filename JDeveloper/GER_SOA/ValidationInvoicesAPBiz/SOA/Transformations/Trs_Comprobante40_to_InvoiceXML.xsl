<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction" xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:ns1="http://www.sat.gob.mx/cfd/4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20" xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions" xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator" xmlns:ns0="http://soa.estrellaroja.com.mx/ValidationInvoicesAPBiz" xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas" xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes=" xsd oracle-xsl-mapper xsi xsl ns1 ns0 mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:consumodecombustibles11="http://www.sat.gob.mx/ConsumoDeCombustibles11"
                xmlns:ns5="http://soa.estrellaroja.com.mx/ValidationInvoicesAPEnt"
                xmlns:ns7="http://www.sat.gob.mx/sitio_internet/cfd/catalogos/Pagos"
                xmlns:ns9="http://www.sat.gob.mx/sitio_internet/cfd/catalogos/ComExt"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:catCFDI="http://www.sat.gob.mx/sitio_internet/cfd/catalogos"
                xmlns:ns2="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:tfd="http://www.sat.gob.mx/TimbreFiscalDigital"
                xmlns:ecc12="http://www.sat.gob.mx/EstadoDeCuentaCombustible12"
                xmlns:ns6="http://www.sat.gob.mx/sitio_internet/cfd/catalogos/Nomina"
                xmlns:ns4="http://soa.estrellaroja.com.mx/Reports/XXER_AP_INVOICE_VALIDATION_AUTOMATICA"
                xmlns:ns8="http://www.sat.gob.mx/sitio_internet/cfd/catalogos/CartaPorte"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:cartaporte20="http://www.sat.gob.mx/CartaPorte20"
                xmlns:nomina12="http://www.sat.gob.mx/nomina12"
                xmlns:ns10="http://www.sat.gob.mx/sitio_internet/cfd/catalogos/Combustible"
                xmlns:ns3="http://soa.estrellaroja.com.mx/ValidationInvoicesAPBiz/types"
                xmlns:tdCFDI="http://www.sat.gob.mx/sitio_internet/cfd/tipoDatos/tdCFDI"
                xmlns:pago20="http://www.sat.gob.mx/Pagos20">
   <oracle-xsl-mapper:schema>
      <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
      <oracle-xsl-mapper:mapSources>
         <oracle-xsl-mapper:source type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/SOA/ValidationInvoicesAPBiz/ValidationInvoicesAPBiz.wsdl"/>
            <oracle-xsl-mapper:rootElement name="InvoiceXML" namespace="http://soa.estrellaroja.com.mx/ValidationInvoicesAPBiz"/>
         </oracle-xsl-mapper:source>
         <oracle-xsl-mapper:source type="XSD">
            <oracle-xsl-mapper:schema location="oramds:/apps/Common/XSD/CFDI40/cfdv40.xsd"/>
            <oracle-xsl-mapper:rootElement name="Comprobante" namespace="http://www.sat.gob.mx/cfd/4"/>
            <oracle-xsl-mapper:param name="v_comprobante40"/>
         </oracle-xsl-mapper:source>
      </oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:mapTargets>
         <oracle-xsl-mapper:target type="WSDL">
            <oracle-xsl-mapper:schema location="oramds:/apps/SOA/ValidationInvoicesAPBiz/ValidationInvoicesAPBiz.wsdl"/>
            <oracle-xsl-mapper:rootElement name="InvoiceXML" namespace="http://soa.estrellaroja.com.mx/ValidationInvoicesAPBiz"/>
         </oracle-xsl-mapper:target>
      </oracle-xsl-mapper:mapTargets>
      <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.4.0(XSLT Build 190828.0353.3300) AT [FRI NOV 18 00:05:37 CST 2022].-->
   </oracle-xsl-mapper:schema>
   <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
   <xsl:param name="v_comprobante40"/>
   <xsl:template match="/">
      <ns0:InvoiceXML>
          <ns0:Version>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@Version"/>
          </ns0:Version>
          <ns0:Serie>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@Serie"/>
          </ns0:Serie>
          <ns0:Folio>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@Folio"/>
          </ns0:Folio>
          <ns0:Fecha>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@Fecha"/>
          </ns0:Fecha>
          <ns0:FormaPago>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@FormaPago"/>
          </ns0:FormaPago>
          <ns0:CondicionesDePago>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@CondicionesDePago"/>
          </ns0:CondicionesDePago>
          <ns0:SubTotal>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@SubTotal"/>
          </ns0:SubTotal>
          <xsl:if test="string-length ($v_comprobante40/ns1:Comprobante/@Descuento )>0">
            <ns0:Descuento>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@Descuento"/>
            </ns0:Descuento>
          </xsl:if>
          <ns0:Moneda>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@Moneda"/>
          </ns0:Moneda>
          <ns0:TipoCambio>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@TipoCambio"/>
          </ns0:TipoCambio>
          <ns0:Total>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@Total"/>
          </ns0:Total>
          <ns0:TipoDeComprobante>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@TipoDeComprobante"/>
          </ns0:TipoDeComprobante>
          <ns0:Exportacion>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@Exportacion"/>
          </ns0:Exportacion>
          <ns0:MetodoPago>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@MetodoPago"/>
          </ns0:MetodoPago>
          <ns0:Confirmacion>
            <xsl:value-of select="$v_comprobante40/ns1:Comprobante/@Confirmacion"/>
          </ns0:Confirmacion>
          <xsl:if test="$v_comprobante40/ns1:Comprobante/ns1:CfdiRelacionados">
            <xsl:for-each select="$v_comprobante40/ns1:Comprobante/ns1:CfdiRelacionados">
              <ns0:CfdiRelacionados>
                <ns0:TipoRelacion>
                  <xsl:value-of select="@TipoRelacion"/>
                </ns0:TipoRelacion>
                <xsl:for-each select="ns1:CfdiRelacionado">
                  <ns0:UUID>
                    <xsl:value-of select="@UUID"/>
                  </ns0:UUID>
                </xsl:for-each>
              </ns0:CfdiRelacionados>
            </xsl:for-each>
          </xsl:if>
          <ns0:Emisor>
            <ns0:Rfc>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Emisor/@Rfc"/>
            </ns0:Rfc>
            <ns0:Nombre>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Emisor/@Nombre"/>
            </ns0:Nombre>
            <ns0:RegimenFiscal>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Emisor/@RegimenFiscal"/>
            </ns0:RegimenFiscal>
            <ns0:FacAtrAdquirente>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Emisor/@FacAtrAdquirente"/>
            </ns0:FacAtrAdquirente>
          </ns0:Emisor>
          <ns0:Receptor>
            <ns0:Rfc>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Receptor/@Rfc"/>
            </ns0:Rfc>
            <ns0:Nombre>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Receptor/@Nombre"/>
            </ns0:Nombre>
            <ns0:RegimenFiscalReceptor>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Receptor/@RegimenFiscalReceptor"/>
            </ns0:RegimenFiscalReceptor>
            <ns0:DomicilioFiscalReceptor>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Receptor/@DomicilioFiscalReceptor"/>
            </ns0:DomicilioFiscalReceptor>
            <ns0:ResidenciaFiscal>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Receptor/@ResidenciaFiscal"/>
            </ns0:ResidenciaFiscal>
            <ns0:NumRegIdTrib>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Receptor/@NumRegIdTrib"/>
            </ns0:NumRegIdTrib>
            <ns0:UsoCFDI>
              <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Receptor/@UsoCFDI"/>
            </ns0:UsoCFDI>
          </ns0:Receptor>
          <xsl:if test="$v_comprobante40/ns1:Comprobante/ns1:Conceptos">
            <xsl:for-each select="$v_comprobante40/ns1:Comprobante/ns1:Conceptos/ns1:Concepto">
              <ns0:Concepto>
                <ns0:ClaveProdServ>
                  <xsl:value-of select="@ClaveProdServ"/>
                </ns0:ClaveProdServ>
                <ns0:NoIdentificacion>
                  <xsl:value-of select="@NoIdentificacion"/>
                </ns0:NoIdentificacion>
                <ns0:Cantidad>
                  <xsl:value-of select="@Cantidad"/>
                </ns0:Cantidad>
                <ns0:ClaveUnidad>
                  <xsl:value-of select="@ClaveUnidad"/>
                </ns0:ClaveUnidad>
                <ns0:Unidad>
                  <xsl:value-of select="@Unidad"/>
                </ns0:Unidad>
                <ns0:Importe>
                  <xsl:value-of select="@Importe"/>
                </ns0:Importe>
                <ns0:Descuento>
                  <xsl:value-of select="@Descuento"/>
                </ns0:Descuento>
                <ns0:ObjetoImp>
                  <xsl:value-of select="@ObjetoImp"/>
                </ns0:ObjetoImp>
                <ns0:Descripcion>
                  <xsl:value-of select="@Descripcion"/>
                </ns0:Descripcion>
                <ns0:ValorUnitario>
                  <xsl:value-of select="@ValorUnitario"/>
                </ns0:ValorUnitario>
                <ns0:Impuestos>
                  <xsl:if test="ns1:Impuestos/ns1:Traslados/ns1:Traslado">
                    <xsl:for-each select="ns1:Impuestos/ns1:Traslados/ns1:Traslado">
                      <ns0:Traslado>
                        <ns0:Base>
                          <xsl:value-of select="@Base"/>
                        </ns0:Base>
                        <ns0:Impuesto>
                          <xsl:value-of select="@Impuesto"/>
                        </ns0:Impuesto>
                        <ns0:TipoFactor>
                          <xsl:value-of select="@TipoFactor"/>
                        </ns0:TipoFactor>
                        <ns0:TasaOCuota>
                          <xsl:value-of select="@TasaOCuota"/>
                        </ns0:TasaOCuota>
                        <ns0:Importe>
                          <xsl:value-of select="@Importe"/>
                        </ns0:Importe>
                      </ns0:Traslado>
                    </xsl:for-each>
                  </xsl:if>
                  <xsl:if test="ns1:Impuestos/ns1:Retenciones/ns1:Retencion">
                    <xsl:for-each select="ns1:Impuestos/ns1:Retenciones/ns1:Retencion">
                      <ns0:Retencion>
                        <ns0:Base>
                          <xsl:value-of select="@Base"/>
                        </ns0:Base>
                        <ns0:Impuesto>
                          <xsl:value-of select="@Impuesto"/>
                        </ns0:Impuesto>
                        <ns0:TipoFactor>
                          <xsl:value-of select="@TipoFactor"/>
                        </ns0:TipoFactor>
                        <ns0:TasaOCuota>
                          <xsl:value-of select="@TasaOCuota"/>
                        </ns0:TasaOCuota>
                        <ns0:Importe>
                          <xsl:value-of select="@Importe"/>
                        </ns0:Importe>
                      </ns0:Retencion>
                    </xsl:for-each>
                  </xsl:if>
                </ns0:Impuestos>
                <ns0:ACuentaTerceros>
                  <ns0:RfcACuentaTerceros>
                    <xsl:value-of select="ns1:ACuentaTerceros/@RfcACuentaTerceros"/>
                  </ns0:RfcACuentaTerceros>
                  <ns0:NombreACuentaTerceros>
                    <xsl:value-of select="ns1:ACuentaTerceros/@NombreACuentaTerceros"/>
                  </ns0:NombreACuentaTerceros>
                  <ns0:RegimenFiscalACuentaTerceros>
                    <xsl:value-of select="ns1:ACuentaTerceros/@RegimenFiscalACuentaTerceros"/>
                  </ns0:RegimenFiscalACuentaTerceros>
                  <ns0:DomicilioFiscalACuentaTerceros>
                    <xsl:value-of select="ns1:ACuentaTerceros/@DomicilioFiscalACuentaTerceros"/>
                  </ns0:DomicilioFiscalACuentaTerceros>
                </ns0:ACuentaTerceros>
                <xsl:if test="ns1:Parte">
                  <xsl:for-each select="ns1:Parte">
                    <ns0:Parte>
                      <ns0:ClaveProdServ>
                        <xsl:value-of select="@ClaveProdServ"/>
                      </ns0:ClaveProdServ>
                      <ns0:NoIdentificacion>
                        <xsl:value-of select="@NoIdentificacion"/>
                      </ns0:NoIdentificacion>
                      <ns0:Cantidad>
                        <xsl:value-of select="@Cantidad"/>
                      </ns0:Cantidad>
                      <ns0:Unidad>
                        <xsl:value-of select="@Unidad"/>
                      </ns0:Unidad>
                      <ns0:Descripcion>
                        <xsl:value-of select="@Descripcion"/>
                      </ns0:Descripcion>
                      <ns0:ValorUnitario>
                        <xsl:value-of select="@ValorUnitario"/>
                      </ns0:ValorUnitario>
                      <ns0:Importe>
                        <xsl:value-of select="@Importe"/>
                      </ns0:Importe>
                      <xsl:if test="ns1:InformacionAduanera">
                        <xsl:for-each select="ns1:InformacionAduanera">
                          <ns0:NumeroPedimento>
                            <xsl:value-of select="@NumeroPedimento"/>
                          </ns0:NumeroPedimento>
                        </xsl:for-each>
                      </xsl:if>
                    </ns0:Parte>
                  </xsl:for-each>
                </xsl:if>
                <xsl:if test="ns1:CuentaPredial">
                  <xsl:for-each select="ns1:CuentaPredial">
                    <ns0:CuentaPredial>
                      <xsl:value-of select="."/>
                    </ns0:CuentaPredial>
                  </xsl:for-each>
                </xsl:if>
                <xsl:if test="ns1:InformacionAduanera">
                  <xsl:for-each select="ns1:InformacionAduanera">
                    <ns0:NumeroPedimento>
                      <xsl:value-of select="@NumeroPedimento"/>
                    </ns0:NumeroPedimento>
                  </xsl:for-each>
                </xsl:if>
              </ns0:Concepto>
            </xsl:for-each>
          </xsl:if>
          <ns0:Complemento>
            <ns0:TimbreFiscalDigital>
              <ns0:Version>
                <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Complemento/tfd:TimbreFiscalDigital/@Version"/>
              </ns0:Version>
              <ns0:UUID>
                <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Complemento/tfd:TimbreFiscalDigital/@UUID"/>
              </ns0:UUID>
              <ns0:FechaTimbrado>
                <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Complemento/tfd:TimbreFiscalDigital/@FechaTimbrado"/>
              </ns0:FechaTimbrado>
              <ns0:RfcProvCertif>
                <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Complemento/tfd:TimbreFiscalDigital/@RfcProvCertif"/>
              </ns0:RfcProvCertif>
              <ns0:Leyenda>
                <xsl:value-of select="$v_comprobante40/ns1:Comprobante/ns1:Complemento/tfd:TimbreFiscalDigital/@Leyenda"/>
              </ns0:Leyenda>
            </ns0:TimbreFiscalDigital>
          </ns0:Complemento>
        </ns0:InvoiceXML>
   </xsl:template>
</xsl:stylesheet>
