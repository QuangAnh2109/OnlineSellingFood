package model;

import java.sql.Timestamp;
import java.time.LocalDateTime;

public class Import {
    private Integer importID;
    private Integer staffID;
    private Integer warehouseID;
    private Integer supplierID;
    private LocalDateTime time;

    public Import() {
    }

    public Import(Integer importID, Integer staffID, Integer warehouseID, Integer supplierID, LocalDateTime time) {
        this.importID = importID;
        this.staffID = staffID;
        this.warehouseID = warehouseID;
        this.supplierID = supplierID;
        this.time = time;
    }

    public Integer getImportID() {
        return importID;
    }

    public void setImportID(Integer importID) {
        this.importID = importID;
    }

    public Integer getStaffID() {
        return staffID;
    }

    public void setStaffID(Integer staffID) {
        this.staffID = staffID;
    }

    public Integer getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(Integer warehouseID) {
        this.warehouseID = warehouseID;
    }

    public Integer getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(Integer supplierID) {
        this.supplierID = supplierID;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }


    private String accountName;
    private String warehouseName;
    private String supplierName;
    private LocalDateTime importTime;

    public Import(Integer importID, String accountName, String warehouseName, String supplierName, LocalDateTime importTime) {
        this.importID = importID;
        this.accountName = accountName;
        this.warehouseName = warehouseName;
        this.supplierName = supplierName;
        this.importTime = importTime;
    }

    public String getAccountName() { return accountName; }
    public String getWarehouseName() { return warehouseName; }
    public String getSupplierName() { return supplierName; }


    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public void setWarehouseName(String warehouseName) {
        this.warehouseName = warehouseName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public LocalDateTime getImportTime() { return importTime; }
    public void setImportTime(LocalDateTime importTime) { this.importTime = importTime; }
}
