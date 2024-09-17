package model;

import controller.Validate;

public class Staff {
    private Integer staffID, accountID, salary, warehouseID;

    public Staff() {
    }

    public Staff(Integer staffID, Integer accountID, Integer salary, Integer warehouseID) {
        this.staffID = staffID;
        this.accountID = accountID;
        this.salary = salary;
        this.warehouseID = warehouseID;
    }

    public Integer getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) throws  Exception{
        Validate.checkString(staffID);
        int number = Integer.parseInt(staffID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.staffID = number;
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

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(String salary) throws Exception{
        Validate.checkString(salary);
        int number = Integer.parseInt(salary);
        Validate.checkInt(number, 1, Integer.MAX_VALUE);
        this.salary = number;
    }

    public Integer getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(String warehouseID) throws  Exception{
        Validate.checkString(warehouseID);
        int number = Integer.parseInt(warehouseID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.warehouseID = number;
    }
}
