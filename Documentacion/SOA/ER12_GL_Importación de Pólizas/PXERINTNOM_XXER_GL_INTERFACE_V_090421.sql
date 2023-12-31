
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PXERINTNOM"."XXER_GL_INTERFACE_V" ("STATUS", "LEDGER_ID", "ACCOUNTING_DATE", "CURRENCY_CODE", "DATE_CREATED", "CREATED_BY", "ACTUAL_FLAG", "USER_JE_CATEGORY_NAME", "USER_JE_SOURCE_NAME", "CURRENCY_CONVERSION_DATE", "ENCUMBRANCE_TYPE_ID", "BUDGET_VERSION_ID", "USER_CURRENCY_CONVERSION_TYPE", "CURRENCY_CONVERSION_RATE", "AVERAGE_JOURNAL_FLAG", "ORIGINATING_BAL_SEG_VALUE", "SEGMENT1", "SEGMENT2", "SEGMENT3", "SEGMENT4", "SEGMENT5", "SEGMENT6", "SEGMENT7", "SEGMENT8", "SEGMENT9", "SEGMENT10", "SEGMENT11", "SEGMENT12", "SEGMENT13", "SEGMENT14", "SEGMENT15", "SEGMENT16", "SEGMENT17", "SEGMENT18", "SEGMENT19", "SEGMENT20", "SEGMENT21", "SEGMENT22", "SEGMENT23", "SEGMENT24", "SEGMENT25", "SEGMENT26", "SEGMENT27", "SEGMENT28", "SEGMENT29", "SEGMENT30", "ENTERED_DR", "ENTERED_CR", "ACCOUNTED_DR", "ACCOUNTED_CR", "TRANSACTION_DATE", "REFERENCE1", "REFERENCE2", "REFERENCE3", "REFERENCE4", "REFERENCE5", "REFERENCE6", "REFERENCE7", "REFERENCE8", "REFERENCE9", "REFERENCE10", "REFERENCE11", "REFERENCE12", "REFERENCE13", "REFERENCE14", "REFERENCE15", "REFERENCE16", "REFERENCE17", "REFERENCE18", "REFERENCE19", "REFERENCE20", "REFERENCE21", "REFERENCE22", "REFERENCE23", "REFERENCE24", "REFERENCE25", "REFERENCE26", "REFERENCE27", "REFERENCE28", "REFERENCE29", "REFERENCE30", "JE_BATCH_ID", "PERIOD_NAME", "JE_HEADER_ID", "JE_LINE_NUM", "CHART_OF_ACCOUNTS_ID", "FUNCTIONAL_CURRENCY_CODE", "CODE_COMBINATION_ID", "DATE_CREATED_IN_GL", "WARNING_CODE", "STATUS_DESCRIPTION", "STAT_AMOUNT", "GROUP_ID", "REQUEST_ID", "SUBLEDGER_DOC_SEQUENCE_ID", "SUBLEDGER_DOC_SEQUENCE_VALUE", "ATTRIBUTE1", "ATTRIBUTE2", "GL_SL_LINK_ID", "GL_SL_LINK_TABLE", "ATTRIBUTE3", "ATTRIBUTE4", "ATTRIBUTE5", "ATTRIBUTE6", "ATTRIBUTE7", "ATTRIBUTE8", "ATTRIBUTE9", "ATTRIBUTE10", "ATTRIBUTE11", "ATTRIBUTE12", "ATTRIBUTE13", "ATTRIBUTE14", "ATTRIBUTE15", "ATTRIBUTE16", "ATTRIBUTE17", "ATTRIBUTE18", "ATTRIBUTE19", "ATTRIBUTE20", "CONTEXT", "CONTEXT2", "INVOICE_DATE", "TAX_CODE", "INVOICE_IDENTIFIER", "INVOICE_AMOUNT", "CONTEXT3", "USSGL_TRANSACTION_CODE", "DESCR_FLEX_ERROR_MESSAGE", "JGZZ_RECON_REF", "REFERENCE_DATE", "SET_OF_BOOKS_ID", "BALANCING_SEGMENT_VALUE", "MANAGEMENT_SEGMENT_VALUE", "FUNDS_RESERVED_FLAG", "CODE_COMBINATION_ID_INTERIM", "EMPRESA", "INTERCO", "ESTRUC_NEG_SERV", "CC", "CUENTA") AS 
  SELECT xgi.status status,
          xgi.ledger_id ledger_id,
          xgi.accounting_date accounting_date,
          xgi.currency_code currency_code,
          xgi.date_created date_created,
          xgi.created_by created_by,
          xgi.actual_flag actual_flag,
          xgi.user_je_category_name user_je_category_name,
          xgi.user_je_source_name user_je_source_name,
          xgi.currency_conversion_date currency_conversion_date,
          xgi.encumbrance_type_id encumbrance_type_id,
          xgi.budget_version_id budget_version_id,
          xgi.user_currency_conversion_type user_currency_conversion_type,
          xgi.currency_conversion_rate currency_conversion_rate,
          xgi.average_journal_flag average_journal_flag,
          xgi.originating_bal_seg_value originating_bal_seg_value,
          xgi.segment1 segment1,
          xgi.segment2 segment2,
          xgi.segment3 segment3,
          xgi.segment4 segment4,
          xgi.segment5 segment5,
          '0000' segment6,
          '0000' segment7,
          '0000' segment8,
          '0000' segment9,
          '0000' segment10,
          xgi.segment11 segment11,
          xgi.segment12 segment12,
          xgi.segment13 segment13,
          xgi.segment14 segment14,
          xgi.segment15 segment15,
          xgi.segment16 segment16,
          xgi.segment17 segment17,
          xgi.segment18 segment18,
          xgi.segment19 segment19,
          xgi.segment20 segment20,
          xgi.segment21 segment21,
          xgi.segment22 segment22,
          xgi.segment23 segment23,
          xgi.segment24 segment24,
          xgi.segment25 segment25,
          xgi.segment26 segment26,
          xgi.segment27 segment27,
          xgi.segment28 segment28,
          xgi.segment29 segment29,
          xgi.segment30 segment30,
          xgi.entered_dr entered_dr,
          xgi.entered_cr entered_cr,
          xgi.accounted_dr accounted_dr,
          xgi.accounted_cr accounted_cr,
          xgi.transaction_date transaction_date,
          xgi.reference1 reference1,
          xgi.reference2 reference2,
          xgi.reference3 reference3,
          xgi.reference4 reference4,
          xgi.reference5 reference5,
          xgi.reference6 reference6,
          xgi.reference7 reference7,
          xgi.reference8 reference8,
          xgi.reference9 reference9,
          xgi.reference10 reference10,
          xgi.reference11 reference11,
          xgi.reference12 reference12,
          xgi.reference13 reference13,
          xgi.reference14 reference14,
          xgi.reference15 reference15,
          xgi.reference16 reference16,
          xgi.reference17 reference17,
          xgi.reference18 reference18,
          xgi.reference19 reference19,
          xgi.reference20 reference20,
          xgi.reference21 reference21,
          xgi.reference22 reference22,
          xgi.reference23 reference23,
          xgi.reference24 reference24,
          xgi.reference25 reference25,
          xgi.reference26 reference26,
          xgi.reference27 reference27,
          xgi.reference28 reference28,
          xgi.reference29 reference29,
          xgi.reference30 reference30,
          xgi.je_batch_id je_batch_id,
          xgi.period_name period_name,
          xgi.je_header_id je_header_id,
          xgi.je_line_num je_line_num,
          xgi.chart_of_accounts_id chart_of_accounts_id,
          xgi.functional_currency_code functional_currency_code,
          xgi.code_combination_id code_combination_id,
          xgi.date_created_in_gl date_created_in_gl,
          xgi.warning_code warning_code,
          xgi.status_description status_description,
          xgi.stat_amount stat_amount,
          xgi.GROUP_ID GROUP_ID,
          xgi.request_id request_id,
          xgi.subledger_doc_sequence_id subledger_doc_sequence_id,
          xgi.subledger_doc_sequence_value subledger_doc_sequence_value,
          xgi.attribute1 attribute1,
          xgi.attribute2 attribute2,
          xgi.gl_sl_link_id gl_sl_link_id,
          xgi.gl_sl_link_table gl_sl_link_table,
          xgi.attribute3 attribute3,
          xgi.attribute4 attribute4,
          xgi.attribute5 attribute5,
          xgi.attribute6 attribute6,
          xgi.attribute7 attribute7,
          xgi.attribute8 attribute8,
          xgi.attribute9 attribute9,
          xgi.attribute10 attribute10,
          xgi.attribute11 attribute11,
          xgi.attribute12 attribute12,
          xgi.attribute13 attribute13,
          xgi.attribute14 attribute14,
          xgi.attribute15 attribute15,
          xgi.attribute16 attribute16,
          xgi.attribute17 attribute17,
          xgi.attribute18 attribute18,
          xgi.attribute19 attribute19,
          xgi.attribute20 attribute20,
          xgi.context context,
          xgi.context2 context2,
          xgi.invoice_date invoice_date,
          xgi.tax_code tax_code,
          xgi.invoice_identifier invoice_identifier,
          xgi.invoice_amount invoice_amount,
          xgi.context3 context3,
          xgi.ussgl_transaction_code ussgl_transaction_code,
          xgi.descr_flex_error_message descr_flex_error_message,
          xgi.jgzz_recon_ref jgzz_recon_ref,
          xgi.reference_date reference_date,
          xgi.set_of_books_id set_of_books_id,
          xgi.balancing_segment_value balancing_segment_value,
          xgi.management_segment_value management_segment_value,
          xgi.funds_reserved_flag funds_reserved_flag,
          xgi.code_combination_id_interim code_combination_id_interim,
          xgi.segment1 empresa,
          xgi.segment2 interco,
          xgi.segment3 estruc_neg_serv,
          xgi.segment4 cc,
          xgi.segment5 cuenta
     FROM gl_interface xgi
    WHERE     1 = 1
          AND xgi.user_je_source_name LIKE '%mina de Empleados';

