package model;

public class Warehouse {
    private int warehouseID, contactInformationID, statusID;
    private String name;

    public Warehouse() {
    }

    public Warehouse(int warehouseID, int contactInformationID, int statusID, String name) {
        this.warehouseID = warehouseID;
        this.contactInformationID = contactInformationID;
        this.statusID = statusID;
        this.name = name;
    }

    public int getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(int warehouseID) {
        this.warehouseID = warehouseID;
    }

    public int getContactInformationID() {
        return contactInformationID;
    }

    public void setContactInformationID(int contactInformationID) {
        this.contactInformationID = contactInformationID;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
