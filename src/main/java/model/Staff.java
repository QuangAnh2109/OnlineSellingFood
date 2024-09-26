package model;

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
    public Staff(int accountID, int salary, int warehouseID) {
        this.accountID = accountID;
        this.salary = salary;
        this.warehouseID = warehouseID;
    }

    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public int getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(int warehouseID) {
        this.warehouseID = warehouseID;
    }
}
