package model;

public class Manufacturer {
    private int manufacturerID;
    private String name, introduce;

    public Manufacturer() {
    }

    public Manufacturer(int manufacturerID, String name, String introduce) {
        this.manufacturerID = manufacturerID;
        this.name = name;
        this.introduce = introduce;
    }

    public int getManufacturerID() {
        return manufacturerID;
    }

    public void setManufacturerID(int manufacturerID) {
        this.manufacturerID = manufacturerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }
}
