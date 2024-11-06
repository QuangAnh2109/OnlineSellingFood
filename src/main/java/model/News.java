package model;

import java.util.Date;

public class News {
    private Integer newsID;
    private Integer staffID;
    private Integer imgID;
    private String title;
    private String content;
    private Date time;
    private boolean active;

    public News() {
    }

    public News(Integer newsID, Integer staffID, Integer imgID, String title, String content, Date time, boolean active) {
        this.newsID = newsID;
        this.staffID = staffID;
        this.imgID = imgID;
        this.title = title;
        this.content = content;
        this.time = time;
        this.active = active;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
