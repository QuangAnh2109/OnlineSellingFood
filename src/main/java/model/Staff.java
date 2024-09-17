package model;

import controller.Validate;

public class Staff {
    private int staffID, accountID, salary, warehouseID;

    public Staff() {
    }

    public Staff(int staffID, int accountID, int salary, int warehouseID) {
        this.staffID = staffID;
        this.accountID = accountID;
        this.salary = salary;
        this.warehouseID = warehouseID;
    }

    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) throws  Exception{
        Validate.checkString(staffID);
        int number = Integer.parseInt(staffID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.staffID = number;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) throws  Exception{
        Validate.checkString(accountID);
        int number = Integer.parseInt(accountID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.accountID = number;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(String salary) throws Exception{
        Validate.checkString(salary);
        int number = Integer.parseInt(salary);
        Validate.checkInt(number, 1, Integer.MAX_VALUE);
        this.salary = number;
    }

    public int getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(String warehouseID) throws  Exception{
        Validate.checkString(warehouseID);
        int number = Integer.parseInt(warehouseID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.warehouseID = number;
    }
}
