package model;

public class News {
    private Integer newsID;
    private Integer staffID;
    private Integer imgID;
    private String title;
    private String content;

    public News() {
    }

    public News(Integer newsID, Integer staffID, Integer imgID, String title, String content) {
        this.newsID = newsID;
        this.staffID = staffID;
        this.imgID = imgID;
        this.title = title;
        this.content = content;
    }

    public Integer getNewsID() {
        return newsID;
    }

    public void setNewsID(Integer newsID) {
        this.newsID = newsID;
    }

    public Integer getStaffID() {
        return staffID;
    }

    public void setStaffID(Integer staffID) {
        this.staffID = staffID;
    }

    public Integer getImgID() {
        return imgID;
    }

    public void setImgID(Integer imgID) {
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
