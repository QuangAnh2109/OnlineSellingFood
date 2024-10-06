package model;

public class Img {
    private Integer imgID;
    private String imglink;

    public Img() {
    }

    public Img(String imglink, Integer imgID) {
        this.imglink = imglink;
        this.imgID = imgID;
    }

    public Integer getImgID() {
        return imgID;
    }

    public void setImgID(Integer imgID) {
        this.imgID = imgID;
    }

    public String getImglink() {
        return imglink;
    }

    public void setImglink(String imglink) {
        this.imglink = imglink;
    }
}
