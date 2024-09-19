package model;

import java.time.LocalDateTime;

public class Import {
    private int importID, staffID, warehouseID, supplierID;
    private LocalDateTime time;

    public Import() {
    }

    public Import(int importID, int staffID, int warehouseID, int supplierID, LocalDateTime time) {
        this.importID = importID;
        this.staffID = staffID;
        this.warehouseID = warehouseID;
        this.supplierID = supplierID;
        this.time = time;
    }

    public int getImportID() {
        return importID;
    }

    public void setImportID(int importID) {
        this.importID = importID;
    }

    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    public int getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(int warehouseID) {
        this.warehouseID = warehouseID;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }
}
