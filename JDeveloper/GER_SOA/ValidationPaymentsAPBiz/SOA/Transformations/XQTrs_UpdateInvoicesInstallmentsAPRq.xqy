xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace val="http://soa.estrellaroja.com.mx/ValidationPaymentsAPBiz";
(:: import schema at "oramds:/apps/SOA/ValidationPaymentsAPBiz/ValidationPaymentsAPBiz.xsd" ::)

declare namespace erp = "http://soa.estrellaroja.com.mx/erpInvoiceInstallmentsAP";

declare variable $inputVariable.payload as element() (:: schema-element(val:UpdateSupplierInvoicesInstallmentsAPRq) ::) external;
declare variable $v_paymentsInvoices as element() (:: schema-element(val:PaymentsInvoices) ::) external;

declare function local:funcXqtrs_updateinvoicesinstallmentsaprq($inputVariable.payload as element() (:: schema-element(val:UpdateSupplierInvoicesInstallmentsAPRq) ::), 
                                                                $v_paymentsInvoices as element() (:: schema-element(val:PaymentsInvoices) ::)) 
                                                                as element() (:: schema-element(val:UpdateInvoicesInstallmentsAPRq) ::) {
    <val:UpdateInvoicesInstallmentsAPRq>
        {
            for $INVOICE in $v_paymentsInvoices/val:DATA_DS/val:SUPPLIER/val:INVOICE
            return 
            <val:invoice>
                {
                    if ($inputVariable.payload/val:Supplier[val:supplier_rfc =$INVOICE/val:SUPPLIER_RFC]/erp:HoldFlag)
                    then <erp:HoldFlag>{fn:data($inputVariable.payload/val:Supplier[val:supplier_rfc =$INVOICE/val:SUPPLIER_RFC]/erp:HoldFlag)}</erp:HoldFlag>
                    else ()
                }
                {
                    if ($inputVariable.payload/val:Supplier[val:supplier_rfc =$INVOICE/val:SUPPLIER_RFC]/erp:HoldReason)
                    then <erp:HoldReason>{fn:data($inputVariable.payload/val:Supplier[val:supplier_rfc =$INVOICE/val:SUPPLIER_RFC]/erp:HoldReason)}</erp:HoldReason>
                    else ()
                }
                <val:invoice_id>{fn:data($INVOICE/val:INVOICE_ID)}</val:invoice_id>
                <val:rfc>{fn:data($INVOICE/val:SUPPLIER_RFC)}</val:rfc></val:invoice>
        }
    </val:UpdateInvoicesInstallmentsAPRq>
};

local:funcXqtrs_updateinvoicesinstallmentsaprq($inputVariable.payload, $v_paymentsInvoices)
