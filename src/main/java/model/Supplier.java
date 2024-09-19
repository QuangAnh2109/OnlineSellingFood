package model;

public class Supplier {
    private int supplierID, contactInformationID;
    private String name, note;

    public Supplier() {
    }

    public Supplier(int supplierID, int contactInformationID, String name, String note) {
        this.supplierID = supplierID;
        this.contactInformationID = contactInformationID;
        this.name = name;
        this.note = note;
    }

    public int getSupplierID() {
        return supplierID;
    }

    public void setSupplierID(int supplierID) {
        this.supplierID = supplierID;
    }

    public int getContactInformationID() {
        return contactInformationID;
    }

    public void setContactInformationID(int contactInformationID) {
        this.contactInformationID = contactInformationID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
