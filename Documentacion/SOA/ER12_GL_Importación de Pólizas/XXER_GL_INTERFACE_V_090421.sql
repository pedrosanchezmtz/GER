
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PXERINTUSER"."XXER_GL_INTERFACE_V" ("STATUS", "LEDGER_ID", "ACCOUNTING_DATE", "CURRENCY_CODE", "DATE_CREATED", "CREATED_BY", "ACTUAL_FLAG", "USER_JE_CATEGORY_NAME", "USER_JE_SOURCE_NAME", "CURRENCY_CONVERSION_DATE", "ENCUMBRANCE_TYPE_ID", "BUDGET_VERSION_ID", "USER_CURRENCY_CONVERSION_TYPE", "CURRENCY_CONVERSION_RATE", "AVERAGE_JOURNAL_FLAG", "ORIGINATING_BAL_SEG_VALUE", "SEGMENT1", "SEGMENT2", "SEGMENT3", "SEGMENT4", "SEGMENT5", "SEGMENT6", "SEGMENT7", "SEGMENT8", "SEGMENT9", "SEGMENT10", "SEGMENT11", "SEGMENT12", "SEGMENT13", "SEGMENT14", "SEGMENT15", "SEGMENT16", "SEGMENT17", "SEGMENT18", "SEGMENT19", "SEGMENT20", "SEGMENT21", "SEGMENT22", "SEGMENT23", "SEGMENT24", "SEGMENT25", "SEGMENT26", "SEGMENT27", "SEGMENT28", "SEGMENT29", "SEGMENT30", "ENTERED_DR", "ENTERED_CR", "ACCOUNTED_DR", "ACCOUNTED_CR", "TRANSACTION_DATE", "REFERENCE1", "REFERENCE2", "REFERENCE3", "REFERENCE4", "REFERENCE5", "REFERENCE6", "REFERENCE7", "REFERENCE8", "REFERENCE9", "REFERENCE10", "REFERENCE11", "REFERENCE12", "REFERENCE13", "REFERENCE14", "REFERENCE15", "REFERENCE16", "REFERENCE17", "REFERENCE18", "REFERENCE19", "REFERENCE20", "REFERENCE21", "REFERENCE22", "REFERENCE23", "REFERENCE24", "REFERENCE25", "REFERENCE26", "REFERENCE27", "REFERENCE28", "REFERENCE29", "REFERENCE30", "JE_BATCH_ID", "PERIOD_NAME", "JE_HEADER_ID", "JE_LINE_NUM", "CHART_OF_ACCOUNTS_ID", "FUNCTIONAL_CURRENCY_CODE", "CODE_COMBINATION_ID", "DATE_CREATED_IN_GL", "WARNING_CODE", "STATUS_DESCRIPTION", "STAT_AMOUNT", "GROUP_ID", "REQUEST_ID", "SUBLEDGER_DOC_SEQUENCE_ID", "SUBLEDGER_DOC_SEQUENCE_VALUE", "ATTRIBUTE1", "ATTRIBUTE2", "GL_SL_LINK_ID", "GL_SL_LINK_TABLE", "ATTRIBUTE3", "ATTRIBUTE4", "ATTRIBUTE5", "ATTRIBUTE6", "ATTRIBUTE7", "ATTRIBUTE8", "ATTRIBUTE9", "ATTRIBUTE10", "ATTRIBUTE11", "ATTRIBUTE12", "ATTRIBUTE13", "ATTRIBUTE14", "ATTRIBUTE15", "ATTRIBUTE16", "ATTRIBUTE17", "ATTRIBUTE18", "ATTRIBUTE19", "ATTRIBUTE20", "CONTEXT", "CONTEXT2", "INVOICE_DATE", "TAX_CODE", "INVOICE_IDENTIFIER", "INVOICE_AMOUNT", "CONTEXT3", "USSGL_TRANSACTION_CODE", "DESCR_FLEX_ERROR_MESSAGE", "JGZZ_RECON_REF", "REFERENCE_DATE", "SET_OF_BOOKS_ID", "BALANCING_SEGMENT_VALUE", "MANAGEMENT_SEGMENT_VALUE", "FUNDS_RESERVED_FLAG", "CODE_COMBINATION_ID_INTERIM") AS 
  SELECT
    STATUS,
    NULL "LEDGER_ID",
    ACCOUNTING_DATE,
    CURRENCY_CODE,
    DATE_CREATED,
    NULL "CREATED_BY",
    ACTUAL_FLAG,
    USER_JE_CATEGORY_NAME,
    USER_JE_SOURCE_NAME,
    NULL "CURRENCY_CONVERSION_DATE",
    NULL "ENCUMBRANCE_TYPE_ID",
    NULL "BUDGET_VERSION_ID",
    NULL "USER_CURRENCY_CONVERSION_TYPE",
    NULL "CURRENCY_CONVERSION_RATE",
    NULL "AVERAGE_JOURNAL_FLAG",
    NULL "ORIGINATING_BAL_SEG_VALUE",
    SEGMENT1,
    SEGMENT2,
    SEGMENT3,
    SEGMENT4,
    SEGMENT5,
    NULL "SEGMENT6",
    NULL "SEGMENT7",
    NULL "SEGMENT8",
    NULL "SEGMENT9",
    NULL "SEGMENT10",
    NULL "SEGMENT11",
    NULL "SEGMENT12",
    NULL "SEGMENT13",
    NULL "SEGMENT14",
    NULL "SEGMENT15",
    NULL "SEGMENT16",
    NULL "SEGMENT17",
    NULL "SEGMENT18",
    NULL "SEGMENT19",
    NULL "SEGMENT20",
    NULL "SEGMENT21",
    NULL "SEGMENT22",
    NULL "SEGMENT23",
    NULL "SEGMENT24",
    NULL "SEGMENT25",
    NULL "SEGMENT26",
    NULL "SEGMENT27",
    NULL "SEGMENT28",
    NULL "SEGMENT29",
    NULL "SEGMENT30",
    SUM(ENTERED_DR) "ENTERED_DR",
    SUM (ENTERED_CR) "ENTERED_CR",
    SUM(ACCOUNTED_DR) "ACCOUNTED_DR",
    SUM(ACCOUNTED_CR) "ACCOUNTED_CR",
    NULL "TRANSACTION_DATE",
    NULL "REFERENCE1",
    NULL "REFERENCE2",
    NULL "REFERENCE3",
    REFERENCE4,
    NULL "REFERENCE5",
    NULL "REFERENCE6",
    NULL "REFERENCE7",
    NULL "REFERENCE8",
    NULL "REFERENCE9",
    NULL "REFERENCE10",
    NULL "REFERENCE11",
    NULL "REFERENCE12",
    NULL "REFERENCE13",
    NULL "REFERENCE14",
    NULL "REFERENCE15",
    NULL "REFERENCE16",
    NULL "REFERENCE17",
    NULL "REFERENCE18",
    NULL "REFERENCE19",
    NULL "REFERENCE20",
    NULL "REFERENCE21",
    NULL "REFERENCE22",
    NULL "REFERENCE23",
    NULL "REFERENCE24",
    NULL "REFERENCE25",
    NULL "REFERENCE26",
    NULL "REFERENCE27",
    NULL "REFERENCE28",
    NULL "REFERENCE29",
    NULL "REFERENCE30",
    NULL "JE_BATCH_ID",
    NULL "PERIOD_NAME",
    NULL "JE_HEADER_ID",
    NULL "JE_LINE_NUM",
    NULL "CHART_OF_ACCOUNTS_ID",
    NULL "FUNCTIONAL_CURRENCY_CODE",
    NULL "CODE_COMBINATION_ID",
    NULL "DATE_CREATED_IN_GL",
    NULL "WARNING_CODE",
    NULL "STATUS_DESCRIPTION",
    NULL "STAT_AMOUNT",
    GROUP_ID,
    NULL "REQUEST_ID",
    NULL "SUBLEDGER_DOC_SEQUENCE_ID",
    NULL "SUBLEDGER_DOC_SEQUENCE_VALUE",
    NULL "ATTRIBUTE1",
    NULL "ATTRIBUTE2",
    NULL "GL_SL_LINK_ID",
    NULL "GL_SL_LINK_TABLE",
    NULL "ATTRIBUTE3",
    NULL "ATTRIBUTE4",
    NULL "ATTRIBUTE5",
    NULL "ATTRIBUTE6",
    NULL "ATTRIBUTE7",
    NULL "ATTRIBUTE8",
    NULL "ATTRIBUTE9",
    NULL "ATTRIBUTE10",
    NULL "ATTRIBUTE11",
    NULL "ATTRIBUTE12",
    NULL "ATTRIBUTE13",
    NULL "ATTRIBUTE14",
    NULL "ATTRIBUTE15",
    NULL "ATTRIBUTE16",
    NULL "ATTRIBUTE17",
    NULL "ATTRIBUTE18",
    NULL "ATTRIBUTE19",
    NULL "ATTRIBUTE20",
    NULL "CONTEXT",
    NULL "CONTEXT2",
    NULL "INVOICE_DATE",
    NULL "TAX_CODE",
    NULL "INVOICE_IDENTIFIER",
    NULL "INVOICE_AMOUNT",
    NULL "CONTEXT3",
    NULL "USSGL_TRANSACTION_CODE",
    NULL "DESCR_FLEX_ERROR_MESSAGE",
    NULL "JGZZ_RECON_REF",
    NULL "REFERENCE_DATE",
    NULL "SET_OF_BOOKS_ID",
    NULL "BALANCING_SEGMENT_VALUE",
    NULL "MANAGEMENT_SEGMENT_VALUE",
    NULL "FUNDS_RESERVED_FLAG",
    NULL "CODE_COMBINATION_ID_INTERIM"
FROM XXER_GL_INTERFACE
WHERE JE_BATCH_ID IS NULL AND STATUS = 'NEW' AND TRUNC(ACCOUNTING_DATE) >= '01/01/2020'
GROUP BY STATUS , ACCOUNTING_DATE , USER_JE_SOURCE_NAME , USER_JE_CATEGORY_NAME , CURRENCY_CODE , DATE_CREATED , ACTUAL_FLAG , SEGMENT1 , SEGMENT2 , SEGMENT3 , SEGMENT4 , SEGMENT5 , REFERENCE4 , GROUP_ID;

