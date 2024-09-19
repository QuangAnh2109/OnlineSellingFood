package model;

public class Voucher {
    private int voucherID, discountID, quantity, inventory;

    public Voucher() {
    }

    public Voucher(int voucherID, int discountID, int quantity, int inventory) {
        this.voucherID = voucherID;
        this.discountID = discountID;
        this.quantity = quantity;
        this.inventory = inventory;
    }

    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }
}
