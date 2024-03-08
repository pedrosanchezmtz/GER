--------------------------------------------------------
-- Archivo creado  - jueves-marzo-07-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Type XXER_AR_GET_INV_TB_TYP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_GET_INV_TB_TYP" 
IS
  TABLE OF XXER_AR_GET_INV_TYP
;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_PROC_REC_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_PROC_REC_TTYPE" 
AS TABLE OF XXER_AR_PROCESSED_RECEIPT_TYPE;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_PROCESSED_RECEIPT_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_PROCESSED_RECEIPT_TYPE" AS OBJECT 
( 
       TABLA_PUENTE_ID     NUMBER   (18) ,
       RECEIPT_ID          NUMBER   (18) ,
       ESTATUS             VARCHAR2 (1)  ,
       ErrorDescripcion    VARCHAR2 (500)
)

/
--------------------------------------------------------
--  DDL for Type XXER_AR_RECEIPT_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_RECEIPT_TYPE" AS OBJECT 
( 
       RFC                 VARCHAR2 (20 CHAR) ,
       AMOUNT              NUMBER ,
       SITE_USE_ID         NUMBER   (18) ,
       DEPOSIT_DATE        DATE ,
       CUST_ACCOUNT_ID     NUMBER   (18) ,  /*Customer Id para obtener Customer TRX id*/
       RECEIPT_DATE        DATE,
       RECEIPT_METHOD_ID   VARCHAR2 (30 CHAR) ,
       RECEIPT_NUMBER      VARCHAR2 (50 CHAR) ,/*los recibos pueden tener hasta 50 caracteres*/
       CASH_RECEIPT_ID     NUMBER   (18) ,
         ORGANIZATION_ID     NUMBER   (18),    /*organization Id para obtener Customer TRX id*/
       TABLA_PUENTE_ID     NUMBER   (18)
);

/
--------------------------------------------------------
--  DDL for Type XXER_INVOICES_TO_UPDATE_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_INVOICES_TO_UPDATE_TTYPE" 
AS TABLE OF XXER_INVOICES_TO_UPDATE_TYPE
;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_RECEIPT_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_RECEIPT_TTYPE" 
AS TABLE OF XXER_AR_RECEIPT_TYPE;

/
--------------------------------------------------------
--  DDL for Type XXER_INVOICES_TO_UPDATE_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_INVOICES_TO_UPDATE_TYPE" AS OBJECT 
(
       TRX_NUMBER VARCHAR2 (100 CHAR),
       STATUS VARCHAR2(10)           
);

/
--------------------------------------------------------
--  DDL for Type XXER_INVOICE_LOAD_STATUS_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_INVOICE_LOAD_STATUS_TTYPE" 
IS
  TABLE OF XXER_INVOICE_LOAD_STATUS_TYPE
;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_GET_INV_TYP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_GET_INV_TYP" 
  AS
  OBJECT (
  RFC VARCHAR2(20),
  Business_Unit_Name VARCHAR2(250),
  Trans_Batch_Source_Name VARCHAR2(250),
  Transaction_Type_Name VARCHAR2(50),
  Payment_Terms VARCHAR2(50),
  Transaction_Date DATE,
  Accounting_Date DATE,
  Transaction_Number VARCHAR2(50),
  Orig_Sys_Bill_to_Cst_Ref VARCHAR2(250),
  Orig_Sys_Bill_to_Cst_Ad_Ref VARCHAR2(100),
  Orig_Sys_Bill_to_Cst_Co_Ref VARCHAR2(100),
  Orig_Sys_Ship_to_Cst_Ref VARCHAR2(100),
  Orig_Sys_Ship_to_Cst_Ad_Ref VARCHAR2(100),
  Orig_Sys_Ship_to_Cst_Co_Ref VARCHAR2(100),
  Orig_Sys_Shp_to_Cst_Acc_Ref VARCHAR2(100),
  Ori_Sys_Shp_to_Cst_Ac_Ad_Ref VARCHAR2(100),
  Ori_Sys_Shp_to_Cst_Ac_Co_Rf VARCHAR2(100),
  Orig_Sys_Sold_to_Cst_Ref VARCHAR2(100),
  Orig_Sys_Sold_to_Cst_Acc_Rf VARCHAR2(100),
  Bill_to_Cust_Account_Nmbr NUMBER,
  Bill_to_Customer_Site_Nmbr NUMBER,
  Bill_to_Contact_Party_Nmbr VARCHAR2(100),
  Ship_to_Cust_Account_Nmbr VARCHAR2(100),
  Ship_to_Customer_Site_Nmbr VARCHAR2(100),
  Ship_to_Contact_Party_Nmbr VARCHAR2(100),
  Sold_to_Cust_Account_Nmbr VARCHAR2(100),
  Transaction_Line_Type VARCHAR2(100),
  Transaction_Line_Desc VARCHAR2(250),
  Currency_Code VARCHAR2(10),
  Currency_Conversion_Type VARCHAR2(50),
  Currency_Conversion_Date DATE,
  Currency_Conversion_Rate NUMBER,
  Transaction_Line_Amount NUMBER,
  Transaction_Line_Quantity NUMBER,
  Customer_Ordered_Quantity VARCHAR2(100),
  Unit_Selling_Price NUMBER,
  Unit_Standard_Price NUMBER,
  Line_Trans_Flxfld_Context VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_1 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_2 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_3 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_4 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_5 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_6 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_7 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_8 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_9 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_10 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_11 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_12 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_13 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_14 VARCHAR2(100),
  Line_Trans_Flxfld_Sgmnt_15 VARCHAR2(100),
  Primary_Salesperson_Number NUMBER,
  Tax_Classification_Code VARCHAR2(50),
  Legal_Entity_Identifier VARCHAR2(100),
  Accd_Amount_in_Led_Crrncy VARCHAR2(100),
  Sales_Order_Number VARCHAR2(100),
  Sales_Order_Date VARCHAR2(100),
  Actual_Ship_Date VARCHAR2(100),
  Warehouse_Code VARCHAR2(100),
  Unit_of_Measure_Code VARCHAR2(50),
  Unit_of_Measure_Name VARCHAR2(50),
  Invoicing_Rule_Name VARCHAR2(100), 
  Reve_Scheduling_Rule_Name VARCHAR2(100),
  Number_of_Revenue_Periods VARCHAR2(100),
  Rev_Schdlng_Rule_Start_Date VARCHAR2(100),
  Rev_Schdlng_Rule_End_Date VARCHAR2(100),
  Reason_Code_Meaning VARCHAR2(100),
  Last_Period_to_Credit VARCHAR2(100),
  Trans_Biss_Category_Code VARCHAR2(100),
  Prod_Fisc_Classifictn_Code VARCHAR2(100),
  Product_Category_Code VARCHAR2(100),
  Product_Type VARCHAR2(100),
  Line_Intended_Use_Code VARCHAR2(100),
  Assessable_Value VARCHAR2(100),
  Document_Sub_Type VARCHAR2(100),
  Default_Taxation_Country VARCHAR2(100),
  User_Defnd_Fisc_Classifictn VARCHAR2(100),
  Tax_Invoice_Number VARCHAR2(100),
  Tax_Invoice_Date VARCHAR2(100),
  Tax_Regime_Code VARCHAR2(100),
  Tax VARCHAR2(100),
  Tax_Status_Code VARCHAR2(100),
  Tax_Rate_Code VARCHAR2(100),
  Tax_Jurisdiction_Code VARCHAR2(100),
  First_Party_Registratn_Nmbr VARCHAR2(100),
  Third_Party_Registratn_Nmbr VARCHAR2(100),
  Final_Discharge_Location VARCHAR2(100),
  Taxable_Amount VARCHAR2(100),
  Taxable_Flag VARCHAR2(100),
  Tax_Exemption_Flag VARCHAR2(100),
  Tax_Exemption_Reason_Code VARCHAR2(100),
  Tax_Exemptn_Rson_Code_Mng VARCHAR2(100),
  Tax_Exemptn_Certifict_Nmbr VARCHAR2(100),
  Line_Amount_Inclds_Tax_Flag VARCHAR2(100),
  Tax_Precedence VARCHAR2(100),
  Cr_Mt_2B_Us_4_Ls_Wt_Rv_Sc_Rs VARCHAR2(100),
  Cr_Mt_2B_Us_4_Tr_Wt_Sp_Py_Tr VARCHAR2(100),
  Reason_Code VARCHAR2(100),
  Tax_Rate VARCHAR2(100),
  FOB_Point VARCHAR2(100),
  Carrier VARCHAR2(100),
  Shipping_Reference VARCHAR2(100),
  Sales_Order_Line_Number VARCHAR2(100),
  Sales_Order_Source VARCHAR2(100),
  Sales_Order_Revision_Number VARCHAR2(100),
  Purchase_Order_Number VARCHAR2(100),
  Purchase_Order_Revsn_Nmbr VARCHAR2(100),
  Purchase_Order_Date VARCHAR2(100),
  Agreement_Name VARCHAR2(100),
  Memo_Line_Name VARCHAR2(250),
  Document_Number VARCHAR2(100),
  Original_System_Batch_Name VARCHAR2(100),
  Link_to_Trans_Flxfld_Cntxt VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_1 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_2 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_3 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_4 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_5 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_6 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_7 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_8 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_9 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_10 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_11 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_12 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_13 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_14 VARCHAR2(100),
  Lnk_to_Trans_Flxfld_Sgmnt_15 VARCHAR2(100),
  Ref_Trans_Flxfld_Cntxt VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_1 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_2 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_3 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_4 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_5 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_6 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_7 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_8 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_9 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_10 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_11 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_12 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_13 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_14 VARCHAR2(100),
  Ref_Trans_Flxfld_Sgmnt_15 VARCHAR2(100),
  Lnk_To_Parent_Line_Context VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_1 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_2 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_3 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_4 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_5 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_6 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_7 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_8 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_9 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_10 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_11 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_12 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_13 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_14 VARCHAR2(100),
  Lnk_To_Parent_Line_Sgmnt_15 VARCHAR2(100),
  Receipt_Method_Name VARCHAR2(100),
  Printing_Option VARCHAR2(100),
  Related_Batch_Source_Name VARCHAR2(100),
  Related_Transaction_Number VARCHAR2(100),
  Inventory_Item_Number VARCHAR2(100),
  Inventory_Item_Segment_2 VARCHAR2(100),
  Inventory_Item_Segment_3 VARCHAR2(100),
  Inventory_Item_Segment_4 VARCHAR2(100),
  Inventory_Item_Segment_5 VARCHAR2(100),
  Inventory_Item_Segment_6 VARCHAR2(100),
  Inventory_Item_Segment_7 VARCHAR2(100),
  Inventory_Item_Segment_8 VARCHAR2(100),
  Inventory_Item_Segment_9 VARCHAR2(100),
  Inventory_Item_Segment_10 VARCHAR2(100),
  Inventory_Item_Segment_11 VARCHAR2(100),
  Inventory_Item_Segment_12 VARCHAR2(100),
  Inventory_Item_Segment_13 VARCHAR2(100),
  Inventory_Item_Segment_14 VARCHAR2(100),
  Inventory_Item_Segment_15 VARCHAR2(100),
  Inventory_Item_Segment_16 VARCHAR2(100),
  Inventory_Item_Segment_17 VARCHAR2(100),
  Inventory_Item_Segment_18 VARCHAR2(100),
  Inventory_Item_Segment_19 VARCHAR2(100),
  Inventory_Item_Segment_20 VARCHAR2(100),
  Bill_To_Cust_Bank_Acc_Name VARCHAR2(100),
  Reset_Transaction_Date_Flag VARCHAR2(100),
  Payment_Server_Order_Number VARCHAR2(100),
  Last_Trans_on_Debit_Autztn VARCHAR2(100),
Approval_Code VARCHAR2(100),
Address_Verification_Code VARCHAR2(100),
Trans_Line_Translated_Desc VARCHAR2(100),
Consolidated_Billing_Number VARCHAR2(100),
Promised_Commitment_Amount VARCHAR2(100),
Payment_Set_Identifier VARCHAR2(100),
Original_Accounting_Date VARCHAR2(100),
Invoiced_Line_Acc_Level VARCHAR2(100),
Override_AutoAccounting_Flag VARCHAR2(100),
Historical_Flag VARCHAR2(100),
Deferral_Exclusion_Flag VARCHAR2(100),
Payment_Attributes VARCHAR2(100),
Invoice_Billing_Date VARCHAR2(100),
Invoice_Lines_Flxfld_Cntxt VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_1 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_2 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_3 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_4 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_5 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_6 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_7 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_8 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_9 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_10 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_11 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_12 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_13 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_14 VARCHAR2(100),
Invoice_Lns_Flxfld_Sgmnt_15 VARCHAR2(100),
Invoice_Trans_Flxfld_Cntxt VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_1 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_2 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_3 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_4 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_5 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_6 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_7 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_8 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_9 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_10 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_11 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_12 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_13 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_14 VARCHAR2(100),
Inv_Trans_Flxfld_Sgmnt_15 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Cntxt VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_1 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_2 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_3 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_4 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_5 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_6 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_7 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_8 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_9 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_10 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_11 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_12 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_13 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_14 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_15 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_16 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_17 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_18 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_19 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_20 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_21 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_22 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_23 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_24 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_25 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_26 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_27 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_28 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_29 VARCHAR2(100),
Rcvb_Trn_Rgn_Inf_Flxf_Sgm_30 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Attr_Cat VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_2 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_3 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_4 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_5 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_6 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_7 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_8 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_9 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_10 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_11 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_12 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_13 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_14 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_15 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_16 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_17 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_18 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_19 VARCHAR2(100),
Ln_Glb_Dsc_Flxfld_Sgmnt_1_20 VARCHAR2(100),
Comments VARCHAR2(250),
Notes_from_Source VARCHAR2(100),
Enforce_Chronlgcl_Doc_Seqng VARCHAR2(100),
ORGANIZATION_ID NUMBER
    )
;

/
--------------------------------------------------------
--  DDL for Type XXER_INVOICE_LOAD_STATUS_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_INVOICE_LOAD_STATUS_TYPE" AS OBJECT 
(
       STATUS                VARCHAR2 (20 CHAR) ,
       TRX_NUMBER         VARCHAR2 (100 CHAR) ,
       MESSAGE_TEXT           VARCHAR2 (500 CHAR) ,
       INVALID_VALUE     VARCHAR2 (500 CHAR)
    
       
)

/
--------------------------------------------------------
--  DDL for Type XXER_ERROR_MESSAGES_INV_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_ERROR_MESSAGES_INV_TTYPE" 
IS
  TABLE OF XXER_ERROR_MESSAGES_INV_TYPE
;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_RECEIPT_INVOICE_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_RECEIPT_INVOICE_TTYPE" 
AS TABLE OF XXER_AR_RECEIPT_INVOICE_TYPE;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_RECEIPT_INVOICE_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_RECEIPT_INVOICE_TYPE" AS OBJECT 
(
       RFC                VARCHAR2 (20 CHAR) ,
       PARTY_NAME         VARCHAR2 (360 CHAR) ,
       PARTY_NUMBER       VARCHAR2 (30 CHAR) ,  /*se cambia de int a string*/
       PARTY_ID           NUMBER   (18) ,
       ACCOUNT_NUMBER     VARCHAR2 (30 CHAR) , /*se cambia de int a string*/
       CUST_ACCOUNT_ID    NUMBER   (18) ,
       CUST_ACCT_SITE_ID  NUMBER   (18) ,
       PARTY_SITE_NUMBER  VARCHAR2 (30 CHAR) , /*se cambia de int a string*/
       SITE_USE_ID        NUMBER   (18) ,
       SITE_USE_CODE      VARCHAR2 (30 CHAR) ,
       PRIMARY_FLAG       VARCHAR2 (1 CHAR) ,
       LOCATION           VARCHAR2 (150 CHAR) , /*se cambia de int a string*/
       LOCATION_ID        NUMBER   (18),
       PAYMENT_TERMS      VARCHAR2 (500 CHAR),
       ORG_ID             NUMBER   (25),
       BU_NAME            VARCHAR2 (150 CHAR)
 );

/
--------------------------------------------------------
--  DDL for Type XXER_AR_PROC_APP_REC_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_PROC_APP_REC_TYPE" AS OBJECT 
( 
       RECEIPT_APPLY_ID    NUMBER   (18) ,
       ESTATUS             VARCHAR2 (1)  ,
       ErrorDescripcion    VARCHAR2 (500)
)

/
--------------------------------------------------------
--  DDL for Type XXER_COMPLEMENT_UPD_UUID_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_COMPLEMENT_UPD_UUID_TYPE" AS OBJECT 
(
       TRX_NUMBER  VARCHAR2 (50 CHAR) ,
       ORG_ID  NUMBER,
       UUID VARCHAR(150 CHAR))
;

/
--------------------------------------------------------
--  DDL for Type XXER_ERROR_MESSAGES_INV_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_ERROR_MESSAGES_INV_TYPE" AS OBJECT 
( 
       MESSAGE           VARCHAR2 (500 CHAR),
       DATA_VALUE        VARCHAR2 (250 CHAR)
       
);

/
--------------------------------------------------------
--  DDL for Type XXER_COMPLEMENT_UPD_UUID_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_COMPLEMENT_UPD_UUID_TTYPE" 
AS TABLE OF XXER_COMPLEMENT_UPD_UUID_TYPE;

--XXER_TBL_PUENTE_AUX

/
--------------------------------------------------------
--  DDL for Type XXER_AR_PROC_APP_REC_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_PROC_APP_REC_TTYPE" 
AS TABLE OF XXER_AR_PROC_APP_REC_TYPE;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_GETDATA_INVOICES_TYP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_GETDATA_INVOICES_TYP" 
AS
OBJECT (
  RFC VARCHAR2(20),
  Business_Unit_Name VARCHAR2(250),
    Transaction_Batch_Source_Name VARCHAR2(250),
    Transaction_Type_Name VARCHAR2(50),
    Payment_Terms VARCHAR2(50),
    Transaction_Date DATE,
    Accounting_Date DATE,
    Transaction_Number VARCHAR2(50),
    Original_System_Bill_to_Customer_Reference VARCHAR2(250),
    Original_System_Bill_to_Customer_Address_Reference VARCHAR2(100),
    Original_System_Bill_to_Customer_Contact_Reference VARCHAR2(100),
    Original_System_Ship_to_Customer_Reference VARCHAR2(100),
    Original_System_Ship_to_Customer_Address_Reference VARCHAR2(100),
    Original_System_Ship_to_Customer_Contact_Reference VARCHAR2(100),
    Original_System_Ship_to_Customer_Account_Reference VARCHAR2(100),
    Original_System_Ship_to_Customer_Account_Address_Reference VARCHAR2(100),
    Original_System_Ship_to_Customer_Account_Contact_Reference VARCHAR2(100),
    Original_System_Sold_to_Customer_Reference VARCHAR2(100),
    Original_System_Sold_to_Customer_Account_Reference VARCHAR2(100),
    Bill_to_Customer_Account_Number NUMBER,
    Bill_to_Customer_Site_Number NUMBER,
    Bill_to_Contact_Party_Number VARCHAR2(100),
    Ship_to_Customer_Account_Number VARCHAR2(100),
    Ship_to_Customer_Site_Number VARCHAR2(100),
    Ship_to_Contact_Party_Number VARCHAR2(100),
    Sold_to_Customer_Account_Number VARCHAR2(100),
    Transaction_Line_Type VARCHAR2(100),
    Transaction_Line_Description VARCHAR2(250),
    Currency_Code VARCHAR2(10),
    Currency_Conversion_Type VARCHAR2(50),
    Currency_Conversion_Date DATE,
    Currency_Conversion_Rate NUMBER,
    Transaction_Line_Amount NUMBER,
    Transaction_Line_Quantity NUMBER,
    Customer_Ordered_Quantity VARCHAR2(100),
    Unit_Selling_Price NUMBER,
    Unit_Standard_Price NUMBER,
    Line_Transactions_Flexfield_Context VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_1 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_2 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_3 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_4 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_5 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_6 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_7 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_8 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_9 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_10 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_11 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_12 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_13 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_14 VARCHAR2(100),
    Line_Transactions_Flexfield_Segment_15 VARCHAR2(100),
    Primary_Salesperson_Number NUMBER,
    Tax_Classification_Code VARCHAR2(50),
    Legal_Entity_Identifier VARCHAR2(100),
    Accounted_Amount_in_Ledger_Currency VARCHAR2(100),
    Sales_Order_Number VARCHAR2(100),
    Sales_Order_Date VARCHAR2(100),
    Actual_Ship_Date VARCHAR2(100),
    Warehouse_Code VARCHAR2(100),
    Unit_of_Measure_Code VARCHAR2(50),
    Unit_of_Measure_Name VARCHAR2(50),
    Invoicing_Rule_Name VARCHAR2(100),
    Revenue_Scheduling_Rule_Name VARCHAR2(100),
    Number_of_Revenue_Periods VARCHAR2(100),
    Revenue_Scheduling_Rule_Start_Date VARCHAR2(100),
    Revenue_Scheduling_Rule_End_Date VARCHAR2(100),
    Reason_Code_Meaning VARCHAR2(100),
    Last_Period_to_Credit VARCHAR2(100),
    Transaction_Business_Category_Code VARCHAR2(100),
    Product_Fiscal_Classification_Code VARCHAR2(100),
    Product_Category_Code VARCHAR2(100),
    Product_Type VARCHAR2(100),
    Line_Intended_Use_Code VARCHAR2(100),
    Assessable_Value VARCHAR2(100),
    Document_Sub_Type VARCHAR2(100),
    Default_Taxation_Country VARCHAR2(100),
    User_Defined_Fiscal_Classification VARCHAR2(100),
    Tax_Invoice_Number VARCHAR2(100),
    Tax_Invoice_Date VARCHAR2(100),
    Tax_Regime_Code VARCHAR2(100),
    Tax VARCHAR2(100),
    Tax_Status_Code VARCHAR2(100),
    Tax_Rate_Code VARCHAR2(100),
    Tax_Jurisdiction_Code VARCHAR2(100),
    First_Party_Registration_Number VARCHAR2(100),
    Third_Party_Registration_Number VARCHAR2(100),
    Final_Discharge_Location VARCHAR2(100),
    Taxable_Amount VARCHAR2(100),
    Taxable_Flag VARCHAR2(100),
    Tax_Exemption_Flag VARCHAR2(100),
    Tax_Exemption_Reason_Code VARCHAR2(100),
    Tax_Exemption_Reason_Code_Meaning VARCHAR2(100),
    Tax_Exemption_Certificate_Number VARCHAR2(100),
    Line_Amount_Includes_Tax_Flag VARCHAR2(100),
    Tax_Precedence VARCHAR2(100),
    Credit_Method_To_Be_Used_For_Lines_With_Revenue_Scheduling_Rules VARCHAR2(100),
    Credit_Method_To_Be_Used_For_Transactions_With_Split_Payment_Terms VARCHAR2(100),
    Reason_Code VARCHAR2(100),
    Tax_Rate VARCHAR2(100),
    FOB_Point VARCHAR2(100),
    Carrier VARCHAR2(100),
    Shipping_Reference VARCHAR2(100),
    Sales_Order_Line_Number VARCHAR2(100),
    Sales_Order_Source VARCHAR2(100),
    Sales_Order_Revision_Number VARCHAR2(100),
    Purchase_Order_Number VARCHAR2(100),
    Purchase_Order_Revision_Number VARCHAR2(100),
    Purchase_Order_Date VARCHAR2(100),
    Agreement_Name VARCHAR2(100),
    Memo_Line_Name VARCHAR2(250),
    Document_Number VARCHAR2(100),
    Original_System_Batch_Name VARCHAR2(100),
    Link_to_Transactions_Flexfield_Context VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_1 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_2 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_3 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_4 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_5 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_6 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_7 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_8 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_9 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_10 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_11 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_12 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_13 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_14 VARCHAR2(100),
    Link_to_Transactions_Flexfield_Segment_15 VARCHAR2(100),
    Reference_Transactions_Flexfield_Context VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_1 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_2 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_3 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_4 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_5 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_6 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_7 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_8 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_9 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_10 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_11 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_12 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_13 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_14 VARCHAR2(100),
    Reference_Transactions_Flexfield_Segment_15 VARCHAR2(100),
    Link_To_Parent_Line_Context VARCHAR2(100),
    Link_To_Parent_Line_Segment_1 VARCHAR2(100),
    Link_To_Parent_Line_Segment_2 VARCHAR2(100),
    Link_To_Parent_Line_Segment_3 VARCHAR2(100),
    Link_To_Parent_Line_Segment_4 VARCHAR2(100),
    Link_To_Parent_Line_Segment_5 VARCHAR2(100),
    Link_To_Parent_Line_Segment_6 VARCHAR2(100),
    Link_To_Parent_Line_Segment_7 VARCHAR2(100),
    Link_To_Parent_Line_Segment_8 VARCHAR2(100),
    Link_To_Parent_Line_Segment_9 VARCHAR2(100),
    Link_To_Parent_Line_Segment_10 VARCHAR2(100),
    Link_To_Parent_Line_Segment_11 VARCHAR2(100),
    Link_To_Parent_Line_Segment_12 VARCHAR2(100),
    Link_To_Parent_Line_Segment_13 VARCHAR2(100),
    Link_To_Parent_Line_Segment_14 VARCHAR2(100),
    Link_To_Parent_Line_Segment_15 VARCHAR2(100),
    Receipt_Method_Name VARCHAR2(100),
    Printing_Option VARCHAR2(100),
    Related_Batch_Source_Name VARCHAR2(100),
    Related_Transaction_Number VARCHAR2(100),
    Inventory_Item_Number VARCHAR2(100),
    Inventory_Item_Segment_2 VARCHAR2(100),
    Inventory_Item_Segment_3 VARCHAR2(100),
    Inventory_Item_Segment_4 VARCHAR2(100),
    Inventory_Item_Segment_5 VARCHAR2(100),
    Inventory_Item_Segment_6 VARCHAR2(100),
    Inventory_Item_Segment_7 VARCHAR2(100),
    Inventory_Item_Segment_8 VARCHAR2(100),
    Inventory_Item_Segment_9 VARCHAR2(100),
    Inventory_Item_Segment_10 VARCHAR2(100),
    Inventory_Item_Segment_11 VARCHAR2(100),
    Inventory_Item_Segment_12 VARCHAR2(100),
    Inventory_Item_Segment_13 VARCHAR2(100),
    Inventory_Item_Segment_14 VARCHAR2(100),
    Inventory_Item_Segment_15 VARCHAR2(100),
    Inventory_Item_Segment_16 VARCHAR2(100),
    Inventory_Item_Segment_17 VARCHAR2(100),
    Inventory_Item_Segment_18 VARCHAR2(100),
    Inventory_Item_Segment_19 VARCHAR2(100),
    Inventory_Item_Segment_20 VARCHAR2(100),
    Bill_To_Customer_Bank_Account_Name VARCHAR2(100),
    Reset_Transaction_Date_Flag VARCHAR2(100),
    Payment_Server_Order_Number VARCHAR2(100),
    Last_Transaction_on_Debit_Authorization VARCHAR2(100),
    Approval_Code VARCHAR2(100),
    Address_Verification_Code VARCHAR2(100),
    Transaction_Line_Translated_Description VARCHAR2(100),
    Consolidated_Billing_Number VARCHAR2(100),
    Promised_Commitment_Amount VARCHAR2(100),
    Payment_Set_Identifier VARCHAR2(100),
    Original_Accounting_Date VARCHAR2(100),
    Invoiced_Line_Accounting_Level VARCHAR2(100),
    Override_AutoAccounting_Flag VARCHAR2(100),
    Historical_Flag VARCHAR2(100),
    Deferral_Exclusion_Flag VARCHAR2(100),
    Payment_Attributes VARCHAR2(100),
    Invoice_Billing_Date VARCHAR2(100),
    Invoice_Lines_Flexfield_Context VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_1 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_2 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_3 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_4 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_5 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_6 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_7 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_8 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_9 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_10 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_11 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_12 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_13 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_14 VARCHAR2(100),
    Invoice_Lines_Flexfield_Segment_15 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Context VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_1 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_2 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_3 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_4 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_5 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_6 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_7 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_8 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_9 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_10 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_11 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_12 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_13 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_14 VARCHAR2(100),
    Invoice_Transactions_Flexfield_Segment_15 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Context VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_1 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_2 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_3 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_4 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_5 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_6 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_7 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_8 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_9 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_10 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_11 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_12 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_13 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_14 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_15 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_16 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_17 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_18 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_19 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_20 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_21 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_22 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_23 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_24 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_25 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_26 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_27 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_28 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_29 VARCHAR2(100),
    Receivables_Transaction_Region_Information_Flexfield_Segment_30 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Attribute_Category VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_1 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_2 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_3 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_4 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_5 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_6 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_7 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_8 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_9 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_10 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_11 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_12 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_13 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_14 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_15 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_16 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_17 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_18 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_19 VARCHAR2(100),
    Line_Global_Descriptive_Flexfield_Segment_20 VARCHAR2(100),
    Comments VARCHAR2(250),
    Notes_from_Source  VARCHAR2(100),
    Enforce_Chronological_Document_Sequencing  VARCHAR2(100)
    )
;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_PARAMS_TO_UPD_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_PARAMS_TO_UPD_TYPE" AS OBJECT 
(
       BATCH_ID            VARCHAR2 (50 CHAR) ,
       TRANSACTION_NUMBER  VARCHAR2 (100 CHAR) 
)

/
--------------------------------------------------------
--  DDL for Type XXER_AR_PARAMS_UPD_INV_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_PARAMS_UPD_INV_TYPE" AS OBJECT 
(
       BATCH_ID            VARCHAR2 (50 CHAR) ,
       TRANSACTION_NUMBER  VARCHAR2 (100 CHAR),
       STATUS              VARCHAR2 (10 CHAR)
)
;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_PARAMS_UPD_INV_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_PARAMS_UPD_INV_TTYPE" 
AS TABLE OF XXER_AR_PARAMS_UPD_INV_TYPE
;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_APPLY_RECEIPT_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_APPLY_RECEIPT_TYPE" AS OBJECT 
( 
       AMOUNT                 NUMBER,
       RECEIPT_ID          NUMBER (18) ,
       RECEIPT_NUMBER         VARCHAR2(50) ,
       TRANSACTION_NUMBER  VARCHAR2(20) ,
       CUSTOMER_NAME       VARCHAR2(360) ,
       APPLICATION_DATE    DATE,
       ACCOUNTING_DATE     DATE,
       CUST_ACCOUNT_ID     NUMBER   (18) ,
       ORGANIZATION_ID     NUMBER   (18),
       METODO_RECIBO         VARCHAR2 (30),
       RECEIPT_APPLY_ID    NUMBER   (18)
);

/
--------------------------------------------------------
--  DDL for Type XXER_AR_APPLY_RECEIPT_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_APPLY_RECEIPT_TTYPE" 
AS TABLE OF XXER_AR_APPLY_RECEIPT_TYPE;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_VALIDATION_INVOICE_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_VALIDATION_INVOICE_TTYPE" 
AS TABLE OF XXER_AR_VALIDATION_INVOICE_TYPE;

/
--------------------------------------------------------
--  DDL for Type XXER_AR_VALIDATION_INVOICE_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_AR_VALIDATION_INVOICE_TYPE" AS OBJECT 
(
       INVOICE_NUMBER     VARCHAR2 (50 CHAR) ,
       AMOUNT             NUMBER   (18) ,
       DETAILS_ERROR      VARCHAR2 (250 CHAR)
 );							   

/
--------------------------------------------------------
--  DDL for Type XXER_GL_INTERFACE_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_GL_INTERFACE_TYPE" 
AS
  OBJECT (
STATUS                                 VARCHAR2(50) ,
LEDGER_ID                              NUMBER(15)   ,
ACCOUNTING_DATE                        DATE         ,
CURRENCY_CODE                          VARCHAR2(15) ,
DATE_CREATED                           DATE         ,
CREATED_BY                             NUMBER(15)   ,
ACTUAL_FLAG                            VARCHAR2(1)  ,
USER_JE_CATEGORY_NAME                  VARCHAR2(25) ,
USER_JE_SOURCE_NAME                    VARCHAR2(25) ,
CURRENCY_CONVERSION_DATE               DATE         ,
ENCUMBRANCE_TYPE_ID                    NUMBER       ,
BUDGET_VERSION_ID                      NUMBER       ,
USER_CURRENCY_CONVERSION_TYPE          VARCHAR2(30) ,
CURRENCY_CONVERSION_RATE               NUMBER       ,
AVERAGE_JOURNAL_FLAG                   VARCHAR2(1)  ,
ORIGINATING_BAL_SEG_VALUE              VARCHAR2(25) ,
SEGMENT1                               VARCHAR2(25) ,
SEGMENT2                               VARCHAR2(25) ,
SEGMENT3                               VARCHAR2(25) ,
SEGMENT4                               VARCHAR2(25) ,
SEGMENT5                               VARCHAR2(25) ,
SEGMENT6                               VARCHAR2(25) ,
SEGMENT7                               VARCHAR2(25) ,
SEGMENT8                               VARCHAR2(25) ,
SEGMENT9                               VARCHAR2(25) ,
SEGMENT10                              VARCHAR2(25) ,
SEGMENT11                              VARCHAR2(25) ,
SEGMENT12                              VARCHAR2(25) ,
SEGMENT13                              VARCHAR2(25) ,
SEGMENT14                              VARCHAR2(25) ,
SEGMENT15                              VARCHAR2(25) ,
SEGMENT16                              VARCHAR2(25) ,
SEGMENT17                              VARCHAR2(25) ,
SEGMENT18                              VARCHAR2(25) ,
SEGMENT19                              VARCHAR2(25) ,
SEGMENT20                              VARCHAR2(25) ,
SEGMENT21                              VARCHAR2(25) ,
SEGMENT22                              VARCHAR2(25) ,
SEGMENT23                              VARCHAR2(25) ,
SEGMENT24                              VARCHAR2(25) ,
SEGMENT25                              VARCHAR2(25) ,
SEGMENT26                              VARCHAR2(25) ,
SEGMENT27                              VARCHAR2(25) ,
SEGMENT28                              VARCHAR2(25) ,
SEGMENT29                              VARCHAR2(25) ,
SEGMENT30                              VARCHAR2(25) ,
ENTERED_DR                             NUMBER       ,
ENTERED_CR                             NUMBER       ,
ACCOUNTED_DR                           NUMBER       ,
ACCOUNTED_CR                           NUMBER       ,
TRANSACTION_DATE                       DATE         ,
REFERENCE1                             VARCHAR2(100),
REFERENCE2                             VARCHAR2(240),
REFERENCE3                             VARCHAR2(100),
REFERENCE4                             VARCHAR2(100),
REFERENCE5                             VARCHAR2(240),
REFERENCE6                             VARCHAR2(100),
REFERENCE7                             VARCHAR2(100),
REFERENCE8                             VARCHAR2(100),
REFERENCE9                             VARCHAR2(100),
REFERENCE10                            VARCHAR2(240),
REFERENCE11                            VARCHAR2(240),
REFERENCE12                            VARCHAR2(100),
REFERENCE13                            VARCHAR2(100),
REFERENCE14                            VARCHAR2(100),
REFERENCE15                            VARCHAR2(100),
REFERENCE16                            VARCHAR2(100),
REFERENCE17                            VARCHAR2(100),
REFERENCE18                            VARCHAR2(100),
REFERENCE19                            VARCHAR2(100),
REFERENCE20                            VARCHAR2(100),
REFERENCE21                            VARCHAR2(240),
REFERENCE22                            VARCHAR2(240),
REFERENCE23                            VARCHAR2(240),
REFERENCE24                            VARCHAR2(240),
REFERENCE25                            VARCHAR2(240),
REFERENCE26                            VARCHAR2(240),
REFERENCE27                            VARCHAR2(240),
REFERENCE28                            VARCHAR2(240),
REFERENCE29                            VARCHAR2(240),
REFERENCE30                            VARCHAR2(240),
JE_BATCH_ID                            NUMBER(15)   ,
PERIOD_NAME                            VARCHAR2(15) ,
JE_HEADER_ID                           NUMBER(15)   ,
JE_LINE_NUM                            NUMBER(15)   ,
CHART_OF_ACCOUNTS_ID                   NUMBER(15)   ,
FUNCTIONAL_CURRENCY_CODE               VARCHAR2(15) ,
CODE_COMBINATION_ID                    NUMBER(15)   ,
DATE_CREATED_IN_GL                     DATE         ,
WARNING_CODE                           VARCHAR2(4)  ,
STATUS_DESCRIPTION                     VARCHAR2(240),
STAT_AMOUNT                            NUMBER       ,
GROUP_ID                               NUMBER(15)   ,
REQUEST_ID                             NUMBER(15)   ,
SUBLEDGER_DOC_SEQUENCE_ID              NUMBER       ,
SUBLEDGER_DOC_SEQUENCE_VALUE           NUMBER       ,
ATTRIBUTE1                             VARCHAR2(150),
ATTRIBUTE2                             VARCHAR2(150),
GL_SL_LINK_ID                          NUMBER       ,
GL_SL_LINK_TABLE                       VARCHAR2(30) ,
ATTRIBUTE3                             VARCHAR2(150),
ATTRIBUTE4                             VARCHAR2(150),
ATTRIBUTE5                             VARCHAR2(150),
ATTRIBUTE6                             VARCHAR2(150),
ATTRIBUTE7                             VARCHAR2(150),
ATTRIBUTE8                             VARCHAR2(150),
ATTRIBUTE9                             VARCHAR2(150),
ATTRIBUTE10                            VARCHAR2(150),
ATTRIBUTE11                            VARCHAR2(150),
ATTRIBUTE12                            VARCHAR2(150),
ATTRIBUTE13                            VARCHAR2(150),
ATTRIBUTE14                            VARCHAR2(150),
ATTRIBUTE15                            VARCHAR2(150),
ATTRIBUTE16                            VARCHAR2(150),
ATTRIBUTE17                            VARCHAR2(150),
ATTRIBUTE18                            VARCHAR2(150),
ATTRIBUTE19                            VARCHAR2(150),
ATTRIBUTE20                            VARCHAR2(150),
CONTEXT                                VARCHAR2(150),
CONTEXT2                               VARCHAR2(150),
INVOICE_DATE                           DATE         ,
TAX_CODE                               VARCHAR2(15) ,
INVOICE_IDENTIFIER                     VARCHAR2(20) ,
INVOICE_AMOUNT                         NUMBER       ,
CONTEXT3                               VARCHAR2(150),
USSGL_TRANSACTION_CODE                 VARCHAR2(30) ,
DESCR_FLEX_ERROR_MESSAGE               VARCHAR2(240),
JGZZ_RECON_REF                         VARCHAR2(240),
REFERENCE_DATE                         DATE         ,
SET_OF_BOOKS_ID                        NUMBER(15)   ,
BALANCING_SEGMENT_VALUE                VARCHAR2(25) ,
MANAGEMENT_SEGMENT_VALUE               VARCHAR2(25) ,
FUNDS_RESERVED_FLAG                    VARCHAR2(1)  ,
CODE_COMBINATION_ID_INTERIM            NUMBER(15)
  );

/
--------------------------------------------------------
--  DDL for Type XXER_GL_INTERFACE_TYPE_T
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_GL_INTERFACE_TYPE_T" IS TABLE OF XXER_GL_INTERFACE_TYPE;

/
--------------------------------------------------------
--  DDL for Type XXER_RELATIONS_CFDIS_TTYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_RELATIONS_CFDIS_TTYPE" 
	AS TABLE OF XXER_RELATIONS_CFDIS_TYPE;

/
--------------------------------------------------------
--  DDL for Type XXER_RELATIONS_CFDIS_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TYPE "XXER_RELATIONS_CFDIS_TYPE" AS OBJECT
	(
           DESCRIPCION  VARCHAR2 (150 CHAR),
           VT_MONTO  VARCHAR2 (20 CHAR),
           SUCURSAL_ID  VARCHAR2 (20 CHAR),
           IMPORTE  VARCHAR2 (20 CHAR),
           IVA  VARCHAR2 (20 CHAR),
           IMPORTE_IVA  VARCHAR2 (20 CHAR),
           IMPORTE_RETENCION  VARCHAR2 (20 CHAR),
           NUMERO_PRODUCTO  VARCHAR2 (20 CHAR),
           REFERENCIA_PRODUCTO  VARCHAR2 (150 CHAR),
           UNIDAD_MEDIDA  VARCHAR2 (150 CHAR),
		   NUMERO_DOCUMENTO  VARCHAR2 (50 CHAR),
		   TOTAL_FACTURA  VARCHAR2 (20 CHAR),
		   UUID_INGRESO  VARCHAR2 (50 CHAR),
           ESTATUS VARCHAR2 (30 CHAR),
		   URL_XML_INGRESO  VARCHAR2 (300 CHAR),
		   URL_PDF_INGRESO  VARCHAR2 (300 CHAR),
		   FECHA_INGRESO  VARCHAR2 (30 CHAR),
		   UUID_CP  VARCHAR2 (50 CHAR),
           ESTATUS_CP VARCHAR2 (30 CHAR),
		   URL_XML_CP  VARCHAR2 (300 CHAR),
		   URL_PDF_CP  VARCHAR2 (300 CHAR),
		   FECHA_CP  VARCHAR2 (30 CHAR),
           TIPO_FACTURA  VARCHAR2 (20 CHAR),
           FECHA_CREACION VARCHAR2 (30 CHAR)
	 );

/
