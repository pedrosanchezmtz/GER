package integra.globalgas.com.esb.ess.beans;

import java.io.Serializable;

import java.sql.SQLData;
import java.sql.SQLException;
import java.sql.SQLInput;
import java.sql.SQLOutput;

public class PaymentsRec implements SQLData, Serializable {
    public PaymentsRec() {
        super();
    }
    private String CHECK_ID;
    private String PAYMENT_DATE;
    private String AMOUNT;
    private String PAYMENT_NUMBER;
    private String RFC_SUPPLIER;
    private String BANK_NAME;
    private String BANK_ACCOUNT;
    private String FLOW_ID;
    private String STATUS;
    private String DESCRIPTION;
//    private String RFC_LINE;

    private String sql_type;

    public String getCHECK_ID() {
        return CHECK_ID;
    }

    public void setCHECK_ID(String CHECK_ID) {
        this.CHECK_ID = CHECK_ID;
    }

    public String getPAYMENT_DATE() {
        return PAYMENT_DATE;
    }

    public void setPAYMENT_DATE(String PAYMENT_DATE) {
        this.PAYMENT_DATE = PAYMENT_DATE;
    }

    public String getAMOUNT() {
        return AMOUNT;
    }

    public void setAMOUNT(String AMOUNT) {
        this.AMOUNT = AMOUNT;
    }

    public String getPAYMENT_NUMBER() {
        return PAYMENT_NUMBER;
    }

    public void setPAYMENT_NUMBER(String PAYMENT_NUMBER) {
        this.PAYMENT_NUMBER = PAYMENT_NUMBER;
    }

    public String getRFC_SUPPLIER() {
        return RFC_SUPPLIER;
    }

    public void setRFC_SUPPLIER(String RFC_SUPPLIER) {
        this.RFC_SUPPLIER = RFC_SUPPLIER;
    }

    public String getBANK_NAME() {
        return BANK_NAME;
    }

    public void setBANK_NAME(String BANK_NAME) {
        this.BANK_NAME = BANK_NAME;
    }

    public String getBANK_ACCOUNT() {
        return BANK_ACCOUNT;
    }

    public void setBANK_ACCOUNT(String BANK_ACCOUNT) {
        this.BANK_ACCOUNT = BANK_ACCOUNT;
    }

    public String getFLOW_ID() {
        return FLOW_ID;
    }

    public void setFLOW_ID(String FLOW_ID) {
        this.FLOW_ID = FLOW_ID;
    }

    public String getSTATUS() {
        return STATUS;
    }

    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    public String getDESCRIPTION() {
        return DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    @Override
    public String getSQLTypeName() throws SQLException {
        return sql_type;
        //   return null;
    }

    @Override
    public void readSQL(SQLInput stream, String typeName) throws SQLException {
        this.sql_type = typeName;
        this.CHECK_ID = stream.readString();
        this.PAYMENT_DATE = stream.readString();
        this.AMOUNT = stream.readString();
        this.PAYMENT_NUMBER = stream.readString();
        this.RFC_SUPPLIER = stream.readString();
        this.BANK_NAME = stream.readString();
        this.BANK_ACCOUNT = stream.readString();
        this.FLOW_ID = stream.readString();
        this.STATUS = stream.readString();
        this.DESCRIPTION = stream.readString();

    }

    @Override
    public void writeSQL(SQLOutput stream) throws SQLException {
        stream.writeString(CHECK_ID);
        stream.writeString(PAYMENT_DATE);
        stream.writeString(AMOUNT);
        stream.writeString(PAYMENT_NUMBER);
        stream.writeString(RFC_SUPPLIER);
        stream.writeString(BANK_NAME);
        stream.writeString(BANK_ACCOUNT);
        stream.writeString(FLOW_ID);
        stream.writeString(STATUS);
        stream.writeString(DESCRIPTION);
    }
/*
    public String getRFC_LINE() {
        return RFC_LINE;
    }

    public void setRFC_LINE(String RFC_LINE) {
        this.RFC_LINE = RFC_LINE;
    }
    */
}
