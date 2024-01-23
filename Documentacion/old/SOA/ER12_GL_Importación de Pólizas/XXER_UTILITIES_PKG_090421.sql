create or replace PACKAGE             XXER_UTILITIES_PKG AS 

  V_ERROR_LOCATION VARCHAR2(500)  := NULL;
  V_ERROR_MSG      VARCHAR2(3200) := NULL;


/**
 * Funcion utilizado para obtener pólizas viajado gl y actulizar batch
 *
 * @param P_SOURCE Información de source para la consulta
 * @param P_STATUS Información del estatus para la consulta
 * @param P_BATCH_ID Información del batch para la consulta
 * @param P_JOURNALS regresa objeto TYPE de pólizas
 */

 FUNCTION MERGE_JOURNALS_TMS(P_SOURCE IN VARCHAR2,
                       P_STATUS IN VARCHAR2,
                       P_BATCH_ID IN VARCHAR2
                     ) RETURN XXER_GL_INTERFACE_TYPE_T;

/**
 * Procedire utilizado para actulizar batch de gl
 *
 * @param P_SOURCE Información de source para la consulta
 * @param P_STATUS Información del estatus para la consulta
 * @param P_BATCH_ID Información del batch para la consulta
 * @param P_JOURNALS regresa objeto TYPE de pólizas
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

 PROCEDURE UPDATE_JOURNALS_TMS(P_SOURCE IN VARCHAR2,
                       P_STATUS IN VARCHAR2,
                       P_BATCH_ID IN VARCHAR2,
                       P_ERROR       OUT NUMBER,
                       P_ERROR_DESC  OUT VARCHAR2);                                           

END XXER_UTILITIES_PKG;

create or replace PACKAGE BODY            xxer_utilities_pkg AS

 /**
 * Funcion utilizado para obtener pólizas viajado gl y actulizar batch_id
 *
 * @param P_SOURCE Información de source para la consulta
 * @param P_STATUS Información del estatus para la consulta
 * @param P_BATCH_ID Información del batch para la consulta
 * @param P_JOURNALS regresa objeto TYPE de pólizas
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

    FUNCTION merge_journals_tms (
        p_source     IN VARCHAR2,
        p_status     IN VARCHAR2,
        p_batch_id   IN VARCHAR2
    ) RETURN xxer_gl_interface_type_t AS

        t_gl_interface   xxer_gl_interface_type_t := xxer_gl_interface_type_t ();
        CURSOR c_gl_journals IS SELECT
            reference4,
            status,
            ledger_id,
            accounting_date,
            user_je_source_name,
            user_je_category_name,
            currency_code,
            date_created,
            actual_flag,
            segment1,
            segment2,
            segment3,
            segment4,
            segment5,
            segment6,
            segment7,
            segment8,
            segment9,
            segment10,
            segment11,
            segment12,
            segment13,
            segment14,
            segment15,
            segment16,
            segment17,
            segment18,
            segment19,
            segment20,
            segment21,
            segment22,
            segment23,
            segment24,
            segment25,
            segment26,
            segment27,
            segment28,
            segment29,
            segment30,
            SUM(entered_dr) entered_dr,
            SUM(entered_cr) entered_cr,
            SUM(accounted_dr) accounted_dr,
            SUM(accounted_cr) accounted_cr,
            user_currency_conversion_type,
            currency_conversion_date,
            currency_conversion_rate,
            average_journal_flag,
            group_id
                                FROM
            --xxer_gl_interface_v
            XXER_GL_INTERFACE
                                WHERE
            status = p_status
            AND je_batch_id = p_batch_id
            AND user_je_source_name = p_source
                                GROUP BY
            reference4,
            status,
            ledger_id,
            accounting_date,
            user_je_source_name,
            user_je_category_name,
            currency_code,
            date_created,
            actual_flag,
            segment1,
            segment2,
            segment3,
            segment4,
            segment5,
            segment6,
            segment7,
            segment8,
            segment9,
            segment10,
            segment11,
            segment12,
            segment13,
            segment14,
            segment15,
            segment16,
            segment17,
            segment18,
            segment19,
            segment20,
            segment21,
            segment22,
            segment23,
            segment24,
            segment25,
            segment26,
            segment27,
            segment28,
            segment29,
            segment30,
            user_currency_conversion_type,
            currency_conversion_date,
            currency_conversion_rate,
            average_journal_flag,
            group_id
        ORDER BY
            reference4;

    BEGIN
        FOR c_gl IN c_gl_journals LOOP
            t_gl_interface.extend;
            t_gl_interface(t_gl_interface.last) := xxer_gl_interface_type(c_gl.status,c_gl.ledger_id,c_gl.accounting_date,c_gl.currency_code,c_gl
.date_created,NULL,c_gl.actual_flag,c_gl.user_je_category_name,c_gl.user_je_source_name,c_gl.currency_conversion_date,NULL,NULL,c_gl
.user_currency_conversion_type,c_gl.currency_conversion_rate,c_gl.average_journal_flag,NULL,c_gl.segment1,c_gl.segment2,c_gl.segment3
,c_gl.segment4,c_gl.segment5,c_gl.segment6,c_gl.segment7,c_gl.segment8,c_gl.segment9,c_gl.segment10,c_gl.segment11,c_gl.segment12
,c_gl.segment13,c_gl.segment14,c_gl.segment15,c_gl.segment16,c_gl.segment17,c_gl.segment18,c_gl.segment19,c_gl.segment20,c_gl.segment21
,c_gl.segment22,c_gl.segment23,c_gl.segment24,c_gl.segment25,c_gl.segment26,c_gl.segment27,c_gl.segment28,c_gl.segment29,c_gl.segment30
,c_gl.entered_dr,c_gl.entered_cr,c_gl.accounted_dr,c_gl.accounted_cr,NULL,NULL,NULL,NULL,c_gl.reference4,NULL,NULL,NULL,NULL,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,c_gl.group_id,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

        END LOOP;

        RETURN t_gl_interface;
    EXCEPTION
        WHEN OTHERS THEN
            RETURN t_gl_interface;
            dbms_output.put_line('Error en:' || sqlerrm);
    END merge_journals_tms;
	
	/**
 * Procedire utilizado para actulizar batch de gl
 *
 * @param P_SOURCE Información de source para la consulta
 * @param P_STATUS Información del estatus para la consulta
 * @param P_BATCH_ID Información del batch para la consulta
 * @param P_JOURNALS regresa objeto TYPE de pólizas
 * @param P_ERROR código del error
 * @param P_ERROR_DESC Mensaje del error
 */

    PROCEDURE update_journals_tms (
        p_source       IN VARCHAR2,
        p_status       IN VARCHAR2,
        p_batch_id     IN VARCHAR2,
        p_error        OUT NUMBER,
        p_error_desc   OUT VARCHAR2
    )
        AS
    BEGIN
        v_error_location := 'Llama al PROCEDIMIENTO MERGE_JOURNALS';
        UPDATE xxer_gl_interface
        SET
            je_batch_id = p_batch_id
        WHERE
            je_batch_id IS NULL
            AND status = p_status
            AND user_je_source_name = p_source;

    EXCEPTION
        WHEN OTHERS THEN
            v_error_msg := substr(sqlerrm,1,250);
            p_error := 1;
            p_error_desc := substr('ERROR EN XXER_UTILITIES_PKG.MERGE_JOURNALS'
                                     || v_error_location
                                     || ' ** '
                                     || v_error_msg,1,400);

    END update_journals_tms;
	
	END xxer_utilities_pkg;