xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace val="http://soa.estrellaroja.com.mx/ValidationPaymentsAPBiz";
(:: import schema at "oramds:/apps/SOA/ValidationPaymentsAPBiz/ValidationPaymentsAPBiz.xsd" ::)

declare namespace erp = "http://soa.estrellaroja.com.mx/erpInvoiceInstallmentsAP";

declare variable $inputVariable.payload as element() (:: schema-element(val:UpdateSupplierInvoicesInstallmentsAPRq) ::) external;
declare variable $v_exclusionTbl as element() (:: schema-element(val:ExclusionTbl) ::) external;
declare variable $v_repseTbl as element() (:: schema-element(val:RepseTbl) ::) external;

declare function local:funcXqts_listsuppliers($inputVariable.payload as element() (:: schema-element(val:UpdateSupplierInvoicesInstallmentsAPRq) ::), 
                                              $v_exclusionTbl as element() (:: schema-element(val:ExclusionTbl) ::), 
                                              $v_repseTbl as element() (:: schema-element(val:RepseTbl) ::)) 
                                              as element() (:: schema-element(val:UpdateSupplierInvoicesInstallmentsAPRq) ::) {
    <val:UpdateSupplierInvoicesInstallmentsAPRq>
        {
        if (fn:data($inputVariable.payload/val:Supplier/val:supplier_list)='EXCLUSION')
        then
            for $ROW in $v_exclusionTbl/val:ROW
            return 
           <val:Supplier>
               <erp:HoldFlag>false</erp:HoldFlag>
               <val:supplier_rfc>{fn:data($ROW/val:RFC)}</val:supplier_rfc>
               <val:validate>true</val:validate>

                </val:Supplier>
        else(     
                for $ROW1 in $v_repseTbl/val:ROW
                return 
                <val:Supplier>
                    {
                        if (number($ROW1/val:PARAMETER1)=100)
                        then <erp:HoldFlag>false</erp:HoldFlag>
                        else (<erp:HoldFlag>true</erp:HoldFlag>)
                    }
                    {
                        if (number($ROW1/val:PARAMETER1) < 100)
                        then <erp:HoldReason>Cumplimiento REPSE menor al 100%</erp:HoldReason>
                        else ()
                    }
                    
                    <val:supplier_rfc>{fn:data($ROW1/val:RFC)}</val:supplier_rfc>
                    <val:validate>true</val:validate>

                </val:Supplier>
        )
        }
    </val:UpdateSupplierInvoicesInstallmentsAPRq>
};

local:funcXqts_listsuppliers($inputVariable.payload, $v_exclusionTbl, $v_repseTbl)
