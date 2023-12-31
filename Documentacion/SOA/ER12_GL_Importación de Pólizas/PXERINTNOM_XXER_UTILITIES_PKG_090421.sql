create or replace PACKAGE XXER_UTILITIES_PKG AS 

  V_ERROR_LOCATION VARCHAR2(500)  := NULL;
  V_ERROR_MSG      VARCHAR2(3200) := NULL;

 PROCEDURE MERGE_JOURNALS_NE(P_SOURCE IN VARCHAR2,
                       P_STATUS IN VARCHAR2,
                       P_BATCH_ID IN VARCHAR2,					   
                       P_JOURNALS OUT XXER_GL_INTERFACE_TYPE_T,
                       P_ERROR       OUT NUMBER,
                       P_ERROR_DESC  OUT VARCHAR2);

  PROCEDURE MERGE_JOURNALS(P_SOURCE IN VARCHAR2,
                       P_JOURNALS OUT VARCHAR2,
                       P_ERROR       OUT NUMBER,
                       P_ERROR_DESC  OUT VARCHAR2);                     
END XXER_UTILITIES_PKG;

create or replace PACKAGE BODY XXER_UTILITIES_PKG AS

  /**
 * Procedimiento utilizado para obtener pólizas Nomina de empleados gl y actulizar batch_id
 *
 * @param P_SOURCE Información de source para la consulta
 * @param P_STATUS Información del estatus para la consulta
 * @param P_BATCH_ID Información del batch para la consulta
 * @param P_JOURNALS regresa objeto TYPE de pólizas
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

 PROCEDURE MERGE_JOURNALS_NE(P_SOURCE IN VARCHAR2,
                       P_STATUS IN VARCHAR2,
                       P_BATCH_ID IN VARCHAR2,					   
                       P_JOURNALS OUT XXER_GL_INTERFACE_TYPE_T,
                       P_ERROR       OUT NUMBER,
                       P_ERROR_DESC  OUT VARCHAR2) AS

    C_GL_INTERFACE XXER_GL_INTERFACE_TYPE_T;

  BEGIN
    V_ERROR_LOCATION := 'Llama al PROCEDIMIENTO MERGE_JOURNALS'; 


  UPDATE GL_INTERFACE 
	SET JE_BATCH_ID = P_BATCH_ID  
	WHERE JE_BATCH_ID IS NULL
	AND STATUS=P_STATUS
	AND USER_JE_SOURCE_NAME=P_SOURCE 
	;	

  begin
		SELECT XXER_GL_INTERFACE_TYPE(STATUS ,
    LEDGER_ID,
    ACCOUNTING_DATE,
    CURRENCY_CODE,
    DATE_CREATED ,
    CREATED_BY ,
    ACTUAL_FLAG,
    USER_JE_CATEGORY_NAME,
    USER_JE_SOURCE_NAME,
    CURRENCY_CONVERSION_DATE ,
    ENCUMBRANCE_TYPE_ID,
    BUDGET_VERSION_ID,
    USER_CURRENCY_CONVERSION_TYPE,
    CURRENCY_CONVERSION_RATE ,
    AVERAGE_JOURNAL_FLAG ,
    ORIGINATING_BAL_SEG_VALUE,
    SEGMENT1 ,
    SEGMENT2 ,
    SEGMENT3 ,
    SEGMENT4 ,
    SEGMENT5 ,
    SEGMENT6 ,
    SEGMENT7 ,
    SEGMENT8 ,
    SEGMENT9 ,
    SEGMENT10,
    SEGMENT11,
    SEGMENT12,
    SEGMENT13,
    SEGMENT14,
    SEGMENT15,
    SEGMENT16,
    SEGMENT17,
    SEGMENT18,
    SEGMENT19,
    SEGMENT20,
    SEGMENT21,
    SEGMENT22,
    SEGMENT23,
    SEGMENT24,
    SEGMENT25,
    SEGMENT26,
    SEGMENT27,
    SEGMENT28,
    SEGMENT29,
    SEGMENT30,
    ENTERED_DR ,
    ENTERED_CR ,
    ACCOUNTED_DR ,
    ACCOUNTED_CR ,
    TRANSACTION_DATE ,
    REFERENCE1 ,
    REFERENCE2 ,
    REFERENCE3 ,
    REFERENCE4 ,
    REFERENCE5 ,
    REFERENCE6 ,
    REFERENCE7 ,
    REFERENCE8 ,
    REFERENCE9 ,
    REFERENCE10,
    REFERENCE11,
    REFERENCE12,
    REFERENCE13,
    REFERENCE14,
    REFERENCE15,
    REFERENCE16,
    REFERENCE17,
    REFERENCE18,
    REFERENCE19,
    REFERENCE20,
    REFERENCE21,
    REFERENCE22,
    REFERENCE23,
    REFERENCE24,
    REFERENCE25,
    REFERENCE26,
    REFERENCE27,
    REFERENCE28,
    REFERENCE29,
    REFERENCE30,
    JE_BATCH_ID,
    PERIOD_NAME,
    JE_HEADER_ID ,
    JE_LINE_NUM,
    CHART_OF_ACCOUNTS_ID ,
    FUNCTIONAL_CURRENCY_CODE ,
    CODE_COMBINATION_ID,
    DATE_CREATED_IN_GL ,
    WARNING_CODE ,
    STATUS_DESCRIPTION ,
    STAT_AMOUNT,
    GROUP_ID ,
    REQUEST_ID ,
    SUBLEDGER_DOC_SEQUENCE_ID,
    SUBLEDGER_DOC_SEQUENCE_VALUE ,
    ATTRIBUTE1 ,
    ATTRIBUTE2 ,
    GL_SL_LINK_ID,
    GL_SL_LINK_TABLE ,
    ATTRIBUTE3 ,
    ATTRIBUTE4 ,
    ATTRIBUTE5 ,
    ATTRIBUTE6 ,
    ATTRIBUTE7 ,
    ATTRIBUTE8 ,
    ATTRIBUTE9 ,
    ATTRIBUTE10,
    ATTRIBUTE11,
    ATTRIBUTE12,
    ATTRIBUTE13,
    ATTRIBUTE14,
    ATTRIBUTE15,
    ATTRIBUTE16,
    ATTRIBUTE17,
    ATTRIBUTE18,
    ATTRIBUTE19,
    ATTRIBUTE20,
    CONTEXT,
    CONTEXT2 ,
    INVOICE_DATE ,
    TAX_CODE ,
    INVOICE_IDENTIFIER ,
    INVOICE_AMOUNT ,
    CONTEXT3 ,
    USSGL_TRANSACTION_CODE ,
    DESCR_FLEX_ERROR_MESSAGE ,
    JGZZ_RECON_REF ,
    REFERENCE_DATE ,
    SET_OF_BOOKS_ID,
    BALANCING_SEGMENT_VALUE,
    MANAGEMENT_SEGMENT_VALUE ,
    FUNDS_RESERVED_FLAG,
    CODE_COMBINATION_ID_INTERIM)
    BULK COLLECT  INTO C_GL_INTERFACE FROM XXER_GL_INTERFACE_V 
	 WHERE STATUS=P_STATUS
	 AND JE_BATCH_ID=P_BATCH_ID
	 AND USER_JE_SOURCE_NAME=P_SOURCE;
   end;     
	P_JOURNALS:=C_GL_INTERFACE;
  EXCEPTION
    WHEN OTHERS THEN
    V_ERROR_MSG := SUBSTR(SQLERRM, 1, 250);
    P_ERROR := 1;
    P_ERROR_DESC := SUBSTR('ERROR EN XXER_UTILITIES_PKG.MERGE_JOURNALS' || V_ERROR_LOCATION || ' ** ' || V_ERROR_MSG,1,400); 

  END MERGE_JOURNALS_NE;  

   PROCEDURE MERGE_JOURNALS(P_SOURCE IN VARCHAR2,
                       P_JOURNALS OUT VARCHAR2,
                       P_ERROR       OUT NUMBER,
                       P_ERROR_DESC  OUT VARCHAR2)
                       as

    v_prueba VARCHAR2(100);                   
    begin



select distinct(user_je_source_name) into v_prueba from gl_interface
where user_je_source_name=P_SOURCE;

    P_JOURNALS:=v_prueba;
  EXCEPTION
    WHEN OTHERS THEN
    V_ERROR_MSG := SUBSTR(SQLERRM, 1, 250);
    P_ERROR := 1;
    P_ERROR_DESC := SUBSTR('ERROR EN XXER_UTILITIES_PKG.MERGE_JOURNALS' || V_ERROR_MSG,1,400); 
  END MERGE_JOURNALS;  

END XXER_UTILITIES_PKG;