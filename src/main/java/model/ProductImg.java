package model;

public class ProductImg {
    private Integer productID;
    private Integer imgID;

    public ProductImg() {
    }

    public ProductImg(Integer productID, Integer imgID) {
        this.productID = productID;
        this.imgID = imgID;
    }

    public Integer getProductID() {
        return productID;
    }

    public void setProductID(Integer productID) {
        this.productID = productID;
    }

    public Integer getImgID() {
        return imgID;
    }

    public void setImgID(Integer imgID) {
        this.imgID = imgID;
    }
}
