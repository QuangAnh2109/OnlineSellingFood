package model;

import java.time.LocalDateTime;

public class Order {
    private int orderID, customerID, paymentStatementID, contactInformationID, voucherID, price, statusID;
    private LocalDateTime orderTime;

    public Order() {
    }

    public Order(int orderID, int customerID, int paymentStatementID, int contactInformationID, int voucherID, int price, int statusID, LocalDateTime orderTime) {
        this.orderID = orderID;
        this.customerID = customerID;
        this.paymentStatementID = paymentStatementID;
        this.contactInformationID = contactInformationID;
        this.voucherID = voucherID;
        this.price = price;
        this.statusID = statusID;
        this.orderTime = orderTime;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getPaymentStatementID() {
        return paymentStatementID;
    }

    public void setPaymentStatementID(int paymentStatementID) {
        this.paymentStatementID = paymentStatementID;
    }

    public int getContactInformationID() {
        return contactInformationID;
    }

    public void setContactInformationID(int contactInformationID) {
        this.contactInformationID = contactInformationID;
    }

    public int getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(LocalDateTime orderTime) {
        this.orderTime = orderTime;
    }
}
