package model;

import controller.Validate;

public class Customer {
    private int customerID, accountID, point, level;

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) throws Exception{
        Validate.checkString(customerID);
        this.customerID = Integer.parseInt(customerID);
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) throws  Exception{
        Validate.checkString(accountID);
        this.accountID = Integer.parseInt(accountID);
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(String point) throws Exception{
        Validate.checkString(point);
        int number = Integer.parseInt(point);
        Validate.checkInt(number, 0, Integer.MAX_VALUE);
        this.point = number;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(String level) throws Exception{
        Validate.checkString(level);
        int number = Integer.parseInt(level);
        Validate.checkInt(number, 0, Integer.MAX_VALUE);
        this.level = number;
    }
}
