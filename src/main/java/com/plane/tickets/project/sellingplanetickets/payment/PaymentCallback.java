package com.plane.tickets.project.sellingplanetickets.payment;

public class PaymentCallback {

    private String txnid;
    private String mihpayid;
    private PaymentMode mode;
    private String status;
    private String hash;


    public String getTxnid() {
        return txnid;
    }
    public String getHash() {
        return hash;
    }
    public String getStatus() { return status; }
    public String getMihpayid() {
        return mihpayid;
    }
    public PaymentMode getMode() {
        return mode;
    }

    public void setTxnid(String txnid) {
        this.txnid = txnid;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }
    public void setMihpayid(String mihpayid) {
        this.mihpayid = mihpayid;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public void setMode(PaymentMode mode) {
        this.mode = mode;
    }



}