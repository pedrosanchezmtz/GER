<?xml version = '1.0' encoding = 'UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:ns0="http://soa.estrellaroja.com.mx/PaymentComplementBiz"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:tns="http://soa.estrellaroja.com.mx/DigitalStampGERTec"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd oracle-xsl-mapper xsi xsl ns0 tns mhdr oraext xp20 xref socket dvm oraxsl"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:ns1="http://soa.estrellaroja.com.mx/EstrellaRojaCommons"
                xmlns:ns2="http://schemas.oracle.com/bpel/extension" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:client="http://soa.estrellaroja.com.mx/PaymentComplementBiz/bpelHandleMergedStamping"
                xmlns:ns3="http://www.sat.gob.mx/TimbreFiscalDigital"
                xmlns:ns4="http://soa.estrellaroja.com.mx/DigitalStampGERTec/types"
                xmlns:ns5="http://www.sat.gob.mx/cfd/3" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/"
                xmlns:ns6="http://www.sat.gob.mx/sitio_internet/cfd/tipoDatos/tdCFDI"
                xmlns:ns8="http://soa.estrellaroja.com.mx/sitio_internet/cfd/tipoDatos/tdCFDI"
                xmlns:ns9="http://soa.estrellaroja.com.mx/TimbreFiscalDigital"
                xmlns:ns7="http://soa.estrellaroja.com.mx/cfd/3"
                xmlns:ns10="http://soa.estrellaroja.com.mx/AuditControlTec"
                xmlns:ns11="http://soa.estrellaroja.com.mx/SOAUtilitiesTec"
                xmlns:ns12="http://soa.estrellaroja.com.mx/DigitalStampGERTec"
                xmlns:ns13="http://soa.estrellaroja.com.mx/DigitalStampTec/types"
                xmlns:ns14="http://soa.estrellaroja.com.mx/PaymentComplementBiz/bpelStampPaymentComplement"
                xmlns:ns15="http://soa.estrellaroja.com.mx/CommonPaymentsTec">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/bpelHandleMergedStamping.wsdl"/>
        <oracle-xsl-mapper:rootElement name="CurrentHeader"
                                       namespace="http://soa.estrellaroja.com.mx/PaymentComplementBiz"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="oramds:/apps/OSB/DigitalStampGERTec/DigitalStampGERTec.wsdl"/>
        <oracle-xsl-mapper:rootElement name="createTrxCFDIRq"
                                       namespace="http://soa.estrellaroja.com.mx/DigitalStampGERTec"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.2.1.2.0(XSLT Build 161003.0739.0018) AT [TUE DEC 12 12:35:25 CST 2017].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <ns12:createTrxCFDIRq>
      <ns12:invoice>
        <ns12:transactionNumber>
          <xsl:value-of select="concat (dvm:lookupValue (&quot;Dvms/Configuration.dvm&quot;, &quot;PropertyName&quot;, &quot;KEY_FROM&quot;, &quot;PropertyValue&quot;, &quot;&quot; ), dvm:lookupValue (&quot;Dvms/Configuration.dvm&quot;, &quot;PropertyName&quot;, &quot;KEY_TYPE&quot;, &quot;PropertyValue&quot;, &quot;&quot; ), /ns0:CurrentHeader/ns0:CashReceiptId )"/>
        </ns12:transactionNumber>
        <ns12:issuerRfc>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:IssuerRfc"/>
        </ns12:issuerRfc>
        <ns12:issuerName>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:IssuerName"/>
        </ns12:issuerName>
        <ns12:issuerStreet>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:IssuerStreet"/>
        </ns12:issuerStreet>
        <ns12:issuerColony>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:IssuerColony"/>
        </ns12:issuerColony>
        <ns12:issuerZipCode>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:IssuerZipCode"/>
        </ns12:issuerZipCode>
        <ns12:issuerMunicipality>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:IssuerMunicipality"/>
        </ns12:issuerMunicipality>
        <ns12:issuerState>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:IssuerState"/>
        </ns12:issuerState>
        <ns12:issuerCountry>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:IssuerCountry"/>
        </ns12:issuerCountry>
        <ns12:invoiceDate>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:InvoiceDate"/>
        </ns12:invoiceDate>
        <ns12:documentType>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:DocumentType"/>
        </ns12:documentType>
        <ns12:additionalInformation>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:AdditionalInformation"/>
        </ns12:additionalInformation>
        <ns12:totalWords>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:TotalWords"/>
        </ns12:totalWords>
        <ns12:invoiceItems>
          <ns12:description>
            <xsl:value-of select="/ns0:CurrentHeader/ns0:DescriptionItm"/>
          </ns12:description>
          <ns12:productServiceKey>
            <xsl:value-of select="/ns0:CurrentHeader/ns0:ProdservkeyItm"/>
          </ns12:productServiceKey>
          <ns12:quantity>
            <xsl:value-of select="/ns0:CurrentHeader/ns0:QuantityItm"/>
          </ns12:quantity>
          <ns12:vatPercentage>
            <xsl:value-of select="/ns0:CurrentHeader/ns0:VatPercentageItm"/>
          </ns12:vatPercentage>
          <ns12:unitKey>
            <xsl:value-of select="/ns0:CurrentHeader/ns0:UnitKeyItm"/>
          </ns12:unitKey>
          <ns12:amount>
            <xsl:value-of select="/ns0:CurrentHeader/ns0:AmountItm"/>
          </ns12:amount>
          <ns12:subtotal>
            <xsl:value-of select="/ns0:CurrentHeader/ns0:SubtotalItm"/>
          </ns12:subtotal>
          <ns12:vat>
            <xsl:value-of select="/ns0:CurrentHeader/ns0:VatItm"/>
          </ns12:vat>
          <ns12:total>
            <xsl:value-of select="/ns0:CurrentHeader/ns0:TotalItm"/>
          </ns12:total>
          <ns12:taxObject>
            <xsl:value-of select="/ns0:CurrentHeader/ns0:TaxObjectItm"/>
          </ns12:taxObject>
        </ns12:invoiceItems>
        <ns12:totalVat>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:TotalVat"/>
        </ns12:totalVat>
        <ns12:subtotal>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:Subtotal"/>
        </ns12:subtotal>
        <ns12:total>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:Total"/>
        </ns12:total>
        <ns12:serie>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:Serie"/>
        </ns12:serie>
        <ns12:branchName>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:BranchName"/>
        </ns12:branchName>
        <ns12:branchZipCode>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:BranchZipCode"/>
        </ns12:branchZipCode>
        <ns12:receiverName>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverName"/>
        </ns12:receiverName>
        <ns12:receiverTaxRegime>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverTaxRegime"/>
        </ns12:receiverTaxRegime>
        <ns12:receiverRfc>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverRfc"/>
        </ns12:receiverRfc>
        <ns12:receiverPhone>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverPhone"/>
        </ns12:receiverPhone>
        <ns12:receiverStreet>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverStreet"/>
        </ns12:receiverStreet>
        <ns12:receiverExtNumber>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverExtNumber"/>
        </ns12:receiverExtNumber>
        <ns12:receiverIntNumber>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverIntNumber"/>
        </ns12:receiverIntNumber>
        <ns12:receiverColony>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverColony"/>
        </ns12:receiverColony>
        <ns12:receiverZipCode>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverZipCode"/>
        </ns12:receiverZipCode>
        <ns12:receiverMunicipality>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverMunicipality"/>
        </ns12:receiverMunicipality>
        <ns12:receiverState>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverState"/>
        </ns12:receiverState>
        <ns12:receiverCountry>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverCountry"/>
        </ns12:receiverCountry>
        <ns12:receiverCfdiUse>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:ReceiverCfdiUse"/>
        </ns12:receiverCfdiUse>
        <ns12:currency>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:Currency"/>
        </ns12:currency>
        <ns12:issuerTaxRegime>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:IssuerTaxRegime"/>
        </ns12:issuerTaxRegime>
        <ns12:comments>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:Comments"/>
        </ns12:comments>
        <ns12:service>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:Service"/>
        </ns12:service>
        <ns12:export>
          <xsl:value-of select="/ns0:CurrentHeader/ns0:Exportacion"/>
        </ns12:export>
        <ns12:typeInvoice>
          <xsl:value-of select="dvm:lookupValue (&quot;Dvms/Configuration.dvm&quot;, &quot;PropertyName&quot;, &quot;TYPE_INVOICE&quot;, &quot;PropertyValue&quot;, &quot;&quot; )"/>
        </ns12:typeInvoice>
        <ns12:originSystem>
          <xsl:value-of select="dvm:lookupValue (&quot;Dvms/Configuration.dvm&quot;, &quot;PropertyName&quot;, &quot;ORIGIN_SYSTEM&quot;, &quot;PropertyValue&quot;, &quot;&quot; )"/>
        </ns12:originSystem>
        <ns12:documentTypeDescription>
          <xsl:value-of select="dvm:lookupValue (&quot;Dvms/Configuration.dvm&quot;, &quot;PropertyName&quot;, &quot;DOCUMENT_TYPE_DESCRIPTION&quot;, &quot;PropertyValue&quot;, &quot;&quot; )"/>
        </ns12:documentTypeDescription>
        <ns12:paymentComplement>
          <ns12:totalPaymentsAmount>
            <xsl:value-of select="/ns0:CurrentHeader/ns0:AmountPc"/>
          </ns12:totalPaymentsAmount>
          <xsl:if test="/ns0:CurrentHeader/ns0:Lines/ns0:RetainedAmount">
            <ns12:totalRetentionVat>
              <xsl:value-of select="format-number(round(sum (/ns0:CurrentHeader/ns0:Lines/ns0:RetainedAmount)* 100) div 100, '#.00')"/>
            </ns12:totalRetentionVat>
          </xsl:if>
          <xsl:if test="/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsRateFee='0.16'">
          <ns12:totalTaxBaseVat16>
            <xsl:value-of select="format-number(round(sum (/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsTaxBase )* 100) div 100, '#.00')"/>
          </ns12:totalTaxBaseVat16>  
          <ns12:totalTaxVat16>
            <xsl:value-of select="format-number(round(sum (/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsAmount )* 100) div 100, '#.00')"/>
          </ns12:totalTaxVat16>  
          </xsl:if>
            <xsl:if test="/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsRateFee='0.08'">
          <ns12:totalTaxBaseVat8>
            <xsl:value-of select="format-number(round(sum (/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsTaxBase )* 100) div 100, '#.00')"/>
          </ns12:totalTaxBaseVat8>
          <ns12:totalTaxVat8>
            <xsl:value-of select="format-number(round(sum (/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsAmount )* 100) div 100, '#.00')"/>
          </ns12:totalTaxVat8> 
          </xsl:if>       
          <ns12:payments>
            <ns12:paymentDate>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:PaymentDatePc"/>
            </ns12:paymentDate>
            <ns12:paymentWay>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:PaymentWayPc"/>
            </ns12:paymentWay>
            <ns12:currency>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:CurrencyPc"/>
            </ns12:currency>
            <ns12:currencyExchange>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:CurrencyExchangePc"/>
            </ns12:currencyExchange>
            <ns12:amount>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:AmountPc"/>
            </ns12:amount>
            <ns12:operationNumber>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:OperationNumberPc"/>
            </ns12:operationNumber>
            <ns12:bankName>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:BankNamePc"/>
            </ns12:bankName>
            <ns12:payerAccount>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:PayerAccountPc"/>
            </ns12:payerAccount>
            <ns12:benAccIssuerRfc>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:BenAccIssuerRfcPc"/>
            </ns12:benAccIssuerRfc>
            <ns12:beneficiaryAccount>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:BeneficiaryAccountPc"/>
            </ns12:beneficiaryAccount>
            <ns12:paymentStringType>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:PaymentStringTypePc"/>
            </ns12:paymentStringType>
            <ns12:paymentCert>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:PaymentCertPc"/>
            </ns12:paymentCert>
            <ns12:paymentString>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:PaymentStringPc"/>
            </ns12:paymentString>
            <ns12:paymentSeal>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:PaymentSealPc"/>
            </ns12:paymentSeal>
            <ns12:version>
              <xsl:value-of select="/ns0:CurrentHeader/ns0:VersionPc"/>
            </ns12:version>
            <xsl:for-each select="/ns0:CurrentHeader/ns0:Lines">
              <ns12:relatedDocuments>
                <ns12:documentId>
                  <xsl:value-of select="ns0:DocumentId"/>
                </ns12:documentId>
                <ns12:serie>
                  <xsl:value-of select="ns0:Serie"/>
                </ns12:serie>
                <ns12:folio>
                  <xsl:value-of select="ns0:Folio"/>
                </ns12:folio>
                <ns12:currency>
                  <xsl:value-of select="ns0:Currency"/>
                </ns12:currency>
                <ns12:currencyExchange>
                  <xsl:value-of select="ns0:CurrencyExchange"/>
                </ns12:currencyExchange>
                <ns12:paymentMethod>
                  <xsl:value-of select="ns0:PaymentMethod"/>
                </ns12:paymentMethod>
                <ns12:partialityNumber>
                  <xsl:value-of select="ns0:PartialityNumber"/>
                </ns12:partialityNumber>
                <ns12:previousBalance>
                  <xsl:value-of select="format-number(round(ns0:PreviousBalance * 100) div 100, '#.00')"/>
                </ns12:previousBalance>
                <ns12:paidAmount>
                  <xsl:value-of select="format-number(round(ns0:PaidAmount * 100) div 100, '#.00')"/>
                </ns12:paidAmount>
                <ns12:outstandingBalance>
                  <xsl:value-of select="format-number(round(ns0:OutStandingBalance * 100) div 100, '#.00')"/>
                </ns12:outstandingBalance>
                <ns12:taxObject>
                  <xsl:value-of select="ns0:TaxObject"/>
                </ns12:taxObject>
                <xsl:if test="sum(ns0:RetainedRateFee) > 0 ">
                  <ns12:retainedTaxes>
                    <ns12:amount>
                      <xsl:value-of select="format-number(round(ns0:RetainedAmount * 100) div 100, '#.00')"/>
                    </ns12:amount>
                    <ns12:factorType>
                      <xsl:value-of select="ns0:RetainedFactorType"/>
                    </ns12:factorType>
                    <ns12:rateFee>
                      <xsl:value-of select="ns0:RetainedRateFee"/>
                    </ns12:rateFee>
                    <ns12:tax>
                      <xsl:value-of select="ns0:RetainedTax"/>
                    </ns12:tax>
                    <ns12:taxBase>
                      <xsl:value-of select="format-number(round(ns0:RetainedTaxBase * 100) div 100, '#.00')"/>
                    </ns12:taxBase>
                  </ns12:retainedTaxes>
                </xsl:if>
                <xsl:if test="sum(ns0:TransferredsRateFee) > 0">
                  <ns12:transferredsTaxes>
                    <ns12:amount>
                      <xsl:value-of select="format-number(round(ns0:TransferredsAmount * 100) div 100, '#.00')"/>
                    </ns12:amount>
                    <ns12:factorType>
                      <xsl:value-of select="ns0:TransferredsFactorType"/>
                    </ns12:factorType>
                    <ns12:rateFee>
                      <xsl:value-of select="ns0:TransferredsRateFee"/>
                    </ns12:rateFee>
                    <ns12:tax>
                      <xsl:value-of select="ns0:TransferredsTax"/>
                    </ns12:tax>
                    <ns12:taxBase>
                      <xsl:value-of select="format-number(round(ns0:TransferredsTaxBase * 100) div 100, '#.00')"/>
                    </ns12:taxBase>
                  </ns12:transferredsTaxes>
                </xsl:if>
              </ns12:relatedDocuments>
            </xsl:for-each>
            <xsl:if test="sum (/ns0:CurrentHeader/ns0:Lines/ns0:RetainedAmount )>0">
              <ns12:retainedTaxes>
                <ns12:amount>
                  <xsl:value-of select="format-number(round(sum (/ns0:CurrentHeader/ns0:Lines/ns0:RetainedAmount )* 100) div 100, '#.00')"/>
                </ns12:amount>
                <ns12:factorType>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:Lines/ns0:RetainedFactorType"/>
                </ns12:factorType>
                <ns12:rateFee>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:Lines/ns0:RetainedRateFee"/>
                </ns12:rateFee>
                <ns12:tax>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:Lines/ns0:RetainedTax"/>
                </ns12:tax>
                <ns12:taxBase>
                  <xsl:value-of select="format-number(round(sum (/ns0:CurrentHeader/ns0:Lines/ns0:RetainedTaxBase )* 100) div 100, '#.00')"/>
                </ns12:taxBase>
              </ns12:retainedTaxes>
            </xsl:if>
            <xsl:if test="sum (/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsAmount )>0">
              <ns12:transferredsTaxes>
                <ns12:amount>
                  <xsl:value-of select="format-number(round(sum (/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsAmount )* 100) div 100, '#.00')"/>
                </ns12:amount>
                <ns12:factorType>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsFactorType"/>
                </ns12:factorType>
                <ns12:rateFee>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsRateFee"/>
                </ns12:rateFee>
                <ns12:tax>
                  <xsl:value-of select="/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsTax"/>
                </ns12:tax>
                <ns12:taxBase>
                  <xsl:value-of select="format-number(round(sum (/ns0:CurrentHeader/ns0:Lines/ns0:TransferredsTaxBase )* 100) div 100, '#.00')"/>
                </ns12:taxBase>
              </ns12:transferredsTaxes>
            </xsl:if>
          </ns12:payments>
        </ns12:paymentComplement>
      </ns12:invoice>
    </ns12:createTrxCFDIRq>
  </xsl:template>
</xsl:stylesheet>