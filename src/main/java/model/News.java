package model;

public class News {
    private int newsID, staffID, imgID;
    private String title, content;

    public News() {
    }

    public News(int newsID, int staffID, int imgID, String title, String content) {
        this.newsID = newsID;
        this.staffID = staffID;
        this.imgID = imgID;
        this.title = title;
        this.content = content;
    }

    public int getNewsID() {
        return newsID;
    }

    public void setNewsID(int newsID) {
        this.newsID = newsID;
    }

    public int getStaffID() {
        return staffID;
    }

    public void setStaffID(int staffID) {
        this.staffID = staffID;
    }

    public int getImgID() {
        return imgID;
    }

    public void setImgID(int imgID) {
        this.imgID = imgID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
