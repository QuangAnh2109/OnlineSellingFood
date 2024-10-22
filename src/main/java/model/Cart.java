package model;

public class Cart {
    private int customerID;
    private int productID;

    public Cart() {
    }

    public Cart(int customerID, int productID) {
        this.customerID = customerID;
        this.productID = productID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }
}