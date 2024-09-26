package model;

public class Customer {
    private int customerID, accountID, point, level;


    public Customer() {
    }

    public Customer(int customerID, int accountID, int point, int level) {
        this.customerID = customerID;
        this.accountID = accountID;
        this.point = point;
        this.level = level;
    }
    public Customer(int accountID, int point, int level) {
        this.accountID = accountID;
        this.point = point;
        this.level = level;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
