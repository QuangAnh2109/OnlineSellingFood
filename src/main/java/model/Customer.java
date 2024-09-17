package model;

import controller.Validate;

public class Customer {
    private Integer customerID, accountID, point, level;

    public Customer(Integer customerID, Integer accountID, Integer point, Integer level) {
        this.customerID = customerID;
        this.accountID = accountID;
        this.point = point;
        this.level = level;
    }

    public Customer() {
    }

    public Integer getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) throws Exception{
        Validate.checkString(customerID);
        int number = Integer.parseInt(customerID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.customerID = number;
    }

    public Integer getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) throws  Exception{
        Validate.checkString(accountID);
        int number = Integer.parseInt(accountID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.accountID = number;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(String point) throws Exception{
        Validate.checkString(point);
        int number = Integer.parseInt(point);
        Validate.checkInt(number, 0, Integer.MAX_VALUE);
        this.point = number;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(String level) throws Exception{
        Validate.checkString(level);
        int number = Integer.parseInt(level);
        Validate.checkInt(number, 0, Integer.MAX_VALUE);
        this.level = number;
    }
}
