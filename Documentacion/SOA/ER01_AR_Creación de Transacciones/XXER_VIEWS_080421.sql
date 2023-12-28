
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PXERINTUSER"."XXER_AR_CUSTOMER_RFC_V" ("RFC_DESTINO", "TIPO_DOCUMENTO") AS 
  SELECT DISTINCT(RFC_DESTINO) AS RFC_DESTINO
        ,TIPO_DOCUMENTO
  FROM XXER_TBL_PUENTE_HEADER
 WHERE 1 = 1   
   AND UPPER(nvl(ESTATUS,'P')) NOT IN ('S','E');


  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PXERINTUSER"."XXER_AR_INVOICES_V" ("RFC", "Business_Unit_Name", "Trans_Batch_Source_Name", "Transaction_Type_Name", "Payment_Terms", "Transaction_Date", "Accounting_Date", "Transaction_Number", "Orig_Sys_Bill_to_Cst_Ref", "Orig_Sys_Bill_to_Cst_Ad_Ref", "Orig_Sys_Bill_to_Cst_Co_Ref", "Orig_Sys_Ship_to_Cst_Ref", "Orig_Sys_Ship_to_Cst_Ad_Ref", "Orig_Sys_Ship_to_Cst_Co_Ref", "Orig_Sys_Shp_to_Cst_Acc_Ref", "Ori_Sys_Shp_to_Cst_Ac_Ad_Ref", "Ori_Sys_Shp_to_Cst_Ac_Co_Rf", "Orig_Sys_Sold_to_Cst_Ref", "Orig_Sys_Sold_to_Cst_Acc_Rf", "Bill_to_Cust_Account_Nmbr", "Bill_to_Customer_Site_Nmbr", "Bill_to_Contact_Party_Nmbr", "Ship_to_Cust_Account_Nmbr", "Ship_to_Customer_Site_Nmbr", "Ship_to_Contact_Party_Nmbr", "Sold_to_Cust_Account_Nmbr", "Transaction_Line_Type", "Transaction_Line_Desc", "Currency_Code", "Currency_Conversion_Type", "Currency_Conversion_Date", "Currency_Conversion_Rate", "Transaction_Line_Amount", "Transaction_Line_Quantity", "Customer_Ordered_Quantity", "Unit_Selling_Price", "Unit_Standard_Price", "Line_Trans_Flxfld_Context", "Line_Trans_Flxfld_Sgmnt_1", "Line_Trans_Flxfld_Sgmnt_2", "Line_Trans_Flxfld_Sgmnt_3", "Line_Trans_Flxfld_Sgmnt_4", "Line_Trans_Flxfld_Sgmnt_5", "Line_Trans_Flxfld_Sgmnt_6", "Line_Trans_Flxfld_Sgmnt_7", "Line_Trans_Flxfld_Sgmnt_8", "Line_Trans_Flxfld_Sgmnt_9", "Line_Trans_Flxfld_Sgmnt_10", "Line_Trans_Flxfld_Sgmnt_11", "Line_Trans_Flxfld_Sgmnt_12", "Line_Trans_Flxfld_Sgmnt_13", "Line_Trans_Flxfld_Sgmnt_14", "Line_Trans_Flxfld_Sgmnt_15", "Primary_Salesperson_Number", "Tax_Classification_Code", "Legal_Entity_Identifier", "Accd_Amount_in_Led_Crrncy", "Sales_Order_Number", "Sales_Order_Date", "Actual_Ship_Date", "Warehouse_Code", "Unit_of_Measure_Code", "Unit_of_Measure_Name", "Invoicing_Rule_Name", "Reve_Scheduling_Rule_Name", "Number_of_Revenue_Periods", "Rev_Schdlng_Rule_Start_Date", "Rev_Schdlng_Rule_End_Date", "Reason_Code_Meaning", "Last_Period_to_Credit", "Trans_Biss_Category_Code", "Prod_Fisc_Classifictn_Code", "Product_Category_Code", "Product_Type", "Line_Intended_Use_Code", "Assessable_Value", "Document_Sub_Type", "Default_Taxation_Country", "User_Defnd_Fisc_Classifictn", "Tax_Invoice_Number", "Tax_Invoice_Date", "Tax_Regime_Code", "Tax", "Tax_Status_Code", "Tax_Rate_Code", "Tax_Jurisdiction_Code", "First_Party_Registratn_Nmbr", "Third_Party_Registratn_Nmbr", "Final_Discharge_Location", "Taxable_Amount", "Taxable_Flag", "Tax_Exemption_Flag", "Tax_Exemption_Reason_Code", "Tax_Exemptn_Rson_Code_Mng", "Tax_Exemptn_Certifict_Nmbr", "Line_Amount_Inclds_Tax_Flag", "Tax_Precedence", "Cr_Mt_2B_Us_4_Ls_Wt_Rv_Sc_Rs", "Cr_Mt_2B_Us_4_Tr_Wt_Sp_Py_Tr", "Reason_Code", "Tax_Rate", "FOB_Point", "Carrier", "Shipping_Reference", "Sales_Order_Line_Number", "Sales_Order_Source", "Sales_Order_Revision_Number", "Purchase_Order_Number", "Purchase_Order_Revsn_Nmbr", "Purchase_Order_Date", "Agreement_Name", "Memo_Line_Name", "Document_Number", "Original_System_Batch_Name", "Link_to_Trans_Flxfld_Cntxt", "Lnk_to_Trans_Flxfld_Sgmnt_1", "Lnk_to_Trans_Flxfld_Sgmnt_2", "Lnk_to_Trans_Flxfld_Sgmnt_3", "Lnk_to_Trans_Flxfld_Sgmnt_4", "Lnk_to_Trans_Flxfld_Sgmnt_5", "Lnk_to_Trans_Flxfld_Sgmnt_6", "Lnk_to_Trans_Flxfld_Sgmnt_7", "Lnk_to_Trans_Flxfld_Sgmnt_8", "Lnk_to_Trans_Flxfld_Sgmnt_9", "Lnk_to_Trans_Flxfld_Sgmnt_10", "Lnk_to_Trans_Flxfld_Sgmnt_11", "Lnk_to_Trans_Flxfld_Sgmnt_12", "Lnk_to_Trans_Flxfld_Sgmnt_13", "Lnk_to_Trans_Flxfld_Sgmnt_14", "Lnk_to_Trans_Flxfld_Sgmnt_15", "Ref_Trans_Flxfld_Cntxt", "Ref_Trans_Flxfld_Sgmnt_1", "Ref_Trans_Flxfld_Sgmnt_2", "Ref_Trans_Flxfld_Sgmnt_3", "Ref_Trans_Flxfld_Sgmnt_4", "Ref_Trans_Flxfld_Sgmnt_5", "Ref_Trans_Flxfld_Sgmnt_6", "Ref_Trans_Flxfld_Sgmnt_7", "Ref_Trans_Flxfld_Sgmnt_8", "Ref_Trans_Flxfld_Sgmnt_9", "Ref_Trans_Flxfld_Sgmnt_10", "Ref_Trans_Flxfld_Sgmnt_11", "Ref_Trans_Flxfld_Sgmnt_12", "Ref_Trans_Flxfld_Sgmnt_13", "Ref_Trans_Flxfld_Sgmnt_14", "Ref_Trans_Flxfld_Sgmnt_15", "Lnk_To_Parent_Line_Context", "Lnk_To_Parent_Line_Sgmnt_1", "Lnk_To_Parent_Line_Sgmnt_2", "Lnk_To_Parent_Line_Sgmnt_3", "Lnk_To_Parent_Line_Sgmnt_4", "Lnk_To_Parent_Line_Sgmnt_5", "Lnk_To_Parent_Line_Sgmnt_6", "Lnk_To_Parent_Line_Sgmnt_7", "Lnk_To_Parent_Line_Sgmnt_8", "Lnk_To_Parent_Line_Sgmnt_9", "Lnk_To_Parent_Line_Sgmnt_10", "Lnk_To_Parent_Line_Sgmnt_11", "Lnk_To_Parent_Line_Sgmnt_12", "Lnk_To_Parent_Line_Sgmnt_13", "Lnk_To_Parent_Line_Sgmnt_14", "Lnk_To_Parent_Line_Sgmnt_15", "Receipt_Method_Name", "Printing_Option", "Related_Batch_Source_Name", "Related_Transaction_Number", "Inventory_Item_Number", "Inventory_Item_Segment_2", "Inventory_Item_Segment_3", "Inventory_Item_Segment_4", "Inventory_Item_Segment_5", "Inventory_Item_Segment_6", "Inventory_Item_Segment_7", "Inventory_Item_Segment_8", "Inventory_Item_Segment_9", "Inventory_Item_Segment_10", "Inventory_Item_Segment_11", "Inventory_Item_Segment_12", "Inventory_Item_Segment_13", "Inventory_Item_Segment_14", "Inventory_Item_Segment_15", "Inventory_Item_Segment_16", "Inventory_Item_Segment_17", "Inventory_Item_Segment_18", "Inventory_Item_Segment_19", "Inventory_Item_Segment_20", "Bill_To_Cust_Bank_Acc_Name", "Reset_Transaction_Date_Flag", "Payment_Server_Order_Number", "Last_Trans_on_Debit_Autztn", "Approval_Code", "Address_Verification_Code", "Trans_Line_Translated_Desc", "Consolidated_Billing_Number", "Promised_Commitment_Amount", "Payment_Set_Identifier", "Original_Accounting_Date", "Invoiced_Line_Acc_Level", "Override_AutoAccounting_Flag", "Historical_Flag", "Deferral_Exclusion_Flag", "Payment_Attributes", "Invoice_Billing_Date", "Invoice_Lines_Flxfld_Cntxt", "Invoice_Lns_Flxfld_Sgmnt_1", "Invoice_Lns_Flxfld_Sgmnt_2", "Invoice_Lns_Flxfld_Sgmnt_3", "Invoice_Lns_Flxfld_Sgmnt_4", "Invoice_Lns_Flxfld_Sgmnt_5", "Invoice_Lns_Flxfld_Sgmnt_6", "Invoice_Lns_Flxfld_Sgmnt_7", "Invoice_Lns_Flxfld_Sgmnt_8", "Invoice_Lns_Flxfld_Sgmnt_9", "Invoice_Lns_Flxfld_Sgmnt_10", "Invoice_Lns_Flxfld_Sgmnt_11", "Invoice_Lns_Flxfld_Sgmnt_12", "Invoice_Lns_Flxfld_Sgmnt_13", "Invoice_Lns_Flxfld_Sgmnt_14", "Invoice_Lns_Flxfld_Sgmnt_15", "Invoice_Trans_Flxfld_Cntxt", "Inv_Trans_Flxfld_Sgmnt_1", "Inv_Trans_Flxfld_Sgmnt_2", "Inv_Trans_Flxfld_Sgmnt_3", "Inv_Trans_Flxfld_Sgmnt_4", "Inv_Trans_Flxfld_Sgmnt_5", "Inv_Trans_Flxfld_Sgmnt_6", "Inv_Trans_Flxfld_Sgmnt_7", "Inv_Trans_Flxfld_Sgmnt_8", "Inv_Trans_Flxfld_Sgmnt_9", "Inv_Trans_Flxfld_Sgmnt_10", "Inv_Trans_Flxfld_Sgmnt_11", "Inv_Trans_Flxfld_Sgmnt_12", "Inv_Trans_Flxfld_Sgmnt_13", "Inv_Trans_Flxfld_Sgmnt_14", "Inv_Trans_Flxfld_Sgmnt_15", "Rcvb_Trn_Rgn_Inf_Flxf_Cntxt", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_1", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_2", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_3", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_4", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_5", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_6", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_7", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_8", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_9", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_10", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_11", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_12", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_13", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_14", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_15", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_16", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_17", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_18", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_19", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_20", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_21", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_22", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_23", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_24", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_25", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_26", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_27", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_28", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_29", "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_30", "Ln_Glb_Dsc_Flxfld_Attr_Cat", "Ln_Glb_Dsc_Flxfld_Sgmnt_1", "Ln_Glb_Dsc_Flxfld_Sgmnt_2", "Ln_Glb_Dsc_Flxfld_Sgmnt_3", "Ln_Glb_Dsc_Flxfld_Sgmnt_4", "Ln_Glb_Dsc_Flxfld_Sgmnt_5", "Ln_Glb_Dsc_Flxfld_Sgmnt_6", "Ln_Glb_Dsc_Flxfld_Sgmnt_7", "Ln_Glb_Dsc_Flxfld_Sgmnt_8", "Ln_Glb_Dsc_Flxfld_Sgmnt_9", "Ln_Glb_Dsc_Flxfld_Sgmnt_1_10", "Ln_Glb_Dsc_Flxfld_Sgmnt_1_11", "Ln_Glb_Dsc_Flxfld_Sgmnt_1_12", "Ln_Glb_Dsc_Flxfld_Sgmnt_1_13", "Ln_Glb_Dsc_Flxfld_Sgmnt_1_14", "Ln_Glb_Dsc_Flxfld_Sgmnt_1_15", "Ln_Glb_Dsc_Flxfld_Sgmnt_1_16", "Ln_Glb_Dsc_Flxfld_Sgmnt_1_17", "Ln_Glb_Dsc_Flxfld_Sgmnt_1_18", "Ln_Glb_Dsc_Flxfld_Sgmnt_1_19", "Ln_Glb_Dsc_Flxfld_Sgmnt_1_20", "Comments", "Notes_from_Source", "Enforce_Chronlgcl_Doc_Seqng", "ORGANIZATION_ID", "UUID") AS 
  SELECT DISTINCT
        headers.rfc_destino AS "RFC",
        config.unidad_operativa AS "Business_Unit_Name",
        'VENDIDO' AS "Trans_Batch_Source_Name",
        config.tipo_transaccion_ar AS "Transaction_Type_Name",
        '30 Net' AS "Payment_Terms",
        ( headers.fecha_movimiento ) AS "Transaction_Date",
        ( headers.fecha_movimiento ) AS "Accounting_Date",
        headers.numero_documento AS "Transaction_Number",
        NULL AS "Orig_Sys_Bill_to_Cst_Ref",
        NULL AS "Orig_Sys_Bill_to_Cst_Ad_Ref",
        NULL AS "Orig_Sys_Bill_to_Cst_Co_Ref",
        NULL AS "Orig_Sys_Ship_to_Cst_Ref",
        NULL AS "Orig_Sys_Ship_to_Cst_Ad_Ref",
        NULL AS "Orig_Sys_Ship_to_Cst_Co_Ref",
        NULL AS "Orig_Sys_Shp_to_Cst_Acc_Ref",
        NULL AS "Ori_Sys_Shp_to_Cst_Ac_Ad_Ref",
        NULL AS "Ori_Sys_Shp_to_Cst_Ac_Co_Rf",
        NULL AS "Orig_Sys_Sold_to_Cst_Ref",
        NULL AS "Orig_Sys_Sold_to_Cst_Acc_Rf",
        to_number('17405') AS "Bill_to_Cust_Account_Nmbr",
        to_number('16009') AS "Bill_to_Customer_Site_Nmbr",
        NULL AS "Bill_to_Contact_Party_Nmbr",
        NULL AS "Ship_to_Cust_Account_Nmbr",
        NULL AS "Ship_to_Customer_Site_Nmbr",
        NULL AS "Ship_to_Contact_Party_Nmbr",
        NULL AS "Sold_to_Cust_Account_Nmbr",
        'LINE' AS "Transaction_Line_Type",
        lines.linea_articulo AS "Transaction_Line_Desc",
        'MXN' AS "Currency_Code",
        'User' AS "Currency_Conversion_Type",
        ( SYSDATE ) - 10 AS "Currency_Conversion_Date",
        to_number('1') AS "Currency_Conversion_Rate",
        DECODE(
            headers.tipo_documento,
            'NOTA DE CREDITO',
            (lines.subtotal *-1),
            lines.subtotal
        ) AS "Transaction_Line_Amount",
        to_number('1') AS "Transaction_Line_Quantity",
        NULL AS "Customer_Ordered_Quantity",
        DECODE(
            headers.tipo_documento,
            'NOTA DE CREDITO',
            (lines.subtotal *-1),
            lines.subtotal
        ) AS "Unit_Selling_Price",
        NULL AS "Unit_Standard_Price",
        'INTEGRACION_TRX' AS "Line_Trans_Flxfld_Context",
        headers.adicional2 AS "Line_Trans_Flxfld_Sgmnt_1",
        headers.tabla_puente_id AS "Line_Trans_Flxfld_Sgmnt_2",
        lines.tabla_puente_linea_id AS "Line_Trans_Flxfld_Sgmnt_3",
        NULL AS "Line_Trans_Flxfld_Sgmnt_4",
        NULL AS "Line_Trans_Flxfld_Sgmnt_5",
        NULL AS "Line_Trans_Flxfld_Sgmnt_6",
        NULL AS "Line_Trans_Flxfld_Sgmnt_7",
        NULL AS "Line_Trans_Flxfld_Sgmnt_8",
        NULL AS "Line_Trans_Flxfld_Sgmnt_9",
        NULL AS "Line_Trans_Flxfld_Sgmnt_10",
        NULL AS "Line_Trans_Flxfld_Sgmnt_11",
        NULL AS "Line_Trans_Flxfld_Sgmnt_12",
        NULL AS "Line_Trans_Flxfld_Sgmnt_13",
        NULL AS "Line_Trans_Flxfld_Sgmnt_14",
        NULL AS "Line_Trans_Flxfld_Sgmnt_15",
        NULL AS "Primary_Salesperson_Number",
		DECODE(lines.codigo_iva,'AR_IVA_EXENTO','TAS-IVAEXE','AR_IVA00','TAS-IVACERO','AR_IVA16','TAS-IVAAR16%',lines.codigo_iva) AS "Tax_Classification_Code",
        --config.impuesto AS "Tax_Classification_Code",
        NULL AS "Legal_Entity_Identifier",
        NULL AS "Accd_Amount_in_Led_Crrncy",
        NULL AS "Sales_Order_Number",
        NULL AS "Sales_Order_Date",
        NULL AS "Actual_Ship_Date",
        NULL AS "Warehouse_Code",
        NULL AS "Unit_of_Measure_Code",
        NULL AS "Unit_of_Measure_Name",
        NULL AS "Invoicing_Rule_Name",
        NULL AS "Reve_Scheduling_Rule_Name",
        NULL AS "Number_of_Revenue_Periods",
        NULL AS "Rev_Schdlng_Rule_Start_Date",
        NULL AS "Rev_Schdlng_Rule_End_Date",
        NULL AS "Reason_Code_Meaning",
        NULL AS "Last_Period_to_Credit",
        NULL AS "Trans_Biss_Category_Code",
        NULL AS "Prod_Fisc_Classifictn_Code",
        NULL AS "Product_Category_Code",
        NULL AS "Product_Type",
        NULL AS "Line_Intended_Use_Code",
        NULL AS "Assessable_Value",
        NULL AS "Document_Sub_Type",
        NULL AS "Default_Taxation_Country",
        NULL AS "User_Defnd_Fisc_Classifictn",
        NULL AS "Tax_Invoice_Number",
        NULL AS "Tax_Invoice_Date",
        NULL AS "Tax_Regime_Code",
        NULL AS "Tax",
        NULL AS "Tax_Status_Code",
        NULL AS "Tax_Rate_Code",
        NULL AS "Tax_Jurisdiction_Code",
        NULL AS "First_Party_Registratn_Nmbr",
        NULL AS "Third_Party_Registratn_Nmbr",
        NULL AS "Final_Discharge_Location",
        NULL AS "Taxable_Amount",
        'Y' AS "Taxable_Flag",
        NULL AS "Tax_Exemption_Flag",
        NULL AS "Tax_Exemption_Reason_Code",
        NULL AS "Tax_Exemptn_Rson_Code_Mng",
        NULL AS "Tax_Exemptn_Certifict_Nmbr",
        NULL AS "Line_Amount_Inclds_Tax_Flag",
        NULL AS "Tax_Precedence",
        NULL AS "Cr_Mt_2B_Us_4_Ls_Wt_Rv_Sc_Rs",
        NULL AS "Cr_Mt_2B_Us_4_Tr_Wt_Sp_Py_Tr",
        NULL AS "Reason_Code",
        NULL AS "Tax_Rate",
        NULL AS "FOB_Point",
        NULL AS "Carrier",
        NULL AS "Shipping_Reference",
        NULL AS "Sales_Order_Line_Number",
        NULL AS "Sales_Order_Source",
        NULL AS "Sales_Order_Revision_Number",
        NULL AS "Purchase_Order_Number",
        NULL AS "Purchase_Order_Revsn_Nmbr",
        NULL AS "Purchase_Order_Date",
        NULL AS "Agreement_Name",
        config.memo_line "Memo_Line_Name",
        NULL AS "Document_Number",
        NULL AS "Original_System_Batch_Name",
        NULL AS "Link_to_Trans_Flxfld_Cntxt",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_1",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_2",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_3",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_4",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_5",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_6",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_7",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_8",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_9",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_10",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_11",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_12",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_13",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_14",
        NULL AS "Lnk_to_Trans_Flxfld_Sgmnt_15",
        NULL AS "Ref_Trans_Flxfld_Cntxt",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_1",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_2",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_3",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_4",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_5",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_6",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_7",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_8",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_9",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_10",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_11",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_12",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_13",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_14",
        NULL AS "Ref_Trans_Flxfld_Sgmnt_15",
        NULL AS "Lnk_To_Parent_Line_Context",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_1",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_2",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_3",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_4",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_5",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_6",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_7",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_8",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_9",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_10",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_11",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_12",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_13",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_14",
        NULL AS "Lnk_To_Parent_Line_Sgmnt_15",
        NULL AS "Receipt_Method_Name",
        NULL AS "Printing_Option",
        NULL AS "Related_Batch_Source_Name",
        NULL AS "Related_Transaction_Number",
        NULL AS "Inventory_Item_Number",
        NULL AS "Inventory_Item_Segment_2",
        NULL AS "Inventory_Item_Segment_3",
        NULL AS "Inventory_Item_Segment_4",
        NULL AS "Inventory_Item_Segment_5",
        NULL AS "Inventory_Item_Segment_6",
        NULL AS "Inventory_Item_Segment_7",
        NULL AS "Inventory_Item_Segment_8",
        NULL AS "Inventory_Item_Segment_9",
        NULL AS "Inventory_Item_Segment_10",
        NULL AS "Inventory_Item_Segment_11",
        NULL AS "Inventory_Item_Segment_12",
        NULL AS "Inventory_Item_Segment_13",
        NULL AS "Inventory_Item_Segment_14",
        NULL AS "Inventory_Item_Segment_15",
        NULL AS "Inventory_Item_Segment_16",
        NULL AS "Inventory_Item_Segment_17",
        NULL AS "Inventory_Item_Segment_18",
        NULL AS "Inventory_Item_Segment_19",
        NULL AS "Inventory_Item_Segment_20",
        NULL AS "Bill_To_Cust_Bank_Acc_Name",
        NULL AS "Reset_Transaction_Date_Flag",
        NULL AS "Payment_Server_Order_Number",
        NULL AS "Last_Trans_on_Debit_Autztn",
        NULL AS "Approval_Code",
        NULL AS "Address_Verification_Code",
        NULL AS "Trans_Line_Translated_Desc",
        NULL AS "Consolidated_Billing_Number",
        NULL AS "Promised_Commitment_Amount",
        NULL AS "Payment_Set_Identifier",
        NULL AS "Original_Accounting_Date",
        NULL AS "Invoiced_Line_Acc_Level",
        NULL AS "Override_AutoAccounting_Flag",
        NULL AS "Historical_Flag",
        NULL AS "Deferral_Exclusion_Flag",
        NULL AS "Payment_Attributes",
        NULL AS "Invoice_Billing_Date",
        NULL AS "Invoice_Lines_Flxfld_Cntxt",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_1",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_2",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_3",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_4",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_5",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_6",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_7",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_8",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_9",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_10",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_11",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_12",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_13",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_14",
        NULL AS "Invoice_Lns_Flxfld_Sgmnt_15",
        NULL AS "Invoice_Trans_Flxfld_Cntxt",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_1",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_2",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_3",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_4",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_5",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_6",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_7",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_8",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_9",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_10",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_11",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_12",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_13",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_14",
        NULL AS "Inv_Trans_Flxfld_Sgmnt_15",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Cntxt",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_1",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_2",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_3",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_4",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_5",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_6",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_7",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_8",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_9",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_10",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_11",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_12",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_13",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_14",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_15",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_16",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_17",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_18",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_19",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_20",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_21",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_22",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_23",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_24",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_25",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_26",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_27",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_28",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_29",
        NULL AS "Rcvb_Trn_Rgn_Inf_Flxf_Sgm_30",
        NULL AS "Ln_Glb_Dsc_Flxfld_Attr_Cat",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_2",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_3",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_4",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_5",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_6",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_7",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_8",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_9",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1_10",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1_11",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1_12",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1_13",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1_14",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1_15",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1_16",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1_17",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1_18",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1_19",
        NULL AS "Ln_Glb_Dsc_Flxfld_Sgmnt_1_20",
        NULL AS "Comments",
        NULL AS "Notes_from_Source",
        NULL AS "Enforce_Chronlgcl_Doc_Seqng",
        config.organization_id,
        aux.uuid
    FROM
        xxer_tbl_puente_header headers,
        xxer_tbl_puente_lines lines,
        xxer_tbl_puente_aux aux,
        xxer_cnf_interfase_ingresos_ar config
    WHERE
            1 = 1
        AND
            headers.tabla_puente_id = lines.tabla_puente_id
        AND
            headers.tabla_puente_id = aux.tabla_puente_header_id (+)
        AND
            nvl(config.sistema_origen,1) = nvl(headers.sistema_origen,1)
        AND
            nvl(config.tipo_documento,1) = nvl(headers.tipo_documento,1)
        AND
            nvl(config.tipo_movimiento,1) = nvl(headers.tipo_movimiento,1)
        AND
            DECODE(
                nvl(config.sistema_origen,1),
                'NOMINA',
                nvl(headers.rfc_origen,1),
                nvl(config.rfc_origen,1)
            ) = nvl(headers.rfc_origen,1)
        AND
            DECODE(
                nvl(config.sucursal_venta,1),
                'TODOS',
                nvl(headers.sucursal_venta,1),
                nvl(config.sucursal_venta,1)
            ) = nvl(headers.sucursal_venta,1)
        AND
            DECODE(
                nvl(config.origen_servicio,1),
                'TODOS',
                nvl(lines.origen_servicio,1),
                nvl(config.origen_servicio,1)
            ) = nvl(lines.origen_servicio,1)
        AND
            DECODE(
                nvl(config.destino_servicio,1),
                'TODOS',
                nvl(lines.destino_servicio,1),
                nvl(config.destino_servicio,1)
            ) = nvl(lines.destino_servicio,1)
        AND
            DECODE(
                nvl(config.servicio,1),
                'TODOS',
                nvl(lines.servicio,1),
                nvl(config.servicio,1)
            ) = nvl(lines.servicio,1)
        AND
            nvl(config.concepto_modalidad,1) = nvl(lines.concepto_modalidad,1)
        AND
            DECODE(
                nvl(config.forma_pago,1),
                'TODOS',
                nvl(lines.forma_pago,1),
                nvl(config.forma_pago,1)
            ) = nvl(lines.forma_pago,1)
        AND
            nvl(config.adicional1,1) = nvl(headers.adicional1,1)
        AND
            nvl(config.adicional3,1) = nvl(headers.adicional3,1)
        AND
            nvl(config.adicional4,1) = nvl(headers.adicional4,1)
        AND
            nvl(config.adicional5,1) = nvl(headers.adicional5,1)
        AND
            nvl(config.adicional6,1) = nvl(headers.adicional6,1)
        AND
            nvl(config.adicional7,1) = nvl(headers.adicional7,1)
        AND
            nvl(config.adicional8,1) = nvl(headers.adicional8,1)
        AND
            nvl(config.adicional9,1) = nvl(headers.adicional9,1)
        AND
            nvl(config.adicional10,1) = nvl(headers.adicional10,1)
        AND
            headers.sistema_origen NOT IN (
                'EAM','INV','PORTAL'
            )
        AND
            headers.tipo_documento NOT IN (
                'RECIBO','REVERSO RECIBO'
            )
        AND (
            nvl(headers.estatus,'P') = 'P'
        ) AND
            1 = 1
    GROUP BY
        headers.rfc_destino,
        headers.fecha_movimiento,
        headers.tabla_puente_id,
        headers.numero_documento,
        headers.tipo_documento,
        config.tipo_transaccion_ar,
        config.memo_line,
        lines.linea_articulo,
        lines.subtotal,
        lines.tabla_puente_linea_id,
        lines.unidad_medida,
        config.organization_id,
        config.unidad_operativa,
        config.unidad_negocio_origen,
        headers.adicional2,
        aux.uuid,
		lines.codigo_iva  
        --config.impuesto
    ORDER BY headers.numero_documento;

