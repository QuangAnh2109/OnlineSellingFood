package model;

public class Product {
    private int productID, price, discountID, weight, categoryID, manufacturerID, originID, unitID, certificationID, statusID;
    private String name, detail;

    public Product() {
    }

    public Product(int productID, int price, int discountID, int weight, int categoryID, int manufacturerID, int originID, int unitID, int certificationID, int statusID, String name, String detail) {
        this.productID = productID;
        this.price = price;
        this.discountID = discountID;
        this.weight = weight;
        this.categoryID = categoryID;
        this.manufacturerID = manufacturerID;
        this.originID = originID;
        this.unitID = unitID;
        this.certificationID = certificationID;
        this.statusID = statusID;
        this.name = name;
        this.detail = detail;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getManufacturerID() {
        return manufacturerID;
    }

    public void setManufacturerID(int manufacturerID) {
        this.manufacturerID = manufacturerID;
    }

    public int getOriginID() {
        return originID;
    }

    public void setOriginID(int originID) {
        this.originID = originID;
    }

    public int getUnitID() {
        return unitID;
    }

    public void setUnitID(int unitID) {
        this.unitID = unitID;
    }

    public int getCertificationID() {
        return certificationID;
    }

    public void setCertificationID(int certificationID) {
        this.certificationID = certificationID;
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

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
