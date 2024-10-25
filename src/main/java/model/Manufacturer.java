package model;

public class Manufacturer {
    private Integer manufacturerID;
    private String name;
    private String introduce;
    private int productCount;

    public Manufacturer() {
    }

    public Manufacturer(Integer manufacturerID, String name, String introduce, Integer productCount) {
        this.manufacturerID = manufacturerID;
        this.name = name;
        this.introduce = introduce;
        this.productCount=productCount;
    }

    public Integer getManufacturerID() {
        return manufacturerID;
    }

    public void setManufacturerID(Integer manufacturerID) {
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
    public int getProductCount() {
        return productCount;
    }

    public void setProductCount(int productCount) {
        this.productCount = productCount;
    }
}
