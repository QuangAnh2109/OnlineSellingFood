package model;

public class ProductImg {
    private int productID, imgID;

    public ProductImg() {
    }

    public ProductImg(int productID, int imgID) {
        this.productID = productID;
        this.imgID = imgID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getImgID() {
        return imgID;
    }

    public void setImgID(int imgID) {
        this.imgID = imgID;
    }
}
