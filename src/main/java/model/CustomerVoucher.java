package model;

public class CustomerVoucher {
    private int customerID, voucherID;

    public CustomerVoucher() {
    }

    public CustomerVoucher(int customerID, int voucherID) {
        this.customerID = customerID;
        this.voucherID = voucherID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }
}
