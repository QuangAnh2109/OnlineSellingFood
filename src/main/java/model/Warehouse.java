package model;

import controller.Validate;

public class Warehouse {
    private Integer warehouseID, contactInformationID, statusID;
    private String name;

    public Warehouse() {
    }

    public Warehouse(Integer warehouseID, Integer contactInformationID, Integer statusID, String name) {
        this.warehouseID = warehouseID;
        this.contactInformationID = contactInformationID;
        this.statusID = statusID;
        this.name = name;
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

    public int getContactInformationID() {
        return contactInformationID;
    }

    public void setContactInformationID(String contactInformationID) throws  Exception{
        Validate.checkString(contactInformationID);
        int number = Integer.parseInt(contactInformationID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.contactInformationID = number;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) throws  Exception{
        Validate.checkString(statusID);
        int number = Integer.parseInt(statusID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.statusID = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) throws  Exception{
        Validate.checkString(name,1,100);
        this.name = name;
    }
}
