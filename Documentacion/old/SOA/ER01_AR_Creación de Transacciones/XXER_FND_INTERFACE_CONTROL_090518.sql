SELECT
    "Status",
    "InterfaceType",
    "BatchId",
    "HeaderId",
    "LineId",
    "ErrorMsg",
    "DataValue",
    "LoadRequestId",
    "RequestId"
FROM
    (
    /****************************************
    -- Error Dummy
    *****************************************/
        SELECT
            'E' AS "Status",
            'DummyTemplate' AS "InterfaceType",
            '54682' AS "BatchId",
            '98461' AS "HeaderId",
            '487596' AS "LineId",
            'Error: Dummy Error' AS "ErrorMsg",
            'Dat Value Error Dummy' AS "DataValue",
            95623 AS "LoadRequestId"  -- Job Id Interfaces
            ,
            0 AS "RequestId"
        FROM
            dual
        UNION ALL
    /****************************************
    -- Messages Error GL Interfaces
    *****************************************/ SELECT
            'E' AS "Status",
            'JournalImportTemplate' AS "InterfaceType",
            TO_CHAR(gi.group_id) AS "BatchId",
            TO_CHAR(nvl(gi.je_header_id,0) ) AS "HeaderId",
            TO_CHAR(nvl(gi.je_line_num,0) ) AS "LineId",
            ( gi.status
             || ' = '
             || gi.status_description ) AS "ErrorMsg",
            ( 'USER_JE_SOURCE_NAME: '
             || gi.user_je_source_name
             || '|ACC_DATE: '
             || gi.accounting_date ) AS "DataValue",
            gi.load_request_id AS "LoadRequestId"  -- Job Id Interfaces
            ,
            gi.request_id AS "RequestId"
        FROM
            gl_interface gi
        UNION ALL
    /****************************************
    -- Messages Error AR Interfaces Auto Invoices
    *****************************************/ SELECT
            'E' AS "Status",
            'AutoInvoiceImportTemplate' AS "InterfaceType",
            ril.interface_line_attribute1 AS "BatchId",
            ril.interface_line_attribute2 AS "HeaderId",
            ril.interface_line_attribute3 AS "LineId",
            ( ril.interface_status
             || ' = '
             || ria.message_text ) AS "ErrorMsg",
            ( 'Invalid Value: '
             || ria.invalid_value
             || ' |Invoice Number: '
             || ril.trx_number
             || ' |AMOUNT: '
             || ril.amount ) AS "DataValue",
            ril.load_request_id AS "LoadRequestId"  -- Job Id Interfaces
            ,
            ril.request_id AS "RequestId"
        FROM
            ra_interface_errors_all ria,
            ra_interface_lines_all ril
        WHERE
            ril.interface_line_id = ria.interface_line_id (+)
and ril.interface_line_id =(select  ril2.interface_line_id 
                                         from ra_interface_lines_all ril2 
                                         where ril2.interface_line_attribute2=ril.interface_line_attribute2
                                         and rownum=1
                                         )
        UNION ALL
    /****************************************
    -- Messages Error INV Interfaces Load Items
    *****************************************/ SELECT
                CASE
                    WHEN (
                        process_flag = 1
                    ) THEN 'Ready'
                    WHEN (
                        process_flag = 2
                    ) THEN 'Not Ready'
                    ELSE 'Fails'
                END
            AS "Status",
            'InventoryTransactionImportTemplate' AS "InterfaceType",
            TO_CHAR(it.source_header_id) AS "BatchId",
            TO_CHAR(it.source_header_id) AS "HeaderId",
            TO_CHAR(it.source_line_id) AS "LineId",
            ( it.error_code
             || ' = '
             || error_explanation ) AS "ErrorMsg",
            ( 'TRANSACTION_DATE: '
             || it.transaction_date
             || '| QTY: '
             || it.transaction_quantity ) AS "DataValue",
            it.load_request_id AS "LoadRequestId"  -- Job Id Interfaces
            ,
            it.request_id AS "RequestId"
        FROM
            inv_transactions_interface it
    /****************************************
    -- Messages Error CE Interfaces Statement Banks
    *****************************************/
        UNION ALL
        SELECT
            nvl(
                nvl(
                    csie.error_level,
                    csh.process_status_code
                ),
                'S'
            ) AS "Status",
            'CashManagementBankStatementImportTemplate' AS "InterfaceType",
            nvl(csl.attribute1,0) AS "BatchId",
            TO_CHAR(csh.statement_header_int_id) AS "HeaderId",
            TO_CHAR(csl.statement_line_int_id) AS "LineId",
            ( csh.process_status_code
             || ' = '
             || csie.error_msg ) AS "ErrorMsg",
            ( 'STATEMENT_NUMBER: '
             || statement_number
             || '| LINE_NUMBER: '
             || csl.line_number
             || ' |BANK_NUM'
             || bank_account_num ) AS "DataValue",
            csh.load_request_id AS "LoadRequestId"  -- Job Id Interfaces
            ,
            0 AS "RequestId"
        FROM
            ce_statement_lines_int csl,
            ce_statement_headers_int csh,
            ce_stmt_import_errors csie
        WHERE
                csh.statement_header_int_id = csl.statement_header_int_id
            AND
                csh.statement_header_int_id = csie.statement_header_int_id (+)
    /****************************************
    -- Load Data in Standard Table
    *****************************************/
        UNION ALL
        SELECT
            'S' AS "Status",
            'JournalImportTemplate' AS "InterfaceType",
            TO_CHAR(gjb.je_batch_id) AS "BatchId" -- GJB.GROUP_ID
            ,
            TO_CHAR(gjh.je_header_id) AS "HeaderId",
            TO_CHAR(gjl.je_line_num) AS "LineId",
            NULL AS "ErrorMsg",
            ( 'Batch Name: '
             || gjb.name
             || '| Journal Name: '
             || gjh.name ) AS "DataValue",
            NULL AS "LoadRequestId"  -- Job Id Interfaces
            ,
            gjb.request_id AS "RequestId"
        FROM
            gl_je_lines gjl,
            gl_je_headers gjh,
            gl_je_batches gjb
        WHERE
                gjh.je_batch_id = gjb.je_batch_id
            AND
                gjh.je_header_id = gjl.je_header_id
        UNION ALL
       SELECT
            'S' AS "Status",
            'AutoInvoiceImportTemplate' AS "InterfaceType",
            rctl.interface_line_attribute1 AS "BatchId" -- GJB.GROUP_ID
            ,
            TO_CHAR(rcta.customer_trx_id) AS "HeaderId",
            TO_CHAR(rctl.customer_trx_line_id) AS "LineId",
            NULL AS "ErrorMsg",
            ( 'Invoice Number: '
             || rcta.trx_number
             || '| Journal Name: '
             || rctl.line_number
             || ' |Amount: '
             || rctd.amount ) AS "DataValue",
            0 AS "LoadRequestId"  -- Job Id Interfaces
            ,
            rcta.request_id AS "RequestId"
        FROM
            ra_customer_trx_lines_all rctl,
            ra_customer_trx_all rcta
           , ra_cust_trx_line_gl_dist_all rctd
        WHERE
                rcta.customer_trx_id = rctl.customer_trx_id
            AND  rctl.customer_trx_line_id = rctd.customer_trx_line_id
            AND
                rcta.request_id IS NOT NULL
            and line_number=1
        UNION ALL
        SELECT
            'S' AS "Status",
            'InventoryTransactionImportTemplate' AS "InterfaceType",
            TO_CHAR(imt.transaction_batch_id) AS "BatchId" -- GJB.GROUP_ID
            ,
            TO_CHAR(imt.transaction_id) AS "HeaderId",
            TO_CHAR(imt.transaction_interface_id) AS "LineId",
            NULL AS "ErrorMsg",
            ( 'Item: '
             || esi.attribute1
             || '.'
             || esi.attribute1
             || '| Transaction Date: '
             || imt.transaction_date ) AS "DataValue",
            imt.load_request_id AS "LoadRequestId"  -- Job Id Interfaces
            ,
            imt.request_id AS "RequestId"
        FROM
            inv_material_txns imt,
            egp_system_items_b esi
        WHERE
                imt.inventory_item_id = esi.inventory_item_id
            AND
                imt.organization_id = esi.organization_id
        UNION ALL
        SELECT
            'S' AS "Status",
            'InventoryTransactionImportTemplate' AS "InterfaceType",
            '0' AS "BatchId" -- GJB.GROUP_ID
            ,
            TO_CHAR(csh.statement_header_id) AS "HeaderId",
            TO_CHAR(csl.statement_line_id) AS "LineId",
            NULL AS "ErrorMsg",
            ( 'Bank Account: '
             || cba.bank_account_name
             || '| Number: '
             || csh.statement_number
             || ' |Line: '
             || csl.line_number ) AS "DataValue",
            csh.autorec_process_id AS "LoadRequestId"  -- Job Id Interfaces
            ,
            cba.request_id AS "RequestId"
        FROM
            ce_bank_accounts cba,
            ce_statement_lines csl,
            ce_statement_headers csh
        WHERE
                cba.bank_account_id = csh.bank_account_id
            AND
                csh.statement_header_id = csl.statement_header_id
    )
WHERE
        "InterfaceType" = nvl(:p_type_interfaces,"InterfaceType")
    AND
        "BatchId" = nvl(:p_batch_id,"BatchId")
    AND
        "LoadRequestId" = nvl(:p_load_request_id,"LoadRequestId")
    AND
        "Status" = nvl(:p_estatus,"Status")