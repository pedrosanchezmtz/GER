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

        v_processing       INER_XXER_PUENTE_HEADER_TBL.estatus%TYPE := 'P';
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
            config.impuesto AS "Tax_Classification_Code",
            NULL AS "Legal_Entity_Identifier",
            NULL AS "Accounted_Amount_in_Ledger_Currency",
            NULL AS "Sales_Order_Number",
            NULL AS "Sales_Order_Date",
            NULL AS "Actual_Ship_Date",
            NULL AS "Warehouse_Code",
            NULL AS "Unit_of_Measure_Code"
  --,LINES.UNIDAD_MEDIDA AS "Unit_of_Measure_Name"
           ,
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
            INER_XXER_PUENTE_HEADER_TBL headers,
            INER_XXER_PUENTE_LINES_TBL lines,
            INER_XXER_PUENTE_AUX_TBL aux,
            INER_XXER_CNF_INTERFASE_INGRESOS_AR_TBL config
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
            -- AND NVL (config.concepto_modalidad, 1) = NVL (lines.concepto_modalidad, 1)
AND NVL (config.concepto_modalidad, 1) = NVL (DECODE(SUBSTR(lines.concepto_modalidad,1,16),'FLETES AGRUPADOR','FLETES AGRUPADOR',lines.concepto_modalidad), 1)--PROPUESTA
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
            config.impuesto
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
                UPDATE INER_XXER_PUENTE_HEADER_TBL
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