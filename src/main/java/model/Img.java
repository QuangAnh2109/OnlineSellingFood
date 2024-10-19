package model;

public class Img {
    private int imgID;
    private String imglink;

    public Img() {
    }

    public int getImgID() {
        return imgID;
    }

    public Img(int imgID, String imglink) {
        this.imgID = imgID;
        this.imglink = imglink;
    }

    public void setImgID(int imgID) {
        this.imgID = imgID;
    }

    public String getImglink() {
        return imglink;
    }

    public void setImglink(String imglink) {
        this.imglink = imglink;
    }
}
