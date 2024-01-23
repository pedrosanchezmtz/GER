create or replace PACKAGE XXER_UTILITIES_PKG AS 

  V_ERROR_LOCATION VARCHAR2(500)  := NULL;
  V_ERROR_MSG      VARCHAR2(3200) := NULL;

 /**
 * Procedimiento utilizado para el procesamiento de Receipt y de Invoice
 *
 * @param P_INFORMATION Información requerida para el procesamiento
 * @param P_MODULE R para Receipt e I para Invoice
 * @param P_RECEIPT regresa un tipo de Receipt
 * @param P_INVOICE regresa un tipo de Invoice
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */
 PROCEDURE GET_INFORMATION_RECEIPT_INVOICE(P_INFORMATION IN XXER_AR_RECEIPT_INVOICE_TTYPE,
                                           P_MODULE      IN VARCHAR2,
                                           /*P_ORG         IN XXER_AR_RECEIPT_INVOICE_ORG_TTYPE DEFAULT NULL,*/
                                           P_RECEIPT     OUT XXER_AR_RECEIPT_TTYPE,
                                           P_INVOICE     OUT XXER_AR_GET_INV_TB_TYP,
                                           P_ERROR       OUT NUMBER,
                                           P_ERROR_DESC  OUT VARCHAR2);

 /**
 * Procedimiento utilizado para obtener facturas
 *
 * @param P_INFORMATION Información de data model requerida para el procesamiento
 * @param P_INVOICES regresa objeto TYPE de facturas
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */
 PROCEDURE GET_INVOICES(P_INFORMATION IN XXER_AR_RECEIPT_INVOICE_TTYPE,
                       P_DOC_TYPE IN VARCHAR2,
                       P_INVOICES     OUT XXER_AR_GET_INV_TB_TYP,
                       P_ERROR       OUT NUMBER,
                       P_ERROR_DESC  OUT VARCHAR2);

 /**
 * Procedimiento utilizado para cambiar el estado de las facturas a "P" para
 * indicar que serán los datos que estan en proceso
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error 
 */
 PROCEDURE PREPARE_PROCESS_LOAD_INVOICES(
                                       P_DOC_TYPE IN VARCHAR2,
                                       P_ERROR       OUT NUMBER,
                                       P_ERROR_DESC  OUT VARCHAR2);

  /**
 * Procedimiento usado para procesar los resultados de carga de facturas
 * y devolver el detalle numero de facturas cargadas, el número de fallos y el total de 
 * registros procesados, tambien traera los mensages de error que se hayan tenido
 */
 PROCEDURE GET_RESULT_OF_LOAD_INVOICES(P_INVOICE_LOAD_STATUS  XXER_INVOICE_LOAD_STATUS_TTYPE,
                                       P_TOTAL_SUCCESSFUL OUT NUMBER,
                                       P_TOTAL_ERRORS     OUT NUMBER,
                                       P_TOTAL_PROCESSED  OUT NUMBER,
                                       P_ERROR_MESSAGES_INV OUT XXER_ERROR_MESSAGES_INV_TTYPE,
                                       P_ERROR      OUT NUMBER,
                                       P_ERROR_DESC OUT VARCHAR2);  

 /*
 * Procedimiento usado para actualizar el status de las facturas
 * en las tablas custom, tomando como base el parametro de tipo XXER_INVOICE_LOAD_STATUS_TTYPE
 * que contiene el transaction_number y el batch_id.
 */                                       
PROCEDURE UPDATE_STATUS_INVOICES(P_LOAD_RESULTS IN XXER_AR_PARAMS_UPD_INV_TTYPE,
                                 P_ERROR       OUT NUMBER,
                                 P_ERROR_DESC  OUT VARCHAR2); 

  /*Procedimiento usado para recuperar el organization_id tomando como base base al TRX_NUMBER
    se traera el organization_id solo de aquellos registros de entrada que esten con estado LOADED
    se omitiran los que esten en error.*/                               
 PROCEDURE GET_COMPLEMENT_TO_UPD_UUID(P_INVOICES_TO_UPDATE IN XXER_INVOICES_TO_UPDATE_TTYPE,
                                   P_COMPLEMENT_UPD_UUID_ID OUT XXER_COMPLEMENT_UPD_UUID_TTYPE,
                                   P_ERROR       OUT NUMBER,
                                   P_ERROR_DESC  OUT VARCHAR2);


END XXER_UTILITIES_PKG;

create or replace PACKAGE BODY            xxer_utilities_pkg AS

 /**
 * Procedimiento utilizado para el procesamiento de Receipt y de Invoice
 *
 * @param P_INFORMATION Información requerida para el procesamiento
 * @param P_MODULE R para Receipt e I para Invoice
 * @param P_RECEIPT regresa un tipo de Receipt
 * @param P_INVOICE regresa un tipo de Invoice
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

    PROCEDURE get_information_receipt_invoice (
        p_information   IN xxer_ar_receipt_invoice_ttype,
        p_module        IN VARCHAR2,
                                            /*P_ORG         IN XXER_AR_RECEIPT_INVOICE_ORG_TTYPE DEFAULT NULL,*/
        p_receipt       OUT xxer_ar_receipt_ttype,
        p_invoice       OUT xxer_ar_get_inv_tb_typ,
        p_error         OUT NUMBER,
        p_error_desc    OUT VARCHAR2
    ) AS
        p_prepare_load_invoices_error        NUMBER;
        p_prepare_load_invoices_error_desc   VARCHAR2(3000);
    BEGIN
        IF
            p_module IS NOT NULL
        THEN
            IF
                p_module = 'R'
            THEN
                v_error_location := 'Llama al PROCEDIMIENTO GET_RECEIPT';
                xxer_utilities_pkg.get_receipt(p_information,
                                                /*P_ORG,*/p_receipt,p_error,p_error_desc);
            ELSE--- NOTAS DE CREDITO O FACTURAS
                 /*Se manda a actualizar las facturas candidatas  a cargar,se actualizaran con el estatus en 'P' y batch_id correspondiente*/
                xxer_utilities_pkg.prepare_process_load_invoices(p_module,p_prepare_load_invoices_error,p_prepare_load_invoices_error_desc);
              /*Se evalua que no haya errores en la preparación de las facturas para poder continuar con el flujo*/
             -- IF (P_PREPARE_LOAD_INVOICES_ERROR IS NULL AND P_PREPARE_LOAD_INVOICES_ERROR_DESC IS NULL) THEN
                v_error_location := 'Llama al PROCEDIMIENTO GET_INVOICE';
                xxer_utilities_pkg.get_invoices(p_information,p_module,p_invoice,p_error,p_error_desc);
              -- END IF;
            END IF;
        ELSE
            v_error_location := 'Se necesita el valor de P_MODULE';
        END IF;

        NULL;
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.GET_INFORMATION_RECEIPT_INVOICE'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END get_information_receipt_invoice;

   /**
 * Procedimiento utilizado para obtener facturas
 *
 * @param P_INFORMATION Información de data model requerida para el procesamiento
 * @param P_INVOICES regresa objeto TYPE de facturas
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

    PROCEDURE get_invoices (
        p_information   IN xxer_ar_receipt_invoice_ttype,
        p_doc_type      IN VARCHAR2,
        p_invoices      OUT xxer_ar_get_inv_tb_typ,
        p_error         OUT NUMBER,
        p_error_desc    OUT VARCHAR2
    ) AS

        collection_invoices      xxer_ar_get_inv_tb_typ := xxer_ar_get_inv_tb_typ ();
        v_rfc_previous           xxer_ar_invoices_v.rfc%TYPE;
        v_acc_num_previous       VARCHAR2(50);
        v_par_sit_num_previous   VARCHAR2(50);
        v_bu_previous            VARCHAR2(150);
        v_payment_terms          VARCHAR2(500);
        v_flag_equal_rfc         BOOLEAN := false;
        v_invoices_not_derived   VARCHAR2(4000) := '';
        v_error_msg              VARCHAR2(255);
        v_error_location         VARCHAR2(255);
        CURSOR cur_get_client_bu (
            p_tab_puent_id NUMBER
        ) IS SELECT
            headers.rfc_destino,
            headers.tipo_documento,
            config.unidad_operativa
             FROM
            xxer_tbl_puente_header headers,
            xxer_cnf_interfase_ingresos_ar config
             WHERE
            1 = 1
            AND nvl(config.sistema_origen,1) = nvl(headers.sistema_origen,1)
            AND nvl(config.tipo_documento,1) = nvl(headers.tipo_documento,1)
            AND nvl(config.tipo_movimiento,1) = nvl(headers.tipo_movimiento,1)
            AND DECODE(nvl(config.sistema_origen,1),'NOMINA',nvl(headers.rfc_origen,1),nvl(config.rfc_origen,1) ) = nvl(headers.rfc_origen,1)
            AND DECODE(nvl(config.sucursal_venta,1),'TODOS',nvl(headers.sucursal_venta,1),nvl(config.sucursal_venta,1) ) = nvl(headers.sucursal_venta
,1)
            AND nvl(config.adicional1,1) = nvl(headers.adicional1,1)
            AND nvl(config.adicional3,1) = nvl(headers.adicional3,1)
            AND nvl(config.adicional4,1) = nvl(headers.adicional4,1)
            AND nvl(config.adicional5,1) = nvl(headers.adicional5,1)
            AND nvl(config.adicional6,1) = nvl(headers.adicional6,1)
            AND nvl(config.adicional7,1) = nvl(headers.adicional7,1)
            AND nvl(config.adicional8,1) = nvl(headers.adicional8,1)
            AND nvl(config.adicional9,1) = nvl(headers.adicional9,1)
            AND nvl(config.adicional10,1) = nvl(headers.adicional10,1)
            AND headers.sistema_origen NOT IN (
                'EAM',
                'INV',
                'PORTAL'
            )
   -- AND
     --   HEADERS.tipo_documento NOT IN (
     --       'RECIBO','REVERSO RECIBO'
            AND headers.tipo_documento = p_doc_type
     --   )
            AND nvl(upper(headers.estatus),'P') NOT IN (
                'S',
                'E'
            )
            AND headers.tabla_puente_id = p_tab_puent_id
             GROUP BY
            headers.rfc_destino,
            headers.tipo_documento,
            config.unidad_operativa;

    BEGIN
        v_error_location := 'Error to set value to COLLECTION_INVOICES variable.';
        SELECT
            xxer_ar_get_inv_typ(invoices."RFC",invoices."Business_Unit_Name",invoices."Trans_Batch_Source_Name",invoices."Transaction_Type_Name"
,invoices."Payment_Terms",invoices."Transaction_Date",invoices."Accounting_Date",invoices."Transaction_Number",invoices."Orig_Sys_Bill_to_Cst_Ref"
,invoices."Orig_Sys_Bill_to_Cst_Ad_Ref",invoices."Orig_Sys_Bill_to_Cst_Co_Ref",invoices."Orig_Sys_Ship_to_Cst_Ref",invoices."Orig_Sys_Ship_to_Cst_Ad_Ref"
,invoices."Orig_Sys_Ship_to_Cst_Co_Ref",invoices."Orig_Sys_Shp_to_Cst_Acc_Ref",invoices."Ori_Sys_Shp_to_Cst_Ac_Ad_Ref",invoices."Ori_Sys_Shp_to_Cst_Ac_Co_Rf"
,invoices."Orig_Sys_Sold_to_Cst_Ref",invoices."Orig_Sys_Sold_to_Cst_Acc_Rf",invoices."Bill_to_Cust_Account_Nmbr",invoices."Bill_to_Customer_Site_Nmbr"
,invoices."Bill_to_Contact_Party_Nmbr",invoices."Ship_to_Cust_Account_Nmbr",invoices."Ship_to_Customer_Site_Nmbr",invoices."Ship_to_Contact_Party_Nmbr"
,invoices."Sold_to_Cust_Account_Nmbr",invoices."Transaction_Line_Type",invoices."Transaction_Line_Desc",invoices."Currency_Code",
invoices."Currency_Conversion_Type",invoices."Currency_Conversion_Date",invoices."Currency_Conversion_Rate",invoices."Transaction_Line_Amount"
,invoices."Transaction_Line_Quantity",invoices."Customer_Ordered_Quantity",invoices."Unit_Selling_Price",invoices."Unit_Standard_Price"
,invoices."Line_Trans_Flxfld_Context",invoices."Line_Trans_Flxfld_Sgmnt_1",invoices."Line_Trans_Flxfld_Sgmnt_2",invoices."Line_Trans_Flxfld_Sgmnt_3"
,invoices."Line_Trans_Flxfld_Sgmnt_4",invoices."Line_Trans_Flxfld_Sgmnt_5",invoices."Line_Trans_Flxfld_Sgmnt_6",invoices."Line_Trans_Flxfld_Sgmnt_7"
,invoices."Line_Trans_Flxfld_Sgmnt_8",invoices."Line_Trans_Flxfld_Sgmnt_9",invoices."Line_Trans_Flxfld_Sgmnt_10",invoices."Line_Trans_Flxfld_Sgmnt_11"
,invoices."Line_Trans_Flxfld_Sgmnt_12",invoices."Line_Trans_Flxfld_Sgmnt_13",invoices."Line_Trans_Flxfld_Sgmnt_14",invoices."Line_Trans_Flxfld_Sgmnt_15"
,invoices."Primary_Salesperson_Number",invoices."Tax_Classification_Code",invoices."Legal_Entity_Identifier",invoices."Accd_Amount_in_Led_Crrncy"
,invoices."Sales_Order_Number",invoices."Sales_Order_Date",invoices."Actual_Ship_Date",invoices."Warehouse_Code",invoices."Unit_of_Measure_Code"
,invoices."Unit_of_Measure_Name",invoices."Invoicing_Rule_Name",invoices."Reve_Scheduling_Rule_Name",invoices."Number_of_Revenue_Periods"
,invoices."Rev_Schdlng_Rule_Start_Date",invoices."Rev_Schdlng_Rule_End_Date",invoices."Reason_Code_Meaning",invoices."Last_Period_to_Credit"
,invoices."Trans_Biss_Category_Code",invoices."Prod_Fisc_Classifictn_Code",invoices."Product_Category_Code",invoices."Product_Type"
,invoices."Line_Intended_Use_Code",invoices."Assessable_Value",invoices."Document_Sub_Type",invoices."Default_Taxation_Country",invoices
."User_Defnd_Fisc_Classifictn",invoices."Tax_Invoice_Number",invoices."Tax_Invoice_Date",invoices."Tax_Regime_Code",invoices."Tax"
,invoices."Tax_Status_Code",invoices."Tax_Rate_Code",invoices."Tax_Jurisdiction_Code",invoices."First_Party_Registratn_Nmbr",invoices
."Third_Party_Registratn_Nmbr",invoices."Final_Discharge_Location",invoices."Taxable_Amount",invoices."Taxable_Flag",invoices."Tax_Exemption_Flag"
,invoices."Tax_Exemption_Reason_Code",invoices."Tax_Exemptn_Rson_Code_Mng",invoices."Tax_Exemptn_Certifict_Nmbr",invoices."Line_Amount_Inclds_Tax_Flag"
,invoices."Tax_Precedence",invoices."Cr_Mt_2B_Us_4_Ls_Wt_Rv_Sc_Rs",invoices."Cr_Mt_2B_Us_4_Tr_Wt_Sp_Py_Tr",invoices."Reason_Code"
,invoices."Tax_Rate",invoices."FOB_Point",invoices."Carrier",invoices."Shipping_Reference",invoices."Sales_Order_Line_Number",invoices
."Sales_Order_Source",invoices."Sales_Order_Revision_Number",invoices."Purchase_Order_Number",invoices."Purchase_Order_Revsn_Nmbr"
,invoices."Purchase_Order_Date",invoices."Agreement_Name",invoices."Memo_Line_Name",invoices."Document_Number",invoices."Original_System_Batch_Name"
,invoices."Link_to_Trans_Flxfld_Cntxt",invoices."Lnk_to_Trans_Flxfld_Sgmnt_1",invoices."Lnk_to_Trans_Flxfld_Sgmnt_2",invoices."Lnk_to_Trans_Flxfld_Sgmnt_3"
,invoices."Lnk_to_Trans_Flxfld_Sgmnt_4",invoices."Lnk_to_Trans_Flxfld_Sgmnt_5",invoices."Lnk_to_Trans_Flxfld_Sgmnt_6",invoices."Lnk_to_Trans_Flxfld_Sgmnt_7"
,invoices."Lnk_to_Trans_Flxfld_Sgmnt_8",invoices."Lnk_to_Trans_Flxfld_Sgmnt_9",invoices."Lnk_to_Trans_Flxfld_Sgmnt_10",invoices."Lnk_to_Trans_Flxfld_Sgmnt_11"
,invoices."Lnk_to_Trans_Flxfld_Sgmnt_12",invoices."Lnk_to_Trans_Flxfld_Sgmnt_13",invoices."Lnk_to_Trans_Flxfld_Sgmnt_14",invoices
."Lnk_to_Trans_Flxfld_Sgmnt_15",invoices."Ref_Trans_Flxfld_Cntxt",invoices."Ref_Trans_Flxfld_Sgmnt_1",invoices."Ref_Trans_Flxfld_Sgmnt_2"
,invoices."Ref_Trans_Flxfld_Sgmnt_3",invoices."Ref_Trans_Flxfld_Sgmnt_4",invoices."Ref_Trans_Flxfld_Sgmnt_5",invoices."Ref_Trans_Flxfld_Sgmnt_6"
,invoices."Ref_Trans_Flxfld_Sgmnt_7",invoices."Ref_Trans_Flxfld_Sgmnt_8",invoices."Ref_Trans_Flxfld_Sgmnt_9",invoices."Ref_Trans_Flxfld_Sgmnt_10"
,invoices."Ref_Trans_Flxfld_Sgmnt_11",invoices."Ref_Trans_Flxfld_Sgmnt_12",invoices."Ref_Trans_Flxfld_Sgmnt_13",invoices."Ref_Trans_Flxfld_Sgmnt_14"
,invoices."Ref_Trans_Flxfld_Sgmnt_15",invoices."Lnk_To_Parent_Line_Context",invoices."Lnk_To_Parent_Line_Sgmnt_1",invoices."Lnk_To_Parent_Line_Sgmnt_2"
,invoices."Lnk_To_Parent_Line_Sgmnt_3",invoices."Lnk_To_Parent_Line_Sgmnt_4",invoices."Lnk_To_Parent_Line_Sgmnt_5",invoices."Lnk_To_Parent_Line_Sgmnt_6"
,invoices."Lnk_To_Parent_Line_Sgmnt_7",invoices."Lnk_To_Parent_Line_Sgmnt_8",invoices."Lnk_To_Parent_Line_Sgmnt_9",invoices."Lnk_To_Parent_Line_Sgmnt_10"
,invoices."Lnk_To_Parent_Line_Sgmnt_11",invoices."Lnk_To_Parent_Line_Sgmnt_12",invoices."Lnk_To_Parent_Line_Sgmnt_13",invoices."Lnk_To_Parent_Line_Sgmnt_14"
,invoices."Lnk_To_Parent_Line_Sgmnt_15",invoices."Receipt_Method_Name",invoices."Printing_Option",invoices."Related_Batch_Source_Name"
,invoices."Related_Transaction_Number",invoices."Inventory_Item_Number",invoices."Inventory_Item_Segment_2",invoices."Inventory_Item_Segment_3"
,invoices."Inventory_Item_Segment_4",invoices."Inventory_Item_Segment_5",invoices."Inventory_Item_Segment_6",invoices."Inventory_Item_Segment_7"
,invoices."Inventory_Item_Segment_8",invoices."Inventory_Item_Segment_9",invoices."Inventory_Item_Segment_10",invoices."Inventory_Item_Segment_11"
,invoices."Inventory_Item_Segment_12",invoices."Inventory_Item_Segment_13",invoices."Inventory_Item_Segment_14",invoices."Inventory_Item_Segment_15"
,invoices."Inventory_Item_Segment_16",invoices."Inventory_Item_Segment_17",invoices."Inventory_Item_Segment_18",invoices."Inventory_Item_Segment_19"
,invoices."Inventory_Item_Segment_20",invoices."Bill_To_Cust_Bank_Acc_Name",invoices."Reset_Transaction_Date_Flag",invoices."Payment_Server_Order_Number"
,invoices."Last_Trans_on_Debit_Autztn",invoices."Approval_Code",invoices."Address_Verification_Code",invoices."Trans_Line_Translated_Desc"
,invoices."Consolidated_Billing_Number",invoices."Promised_Commitment_Amount",invoices."Payment_Set_Identifier",invoices."Original_Accounting_Date"
,invoices."Invoiced_Line_Acc_Level",invoices."Override_AutoAccounting_Flag",invoices."Historical_Flag",invoices."Deferral_Exclusion_Flag"
,invoices."Payment_Attributes",invoices."Invoice_Billing_Date",invoices."Invoice_Lines_Flxfld_Cntxt",invoices."Invoice_Lns_Flxfld_Sgmnt_1"
,invoices."Invoice_Lns_Flxfld_Sgmnt_2",invoices."Invoice_Lns_Flxfld_Sgmnt_3",invoices."Invoice_Lns_Flxfld_Sgmnt_4",invoices."Invoice_Lns_Flxfld_Sgmnt_5"
,invoices."Invoice_Lns_Flxfld_Sgmnt_6",invoices."Invoice_Lns_Flxfld_Sgmnt_7",invoices."Invoice_Lns_Flxfld_Sgmnt_8",invoices."Invoice_Lns_Flxfld_Sgmnt_9"
,invoices."Invoice_Lns_Flxfld_Sgmnt_10",invoices."Invoice_Lns_Flxfld_Sgmnt_11",invoices."Invoice_Lns_Flxfld_Sgmnt_12",invoices."Invoice_Lns_Flxfld_Sgmnt_13"
,invoices."Invoice_Lns_Flxfld_Sgmnt_14",invoices."Invoice_Lns_Flxfld_Sgmnt_15",invoices."Invoice_Trans_Flxfld_Cntxt",invoices."Inv_Trans_Flxfld_Sgmnt_1"
,invoices."Inv_Trans_Flxfld_Sgmnt_2",invoices."Inv_Trans_Flxfld_Sgmnt_3",invoices."Inv_Trans_Flxfld_Sgmnt_4",invoices."Inv_Trans_Flxfld_Sgmnt_5"
,invoices."Inv_Trans_Flxfld_Sgmnt_6",invoices."Inv_Trans_Flxfld_Sgmnt_7",invoices."Inv_Trans_Flxfld_Sgmnt_8",invoices."Inv_Trans_Flxfld_Sgmnt_9"
,invoices."Inv_Trans_Flxfld_Sgmnt_10",invoices."Inv_Trans_Flxfld_Sgmnt_11",invoices."Inv_Trans_Flxfld_Sgmnt_12",invoices."Inv_Trans_Flxfld_Sgmnt_13"
,invoices."Inv_Trans_Flxfld_Sgmnt_14",invoices."Inv_Trans_Flxfld_Sgmnt_15",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Cntxt",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_1"
,invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_2",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_3",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_4",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_5"
,invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_6",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_7",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_8",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_9"
,invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_10",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_11",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_12",invoices
."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_13",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_14",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_15",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_16"
,invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_17",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_18",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_19",invoices
."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_20",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_21",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_22",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_23"
,invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_24",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_25",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_26",invoices
."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_27",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_28",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_29",invoices."Rcvb_Trn_Rgn_Inf_Flxf_Sgm_30"
,invoices."Ln_Glb_Dsc_Flxfld_Attr_Cat",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_2",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_3"
,invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_4",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_5",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_6",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_7"
,invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_8",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_9",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_10",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_11"
,invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_12",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_13",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_14",invoices
."Ln_Glb_Dsc_Flxfld_Sgmnt_1_15",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_16",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_17",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_18"
,invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_19",invoices."Ln_Glb_Dsc_Flxfld_Sgmnt_1_20",invoices."Comments",invoices."Notes_from_Source"
,invoices."Enforce_Chronlgcl_Doc_Seqng",invoices.organization_id)
        BULK COLLECT
        INTO collection_invoices
        FROM
            xxer_ar_invoices_v invoices;

        dbms_output.put_line('Tamaño de la variable COLLECTION_INVOICES: ' || collection_invoices.count);

  /*Se evalua nularidad de tipo Data Model*/
        IF
            ( p_information.count > 0 )
        THEN
            dbms_output.put_line('Tamaño del parametro P_INFORMATION: ' || p_information.count);
            FOR h IN 1..p_information.count LOOP
                dbms_output.put_line('RFCs de DM: ' || p_information(h).rfc);
            END LOOP;



  /*Se evalua nularidad de tipo On premise*/

            IF
                ( collection_invoices.count > 0 )
            THEN
                FOR i IN 1..collection_invoices.count LOOP
                    FOR j IN 1..p_information.count LOOP


              --DBMS_OUTPUT.PUT_LINE('Se comienza a evaluar si estan llenas las variables provisionales');
            /*If para evaluar que no esten vacías las variables de RFC_prvious,acc_num_previous,par_sit_num_prvious y V_BU_PREVIOUS*/
                        IF
                            ( ( v_acc_num_previous <> NULL ) AND ( v_par_sit_num_previous <> NULL ) AND ( v_rfc_previous <> NULL ) )
                        THEN              


              /*Se reinicia bandera para salir de loop interno*/
                            v_flag_equal_rfc := false;

              /*IF para evaluar si el RFC actual del On Premise y el Business_Unit_Name son igual a la variable V_RFC_PREVIOUS
              y a V_BU_PREVIOUS respectivamente
                si es así entonces se asignan los datos derivados,y si no se continua con la iteracion de 
                los datos del data model para que se compare con otro rfc de otro registro*/
                            IF
                                ( ( collection_invoices(i).rfc = v_rfc_previous ) AND ( collection_invoices(i).business_unit_name = v_bu_previous ) )
                            THEN
                                v_error_location := 'Error to set derived values from (previuous variables)';

                   /*Se establecen los datos de las variables al los registros de On premise */
                                collection_invoices(i).bill_to_cust_account_nmbr := v_acc_num_previous;
                                collection_invoices(i).bill_to_customer_site_nmbr := v_par_sit_num_previous; 

                  -- si es nota de credito no lleva terminos de pago
                                IF
                                    collection_invoices(i).transaction_type_name NOT LIKE 'NOTA%'
                                THEN
                                    collection_invoices(i).payment_terms := v_payment_terms;
                                ELSE
                                    collection_invoices(i).payment_terms := NULL;
                                END IF;

                   -->
                   --COLLECTION_INVOICES(i).TRANSACTION_NUMBER := CONCAT(COLLECTION_INVOICES(i).TRANSACTION_NUMBER,'Z');  

                   /*Se remplazan los valores derivados del RFC ya que se hacen pruebas,terminando pruebas dejar 
                     los del RFC*/
                   --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_ACCOUNT_NUMBER := '17405';             
                   --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_SITE_NUMBER := '16009';   

                                v_flag_equal_rfc := true;
                            ELSE

                        /*IF para comparar los RFCs  y Bu de datamodel y de On Premise*/
                       -- DBMS_OUTPUT.PUT_LINE('Datos en comparación en primer else: RFC: ' || P_INFORMATION(j).RFC || ',BU: ' || P_INFORMATION(j).BU_NAME);
                                IF
                                    ( ( collection_invoices(i).rfc = p_information(j).rfc ) AND ( collection_invoices(i).business_unit_name = p_information(j).bu_name ) )
                                THEN
                                    v_error_location := 'Error to set derived values from (Parameter)';

                            /*Se establecen los datos del Data Model al los registros de On premise */
                                    collection_invoices(i).bill_to_cust_account_nmbr := p_information(j).account_number;
                                    collection_invoices(i).bill_to_customer_site_nmbr := p_information(j).party_site_number;

                           --  COLLECTION_INVOICES(i).PAYMENT_TERMS := P_INFORMATION(j).PAYMENT_TERMS;

                                 -- si es nota de credito no lleva terminos de pago
                                    IF
                                        collection_invoices(i).transaction_type_name NOT LIKE 'NOTA%'
                                    THEN
                                        collection_invoices(i).payment_terms := p_information(j).payment_terms;
                                    ELSE
                                        collection_invoices(i).payment_terms := NULL;
                                    END IF;

                             -->
                             --COLLECTION_INVOICES(i).TRANSACTION_NUMBER := CONCAT(COLLECTION_INVOICES(i).TRANSACTION_NUMBER,'Z');                             

                            /*Se remplazan los valores derivados del RFC ya que se hacen pruebas,terminando pruebas dejar 
                              los del RFC*/
                             --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_ACCOUNT_NUMBER := '17405';             
                             --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_SITE_NUMBER := '16009';  

                                    v_rfc_previous := p_information(j).rfc;
                                    v_acc_num_previous := p_information(j).account_number;
                                    v_par_sit_num_previous := p_information(j).party_site_number;
                                    v_payment_terms := p_information(j).payment_terms;
                                    v_bu_previous := p_information(j).bu_name;

                             --V_ACC_NUM_PREVIOUS     := '17405';
                             --V_PAR_SIT_NUM_PREVIOUS := '16009'; 
                                    v_flag_equal_rfc := true;
                                END IF;

                                EXIT WHEN v_flag_equal_rfc = true;
                            END IF; --fin if que compara igualdad de RFC con variable  V_RFC_PREVIOUS

                        ELSE-- else de if que evalua nularidad de variables previos
                        /*Se reinicia bandera para salir de loop interno*/
                            v_flag_equal_rfc := false;

                        /*IF para comparar los RFCs  y Bu de datamodel y de On Premise*/
                           -- DBMS_OUTPUT.PUT_LINE('Datos en comparación en segundo else : RFC: ' || P_INFORMATION(j).RFC || ',BU: ' || P_INFORMATION(j).BU_NAME);                                                                
                           -- DBMS_OUTPUT.PUT_LINE('RFC collection: ' || COLLECTION_INVOICES(i).RFC || '  RFC p_information: ' || P_INFORMATION(j).RFC || '   BU coll: ' || COLLECTION_INVOICES(i).Business_Unit_Name || '  BU info: ' || P_INFORMATION(j).BU_NAME );                            
                           -- DBMS_OUTPUT.PUT_LINE('');
                            IF
                                ( ( collection_invoices(i).rfc = p_information(j).rfc ) AND ( collection_invoices(i).business_unit_name = p_information(j).bu_name ) )
                            THEN
                                v_error_location := 'Error to set derived values from (Parameter)';

                            /*Se establecen los datos del Data Model al los registros de On premise */
                                collection_invoices(i).bill_to_cust_account_nmbr := p_information(j).account_number;
                                collection_invoices(i).bill_to_customer_site_nmbr := p_information(j).party_site_number;

               --              COLLECTION_INVOICES(i).PAYMENT_TERMS := P_INFORMATION(j).PAYMENT_TERMS;

                  -- si es nota de credito no lleva terminos de pago
                                IF
                                    collection_invoices(i).transaction_type_name NOT LIKE 'NOTA%'
                                THEN
                                    collection_invoices(i).payment_terms := p_information(j).payment_terms;
                                ELSE
                                    collection_invoices(i).payment_terms := NULL;
                                END IF;



                             -->
                             --COLLECTION_INVOICES(i).TRANSACTION_NUMBER := CONCAT(COLLECTION_INVOICES(i).TRANSACTION_NUMBER,'Z');                             

                            /*Se remplazan los valores derivados del RFC ya que se hacen pruebas,terminando pruebas dejar 
                              los del RFC*/
                             --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_ACCOUNT_NUMBER := '17405';             
                             --COLLECTION_INVOICES(i).BILL_TO_CUSTOMER_SITE_NUMBER := '16009';

                                v_rfc_previous := p_information(j).rfc;
                                v_acc_num_previous := p_information(j).account_number;
                                v_par_sit_num_previous := p_information(j).party_site_number;
                                v_payment_terms := p_information(j).payment_terms;
                                v_bu_previous := p_information(j).bu_name;

                            -- V_ACC_NUM_PREVIOUS     := '17405';
                            -- V_PAR_SIT_NUM_PREVIOUS := '16009';
                                v_flag_equal_rfc := true;
                            ELSE                        

                             /*If que evalua si el registro de valores de datamodel es el último,sí es así entonces
                               el registro de facturas no pudo ser derivado por lo tanto no debería enviarse al ERP-Cloud
                               Entonces se agrega a los mensajes de error y se elimina el registro de la lista de 
                               factura para mandar a cargar.*/
                                IF
                                    ( j = p_information.count )
                                THEN

                                /*Se agrega la factura que no pudo derivarse a los mensajes de error*/
                                    v_invoices_not_derived := v_invoices_not_derived
                                                              || ','
                                                              || collection_invoices(i).transaction_number;

                                     /*Se elimina el registro de la lista de facturas ya que no pudo derivarse*/
                                    collection_invoices.DELETE(i);
                                END IF;
                            END IF;

                            EXIT WHEN v_flag_equal_rfc = true;
                        END IF; --fin if que evalua nularidad de variables         
                    END LOOP;
                END LOOP;
            END IF;--Fin de if que evalua nularidad de tipo On Premise

        END IF;--Fin de if que evalua nularidad de tipo Data Model

        p_invoices := collection_invoices;
  --P_ERROR_DESC := V_INVOICES_NOT_DERIVED;
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.GET_INVOICES'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END get_invoices;

/**
 * Procedimiento utilizado para cambiar el estado de las facturas a "P" para
 * indicar que serán los datos que estan en proceso
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error 
 */

    PROCEDURE prepare_process_load_invoices (
        p_doc_type     IN VARCHAR2,
        p_error        OUT NUMBER,
        p_error_desc   OUT VARCHAR2
    ) AS

        v_processing       xxer_tbl_puente_header.estatus%TYPE := 'P';
        v_factura          VARCHAR2(10) := 'FACTURA';
        v_error_msg        VARCHAR2(300) := NULL;
        v_error_location   VARCHAR2(255);
        v_batch_id         VARCHAR2(300);-----variable del batch_id  jgr10052018
        CURSOR cur_all_invoices_to_work IS SELECT DISTINCT
            headers.tabla_puente_id,
            headers.rfc_destino AS "RFC"
  --,'AMPERSA_BU' AS "Business_Unit_Name"
  --,CONFIG.CD_UNIDAD_OPERATIVA AS "Business_Unit_Name"
           ,
            config.unidad_operativa AS "Business_Unit_Name",/*CONFIG.ORIGEN_TRANSACCION*/
            'VENDIDO' AS "Transaction_Batch_Source_Name"
  --,'FACTURA ER' AS "Transaction_Type_Name"
           ,
            config.tipo_transaccion_ar AS "Transaction_Type_Name",
            '30 Net' AS "Payment_Terms",
            ( headers.fecha_movimiento ) AS "Transaction_Date"--/*(HEADERS.FECHA_MOVIMIENTO)+4 AS "Transaction_Date"*/"
           ,
            ( headers.fecha_movimiento ) AS "Accounting_Date"--/*(HEADERS.FECHA_MOVIMIENTO)+4 AS "Accounting_Date"*/
           ,
            headers.numero_documento AS "Transaction_Number"
  --,('TRNY' || SUBSTR(TO_CHAR(sysdate,'YYYY-MM-DD HH24:MI:SS'),18,2)) AS "Transaction_Number"
           ,
            NULL AS "Original_System_Bill_to_Customer_Reference",
            NULL AS "Original_System_Bill_to_Customer_Address_Reference",
            NULL AS "Original_System_Bill_to_Customer_Contact_Reference",
            NULL AS "Original_System_Ship_to_Customer_Reference",
            NULL AS "Original_System_Ship_to_Customer_Address_Reference",
            NULL AS "Original_System_Ship_to_Customer_Contact_Reference",
            NULL AS "Original_System_Ship_to_Customer_Account_Reference",
            NULL AS "Original_System_Ship_to_Customer_Account_Address_Reference",
            NULL AS "Original_System_Ship_to_Customer_Account_Contact_Reference",
            NULL AS "Original_System_Sold_to_Customer_Reference",
            NULL AS "Original_System_Sold_to_Customer_Account_Reference",
            to_number('17405') AS "Bill_to_Customer_Account_Number",
            to_number('16009') AS "Bill_to_Customer_Site_Number",
            NULL AS "Bill_to_Contact_Party_Number",
            NULL AS "Ship_to_Customer_Account_Number",
            NULL AS "Ship_to_Customer_Site_Number",
            NULL AS "Ship_to_Contact_Party_Number",
            NULL AS "Sold_to_Customer_Account_Number",
            'LINE' AS "Transaction_Line_Type",
            lines.linea_articulo AS "Transaction_Line_Description",
            'MXN' AS "Currency_Code",
            'User' AS "Currency_Conversion_Type",
            ( SYSDATE ) - 10 AS "Currency_Conversion_Date",
            to_number('1') AS "Currency_Conversion_Rate",
            lines.subtotal AS "Transaction_Line_Amount",
            to_number('1') AS "Transaction_Line_Quantity",
            NULL AS "Customer_Ordered_Quantity",
            lines.subtotal AS "Unit_Selling_Price",
            NULL AS "Unit_Standard_Price",
            'INTEGRACION_TRX' AS "Line_Transactions_Flexfield_Context",
              /*  (
                    SELECT
                        TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS')
                    FROM
                        dual
                )*/
            v_batch_id AS "Line_Transactions_Flexfield_Segment_1",--asignacion batch_id jgr100518
            headers.tabla_puente_id AS "Line_Transactions_Flexfield_Segment_2",
            lines.tabla_puente_linea_id AS "Line_Transactions_Flexfield_Segment_3",
            NULL AS "Line_Transactions_Flexfield_Segment_4",
            NULL AS "Line_Transactions_Flexfield_Segment_5",
            NULL AS "Line_Transactions_Flexfield_Segment_6",
            NULL AS "Line_Transactions_Flexfield_Segment_7",
            NULL AS "Line_Transactions_Flexfield_Segment_8",
            NULL AS "Line_Transactions_Flexfield_Segment_9",
            NULL AS "Line_Transactions_Flexfield_Segment_10",
            NULL AS "Line_Transactions_Flexfield_Segment_11",
            NULL AS "Line_Transactions_Flexfield_Segment_12",
            NULL AS "Line_Transactions_Flexfield_Segment_13",
            NULL AS "Line_Transactions_Flexfield_Segment_14",
            NULL AS "Line_Transactions_Flexfield_Segment_15",
            NULL AS "Primary_Salesperson_Number",
			lines.codigo_iva AS "Tax_Classification_Code",
            --config.impuesto AS "Tax_Classification_Code",
            NULL AS "Legal_Entity_Identifier",
            NULL AS "Accounted_Amount_in_Ledger_Currency",
            NULL AS "Sales_Order_Number",
            NULL AS "Sales_Order_Date",
            NULL AS "Actual_Ship_Date",
            NULL AS "Warehouse_Code",
            NULL AS "Unit_of_Measure_Code",
         --LINES.UNIDAD_MEDIDA AS "Unit_of_Measure_Name",
            NULL AS "Unit_of_Measure_Name",
            NULL AS "Invoicing_Rule_Name",
            NULL AS "Revenue_Scheduling_Rule_Name",
            NULL AS "Number_of_Revenue_Periods",
            NULL AS "Revenue_Scheduling_Rule_Start_Date",
            NULL AS "Revenue_Scheduling_Rule_End_Date",
            NULL AS "Reason_Code_Meaning",
            NULL AS "Last_Period_to_Credit",
            NULL AS "Transaction_Business_Category_Code",
            NULL AS "Product_Fiscal_Classification_Code",
            NULL AS "Product_Category_Code",
            NULL AS "Product_Type",
            NULL AS "Line_Intended_Use_Code",
            NULL AS "Assessable_Value",
            NULL AS "Document_Sub_Type",
            NULL AS "Default_Taxation_Country",
            NULL AS "User_Defined_Fiscal_Classification",
            NULL AS "Tax_Invoice_Number",
            NULL AS "Tax_Invoice_Date",
            NULL AS "Tax_Regime_Code",
            NULL AS "Tax",
            NULL AS "Tax_Status_Code",
            NULL AS "Tax_Rate_Code",
            NULL AS "Tax_Jurisdiction_Code",
            NULL AS "First_Party_Registration_Number",
            NULL AS "Third_Party_Registration_Number",
            NULL AS "Final_Discharge_Location",
            NULL AS "Taxable_Amount",
            'Y' AS "Taxable_Flag",
            NULL AS "Tax_Exemption_Flag",
            NULL AS "TTax_Exemption_Reason_Code",
            NULL AS "Tax_Exemption_Reason_Code_Meaning",
            NULL AS "Tax_Exemption_Certificate_Number",
            NULL AS "Line_Amount_Includes_Tax_Flag",
            NULL AS "Tax_Precedence",
            NULL AS "Credit_Method_To_Be_Used_For_Lines_With_Revenue_Scheduling_Rules",
            NULL AS "Credit_Method_To_Be_Used_For_Transactions_With_Split_Payment_Terms",
            NULL AS "Reason_Code",
            NULL AS "Tax_Rate",
            NULL AS "FOB_Point",
            NULL AS "Carrier",
            NULL AS "Shipping_Reference",
            NULL AS "Sales_Order_Line_Number",
            NULL AS "Sales_Order_Source",
            NULL AS "Sales_Order_Revision_Number",
            NULL AS "Purchase_Order_Number",
            NULL AS "Purchase_Order_Revision_Number",
            NULL AS "Purchase_Order_Date",
            NULL AS "Agreement_Name"
  --,'XX'/*CONFIG.MEMO_LINE*/ "Memo_Line_Name"
           ,
            config.memo_line "Memo_Line_Name",
            NULL AS "Document_Number",
            NULL AS "Original_System_Batch_Name",
            NULL AS "Link_to_Transactions_Flexfield_Context",
            NULL AS "Link_to_Transactions_Flexfield_Segment_1",
            NULL AS "Link_to_Transactions_Flexfield_Segment_2",
            NULL AS "Link_to_Transactions_Flexfield_Segment_3",
            NULL AS "Link_to_Transactions_Flexfield_Segment_4",
            NULL AS "Link_to_Transactions_Flexfield_Segment_5",
            NULL AS "Link_to_Transactions_Flexfield_Segment_6",
            NULL AS "Link_to_Transactions_Flexfield_Segment_7",
            NULL AS "Link_to_Transactions_Flexfield_Segment_8",
            NULL AS "Link_to_Transactions_Flexfield_Segment_9",
            NULL AS "Link_to_Transactions_Flexfield_Segment_10",
            NULL AS "Link_to_Transactions_Flexfield_Segment_11",
            NULL AS "Link_to_Transactions_Flexfield_Segment_12",
            NULL AS "Link_to_Transactions_Flexfield_Segment_13",
            NULL AS "Link_to_Transactions_Flexfield_Segment_14",
            NULL AS "Link_to_Transactions_Flexfield_Segment_15",
            NULL AS "Reference_Transactions_Flexfield_Context",
            NULL AS "Reference_Transactions_Flexfield_Segment_1",
            NULL AS "Reference_Transactions_Flexfield_Segment_2",
            NULL AS "Reference_Transactions_Flexfield_Segment_3",
            NULL AS "Reference_Transactions_Flexfield_Segment_4",
            NULL AS "Reference_Transactions_Flexfield_Segment_5",
            NULL AS "Reference_Transactions_Flexfield_Segment_6",
            NULL AS "Reference_Transactions_Flexfield_Segment_7",
            NULL AS "Reference_Transactions_Flexfield_Segment_8",
            NULL AS "Reference_Transactions_Flexfield_Segment_9",
            NULL AS "Reference_Transactions_Flexfield_Segment_10",
            NULL AS "Reference_Transactions_Flexfield_Segment_11",
            NULL AS "Reference_Transactions_Flexfield_Segment_12",
            NULL AS "Reference_Transactions_Flexfield_Segment_13",
            NULL AS "Reference_Transactions_Flexfield_Segment_14",
            NULL AS "Reference_Transactions_Flexfield_Segment_15",
            NULL AS "Link_To_Parent_Line_Context",
            NULL AS "Link_To_Parent_Line_Segment_1",
            NULL AS "Link_To_Parent_Line_Segment_2",
            NULL AS "Link_To_Parent_Line_Segment_3",
            NULL AS "Link_To_Parent_Line_Segment_4",
            NULL AS "Link_To_Parent_Line_Segment_5",
            NULL AS "Link_To_Parent_Line_Segment_6",
            NULL AS "Link_To_Parent_Line_Segment_7",
            NULL AS "Link_To_Parent_Line_Segment_8",
            NULL AS "Link_To_Parent_Line_Segment_9",
            NULL AS "Link_To_Parent_Line_Segment_10",
            NULL AS "Link_To_Parent_Line_Segment_11",
            NULL AS "Link_To_Parent_Line_Segment_12",
            NULL AS "Link_To_Parent_Line_Segment_13",
            NULL AS "Link_To_Parent_Line_Segment_14",
            NULL AS "Link_To_Parent_Line_Segment_15",
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
            NULL AS "Bill_To_Customer_Bank_Account_Name",
            NULL AS "Reset_Transaction_Date_Flag",
            NULL AS "Payment_Server_Order_Number",
            NULL AS "Last_Transaction_on_Debit_Authorization",
            NULL AS "Approval_Code",
            NULL AS "Address_Verification_Code",
            NULL AS "Transaction_Line_Translated_Description",
            NULL AS "Consolidated_Billing_Number",
            NULL AS "Promised_Commitment_Amount",
            NULL AS "Payment_Set_Identifier",
            NULL AS "Original_Accounting_Date",
            NULL AS "Invoiced_Line_Accounting_Level",
            NULL AS "Override_AutoAccounting_Flag",
            NULL AS "Historical_Flag",
            NULL AS "Deferral_Exclusion_Flag",
            NULL AS "Payment_Attributes",
            NULL AS "Invoice_Billing_Date",
            NULL AS "Invoice_Lines_Flexfield_Context",
            NULL AS "Invoice_Lines_Flexfield_Segment_1",
            NULL AS "Invoice_Lines_Flexfield_Segment_2",
            NULL AS "Invoice_Lines_Flexfield_Segment_3",
            NULL AS "Invoice_Lines_Flexfield_Segment_4",
            NULL AS "Invoice_Lines_Flexfield_Segment_5",
            NULL AS "Invoice_Lines_Flexfield_Segment_6",
            NULL AS "Invoice_Lines_Flexfield_Segment_7",
            NULL AS "Invoice_Lines_Flexfield_Segment_8",
            NULL AS "Invoice_Lines_Flexfield_Segment_9",
            NULL AS "Invoice_Lines_Flexfield_Segment_10",
            NULL AS "Invoice_Lines_Flexfield_Segment_11",
            NULL AS "Invoice_Lines_Flexfield_Segment_12",
            NULL AS "Invoice_Lines_Flexfield_Segment_13",
            NULL AS "Invoice_Lines_Flexfield_Segment_14",
            NULL AS "Invoice_Lines_Flexfield_Segment_15",
            NULL AS "Invoice_Transactions_Flexfield_Context",
            NULL AS "Invoice_Transactions_Flexfield_Segment_1",
            NULL AS "Invoice_Transactions_Flexfield_Segment_2",
            NULL AS "Invoice_Transactions_Flexfield_Segment_3"
  --,AUX.UUID AS "Invoice_Transactions_Flexfield_Segment_3"
           ,
            NULL AS "Invoice_Transactions_Flexfield_Segment_4",
            NULL AS "Invoice_Transactions_Flexfield_Segment_5",
            NULL AS "Invoice_Transactions_Flexfield_Segment_6",
            NULL AS "Invoice_Transactions_Flexfield_Segment_7",
            NULL AS "Invoice_Transactions_Flexfield_Segment_8",
            NULL AS "Invoice_Transactions_Flexfield_Segment_9",
            NULL AS "Invoice_Transactions_Flexfield_Segment_10",
            NULL AS "Invoice_Transactions_Flexfield_Segment_11",
            NULL AS "Invoice_Transactions_Flexfield_Segment_12",
            NULL AS "Invoice_Transactions_Flexfield_Segment_13",
            NULL AS "Invoice_Transactions_Flexfield_Segment_14",
            NULL AS "Invoice_Transactions_Flexfield_Segment_15",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Context",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_1",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_2",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_3",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_4",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_5",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_6",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_7",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_8",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_9",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_10",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_11",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_12",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_13",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_14",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_15",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_16",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_17",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_18",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_19",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_20",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_21",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_22",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_23",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_24",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_25",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_26",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_27",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_28",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_29",
            NULL AS "Receivables_Transaction_Region_Information_Flexfield_Segment_30",
            NULL AS "Line_Global_Descriptive_Flexfield_Attribute_Category",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_1",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_2",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_3",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_4",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_5",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_6",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_7",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_8",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_9",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_10",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_11",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_12",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_13",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_14",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_15",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_16",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_17",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_18",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_19",
            NULL AS "Line_Global_Descriptive_Flexfield_Segment_20",
            NULL AS "Comments",
            NULL AS "Notes_from_Source",
            NULL AS "Enforce_Chronological_Document_Sequencing",
            config.organization_id,
            aux.uuid
                                           FROM
            xxer_tbl_puente_header headers,
            xxer_tbl_puente_lines lines,
            xxer_tbl_puente_aux aux,
            xxer_cnf_interfase_ingresos_ar config
                                           WHERE
            1 = 1
            AND headers.tabla_puente_id = lines.tabla_puente_id
            AND headers.tabla_puente_id = aux.tabla_puente_header_id (+)
            AND nvl(config.sistema_origen,1) = nvl(headers.sistema_origen,1)
            AND nvl(config.tipo_documento,1) = nvl(headers.tipo_documento,1)
            AND nvl(config.tipo_movimiento,1) = nvl(headers.tipo_movimiento,1)
            AND DECODE(nvl(config.sistema_origen,1),'NOMINA',nvl(headers.rfc_origen,1),nvl(config.rfc_origen,1) ) = nvl(headers.rfc_origen,1)
            AND DECODE(nvl(config.sucursal_venta,1),'TODOS',nvl(headers.sucursal_venta,1),nvl(config.sucursal_venta,1) ) = nvl(headers.sucursal_venta
,1)
            AND DECODE(nvl(config.origen_servicio,1),'TODOS',nvl(lines.origen_servicio,1),nvl(config.origen_servicio,1) ) = nvl(lines.origen_servicio
,1)
            AND DECODE(nvl(config.destino_servicio,1),'TODOS',nvl(lines.destino_servicio,1),nvl(config.destino_servicio,1) ) = nvl(lines.destino_servicio
,1)
            AND DECODE(nvl(config.servicio,1),'TODOS',nvl(lines.servicio,1),nvl(config.servicio,1) ) = nvl(lines.servicio,1)
            AND nvl(config.concepto_modalidad,1) = nvl(lines.concepto_modalidad,1)
            AND DECODE(nvl(config.forma_pago,1),'TODOS',nvl(lines.forma_pago,1),nvl(config.forma_pago,1) ) = nvl(lines.forma_pago,1)
            AND nvl(config.adicional1,1) = nvl(headers.adicional1,1)
    /*AND
        nvl(CONFIG.adicional2,1) = nvl(HEADERS.adicional2,1)*/
            AND nvl(config.adicional3,1) = nvl(headers.adicional3,1)
            AND nvl(config.adicional4,1) = nvl(headers.adicional4,1)
            AND nvl(config.adicional5,1) = nvl(headers.adicional5,1)
            AND nvl(config.adicional6,1) = nvl(headers.adicional6,1)
            AND nvl(config.adicional7,1) = nvl(headers.adicional7,1)
            AND nvl(config.adicional8,1) = nvl(headers.adicional8,1)
            AND nvl(config.adicional9,1) = nvl(headers.adicional9,1)
            AND nvl(config.adicional10,1) = nvl(headers.adicional10,1)
            AND headers.sistema_origen NOT IN (
                'EAM',
                'INV',
                'PORTAL'
            )
  --  AND
    --    HEADERS.tipo_documento NOT IN (
      --      'RECIBO','REVERSO RECIBO'
       -- )
            AND headers.tipo_documento = p_doc_type
            AND nvl(headers.estatus,'x') NOT IN (
                'S',
                'E'
            )
            AND 1 = 1
                                           GROUP BY
            headers.rfc_destino,
            headers.fecha_movimiento,
            headers.tabla_puente_id,
            headers.numero_documento,
            config.tipo_transaccion_ar,
            config.memo_line,
            lines.linea_articulo,
            lines.subtotal,
            lines.tabla_puente_linea_id,
            lines.unidad_medida,
            config.organization_id,
            config.unidad_operativa,
            aux.uuid,
            headers.tabla_puente_id,
			lines.codigo_iva
            --config.impuesto
        ORDER BY
            headers.numero_documento--7
            ;

    BEGIN
        v_batch_id := TO_CHAR(xxer_invoice_batch_id_seq.nextval);---obtencion del batch_id jgr10052018
        FOR rec IN cur_all_invoices_to_work LOOP
            IF
                ( ( rec.tabla_puente_id IS NOT NULL ) AND ( rec."Transaction_Number" IS NOT NULL ) )
            THEN
                v_error_location := 'Error to update status invoices to (P)';

      /*Se actualizan los registros de la tabla header para ponerlos en estado processing y se les agrega el batch_id*/
                UPDATE xxer_tbl_puente_header
                SET
                    estatus = v_processing,
                    adicional2 = rec."Line_Transactions_Flexfield_Segment_1"  ----asignacion batch_id jgr100518
                WHERE
                    tabla_puente_id = rec.tabla_puente_id
                    AND numero_documento = rec."Transaction_Number"; 
        --null;

            END IF;
        END LOOP;

        v_error_location := 'Error to apply COMMIT';
        COMMIT;/*Se confirma la actualización de los datos*/
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_AR_UTILITIES_PKG.PREPARE_PROCESS_LOAD_INVOICES'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END prepare_process_load_invoices;  

   /**
 * Procedimiento usado para procesar los resultados de carga de facturas
 * y devolver el detalle numero de facturas cargadas,el número de fallos y el total de 
 * registros procesados,tambien traera los mensages de error que se hayan tenido
 */

    PROCEDURE get_result_of_load_invoices (
        p_invoice_load_status   xxer_invoice_load_status_ttype,
        p_total_successful      OUT NUMBER,
        p_total_errors          OUT NUMBER,
        p_total_processed       OUT NUMBER,
        p_error_messages_inv    OUT xxer_error_messages_inv_ttype,
        p_error                 OUT NUMBER,
        p_error_desc            OUT VARCHAR2
    ) AS

        v_trx_number_error_previous   VARCHAR2(100) := 'X';
        v_cont_total_trx_number       NUMBER := 0;
        v_cont_error_trx_number       NUMBER := 0;
        v_cont_load_trx_number        NUMBER := 0;
        c_loaded                      VARCHAR2(10) := 'LOADED';
        v_message_error               VARCHAR2(500);
        v_data_value_error            VARCHAR(250);
        error_messages_tb             xxer_error_messages_inv_ttype := xxer_error_messages_inv_ttype ();
    BEGIN
 /* Evalua nularidad de lista de resultados de carga*/
        IF
            p_invoice_load_status.count > 0
        THEN
            FOR i IN 1..p_invoice_load_status.count LOOP
    /*Evalua si el registro de factura (TRX_NUMBER) fue cargado correctamente*/
                IF
                    p_invoice_load_status(i).status = c_loaded
                THEN
                    v_cont_load_trx_number := v_cont_load_trx_number + 1;        

    /*Evalua si el TRX_NUMBER en ERROR es diferente al anterior,si es diferente es considerado como una diferente factura en error
      pero si es igual es considerado como una factura repetidad que intento cargarse y se descarta su conteo en el total de facturas a procesar*/
                ELSIF p_invoice_load_status(i).trx_number <> v_trx_number_error_previous THEN
                    v_cont_error_trx_number := v_cont_error_trx_number + 1; 

        /*Se asigna el nuevo registro de factura en error para comparar la nueva factura en error*/
                    v_trx_number_error_previous := p_invoice_load_status(i).trx_number;
                    v_message_error := 'Error load in : '
                                       || p_invoice_load_status(i).trx_number
                                       || '; '
                                       || 'INVALID_VALUE: '
                                       || p_invoice_load_status(i).invalid_value
                                       || '; '
                                       || 'MESSAGE_TEXT: '
                                       || p_invoice_load_status(i).message_text;

                    v_data_value_error := 'INVALID_VALUE: ' || p_invoice_load_status(i).invalid_value;
                    error_messages_tb.extend;
                    error_messages_tb(error_messages_tb.count) := xxer_error_messages_inv_type(v_message_error,v_data_value_error);
                END IF;
            END LOOP;

            v_cont_total_trx_number := v_cont_load_trx_number + v_cont_error_trx_number;

    /*Asignación de valores a prámetros de salida*/
            p_total_successful := v_cont_load_trx_number;
            p_total_errors := v_cont_error_trx_number;
            p_total_processed := v_cont_total_trx_number;
            p_error_messages_inv := error_messages_tb;
        END IF; /*Fin de IF que evalua nularidad de lista de resultados*/
    END get_result_of_load_invoices;

 /*
 * Procedimiento usado para actualizar el status de las facturas
 * en las tablas custom,tomando como base el parametro de tipo XXER_INVOICE_LOAD_STATUS_TTYPE
 * que contiene el transaction_number y el batch_id.
 */

    PROCEDURE update_status_invoices (
        p_load_results   IN xxer_ar_params_upd_inv_ttype,
        p_error          OUT NUMBER,
        p_error_desc     OUT VARCHAR2
    ) AS

        v_load_results_tb            xxer_ar_params_upd_inv_ttype := xxer_ar_params_upd_inv_ttype ();
        v_exist_rec_to_update        NUMBER := 0;
        v_status_success             VARCHAR2(1) := 'S';
        v_status_error               VARCHAR2(1) := 'E';
        v_status_load_error          VARCHAR2(10) := 'E';
        v_status_load_success        VARCHAR2(10) := 'S';
        v_flag_process_some_record   BOOLEAN := false;
        v_params_null                VARCHAR2(3000) := '';
        v_error_msg                  VARCHAR2(300) := NULL;
        v_error_location             VARCHAR2(255);
        v_commit                     NUMBER := 0;--contador para hacer commit
        PRAGMA autonomous_transaction;
    BEGIN
/*  
P_ERROR := 555;
P_ERROR_DESC := 'Hellow World';
*/
        v_load_results_tb := p_load_results;

  /*Se evalua la nularidad del parámetro que contiene la colección de resultados de carga*/
        IF
            v_load_results_tb.count > 0
        THEN
            FOR i IN 1..v_load_results_tb.count LOOP
                v_commit := v_commit + 1;---contando registros para hacer comit cada 10 transacciones
                v_error_location := 'Error when evaluating the nullity of parameters';
    /*Se revisa que todos los campos de los registros de V_LOAD_RESULTS_TB esten llenos para continuar con el proceso
      de actualización*/
                IF
                    ( v_load_results_tb(i).batch_id IS NOT NULL ) AND ( v_load_results_tb(i).transaction_number IS NOT NULL ) AND ( v_load_results_tb(i).status IS NOT
NULL )
                THEN
                    v_error_location := 'Error when verify the exist record to update.'; 
         /*Se revisa que exista el registro a modificar en la tabla header*/
                    SELECT
                        COUNT(*)
                    INTO v_exist_rec_to_update
                    FROM
                        xxer_tbl_puente_header
                    WHERE
                        1 = 1
                        AND tipo_documento NOT IN (
                            'RECIBO',
                            'REVERSO RECIBO'
                        )
                        AND numero_documento = v_load_results_tb(i).transaction_number
                        AND adicional2 = v_load_results_tb(i).batch_id;

                    IF
                        ( v_exist_rec_to_update > 0 )
                    THEN
                        dbms_output.put_line('Se encontro el valor a registrar');
                        dbms_output.put_line('El status entrante es: ' || v_load_results_tb(i).status);
                        IF
                            ( v_load_results_tb(i).status = v_status_load_success )
                        THEN
                            v_error_location := 'Error when update record with trx_number: '
                                                || v_load_results_tb(i).transaction_number
                                                || ' to Successs';

                /*Se ejecuta la sentencia para actualizar el registro y establecer su estado de carga*/
                            UPDATE xxer_tbl_puente_header
                            SET
                                estatus = v_status_success
                            WHERE
                                numero_documento = v_load_results_tb(i).transaction_number
                                AND adicional2 = v_load_results_tb(i).batch_id;

                            v_flag_process_some_record := true;
                        ELSE
                            v_error_location := 'Error when update record with trx_number: '
                                                || v_load_results_tb(i).transaction_number
                                                || ' to Error';
                            UPDATE xxer_tbl_puente_header
                            SET
                                estatus = v_status_error
                            WHERE
                                numero_documento = v_load_results_tb(i).transaction_number
                                AND adicional2 = v_load_results_tb(i).batch_id;

                            v_flag_process_some_record := true;
                        END IF;

                    ELSE
         /*Se agrega a la varible de error el mensaje de que registros no pueden actualizarse 
           por que no se encontraron*/
                        p_error_desc := p_error_desc
                                        || '; No exist the record to update with NUMERO_DOCUMENTO = '
                                        || v_load_results_tb(i).transaction_number
                                        || ' y ADICIONAL2 = '
                                        || v_load_results_tb(i).batch_id
                                        || ' in XXER_TBL_PUENTE_HEADER ';
                    END IF; /*Fin if que compara si hay dato a actualizar en la BD*/
       --P_ERROR_DESC :=   P_ERROR_DESC || ',Exist null fiel'

                ELSE

        /* Agregan al mensaje de error los campos nulos del registro que se quiere actualizar*/
                    IF
                        v_load_results_tb(i).batch_id IS NULL
                    THEN
                        v_params_null := v_params_null
                                         || ','
                                         || v_load_results_tb(i).batch_id;
                    END IF;

                    IF
                        v_load_results_tb(i).transaction_number IS NULL
                    THEN
                        v_params_null := v_params_null
                                         || ','
                                         || v_load_results_tb(i).transaction_number;
                    END IF;

                    IF
                        v_load_results_tb(i).status IS NULL
                    THEN
                        v_params_null := v_params_null
                                         || ','
                                         || v_load_results_tb(i).status;
                    END IF;

                    p_error_desc := p_error_desc
                                    || '; The param P_LOAD_RESULTS in the next fields is null: '
                                    || v_params_null;
                END IF; /*Fin de IF que evalua que los campos del registro a actualizar vengan llenos*/

                IF
                    v_commit = 10
                THEN
                    COMMIT;
                    v_commit := 0;
                END IF;
            END LOOP;

        ELSE
            p_error_desc := 'The param P_LOAD_RESULTS is null,is not possible continue with update.';
        END IF; /*Fin de if que evalua ue el parametro de resultados venga lleno*/

        IF
            v_flag_process_some_record = true
        THEN
  /*Si se actualizó al menos un registro se aplica commit*/
   --         NULL;
    COMMIT;
        END IF;
        UPDATE xxer_tbl_puente_header
        SET
            estatus = 'E',
            detalle_error = 'Error de datos(clientes,terminos de pagos,etc)'
        WHERE
            estatus = 'P';

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_AR_UTILITIES_PKG.UPDATE_STATUS_INVOICES'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END update_status_invoices;  


/*Procedimiento usado para recuperar el organization_id tomando como base base al TRX_NUMBER
  se traera el organization_id solo de aquellos registros de entrada que esten con estado LOADED
  se omitiran los que esten en error.*/

    PROCEDURE get_complement_to_upd_uuid (
        p_invoices_to_update       IN xxer_invoices_to_update_ttype,
        p_complement_upd_uuid_id   OUT xxer_complement_upd_uuid_ttype,
        p_error                    OUT NUMBER,
        p_error_desc               OUT VARCHAR2
    ) AS

        v_status_loaded            VARCHAR2(10) := 'S';
        v_organization_id          xxer_cnf_interfase_ingresos_ar.organization_id%TYPE := NULL;
        v_complement_upd_uuid_tb   xxer_complement_upd_uuid_ttype := xxer_complement_upd_uuid_ttype ();
        v_exist_record             NUMBER := 0;
        v_uuid                     xxer_tbl_puente_aux.uuid%TYPE := '';
        v_error_msg                VARCHAR2(300) := NULL;
        v_error_location           VARCHAR2(255);
    BEGIN
--V_TRX_NUM_AND_ORG_ID_TB

/*Se evalua que el parámetro de registros para encontrar complementos,no venga nulo*/
        IF
            p_invoices_to_update.count > 0
        THEN
            FOR i IN 1..p_invoices_to_update.count LOOP
                IF
                    p_invoices_to_update(i).status = v_status_loaded
                THEN
                    v_error_location := 'Error when search record to search organization_id';
                    SELECT DISTINCT
                        COUNT(*)
                    INTO v_exist_record
                    FROM
                        xxer_ar_invoices_v inv
                    WHERE
                        1 = 1
                        AND inv."Transaction_Number" = p_invoices_to_update(i).trx_number
                        AND ROWNUM = 1;
                /*Se compara si existe el registro para recuperar el ORG_ID*/

                    IF
                        v_exist_record > 0
                    THEN
                        v_error_location := 'Error when obtaining organization_id for transaction_number: ' || p_invoices_to_update(i).trx_number;
                        SELECT DISTINCT
                            nvl(inv.organization_id,0),
                            nvl(inv.uuid,'Default')
                        INTO
                            v_organization_id,
                            v_uuid
                        FROM
                            xxer_ar_invoices_v inv
                        WHERE
                            1 = 1
                            AND inv."Transaction_Number" = p_invoices_to_update(i).trx_number
                            AND ROWNUM = 1;

                    /*Se agrega el TRX_NUMBER y ORGANIZATION_ID  ala varible de salida */

                        v_complement_upd_uuid_tb.extend;
                        v_complement_upd_uuid_tb(v_complement_upd_uuid_tb.count) := xxer_complement_upd_uuid_type(p_invoices_to_update(i).trx_number,v_organization_id
,v_uuid);

                    ELSE
                        p_error_desc := ',The Invoice with TRX_NUMBER '
                                        || p_invoices_to_update(i).trx_number
                                        || ' could not be update,because not found the ORG_ID. ';
                    END IF;

                ELSE
          /*Agregar mensaje o funcionalidad para cuando el registro es error*/
                    NULL;
                END IF; /*Fin de IF que evalua si el estado de la factura fue cargado (LOADED)*/
            END LOOP;
        END IF; /*Fin de if que evalua la nularidad de del parametro de facturas a guardar*/

  /*Se asigna la varible de TRX_NUMBER y ORG_ID encontrados a la varible de salida*/

        p_complement_upd_uuid_id := v_complement_upd_uuid_tb;
    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_AR_UTILITIES_PKG.PREPARE_PROCESS_LOAD_INVOICES'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END get_complement_to_upd_uuid;

END xxer_utilities_pkg;