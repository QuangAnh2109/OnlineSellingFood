package model;

public class OrderStatus {
    private int statusID;
    private String detail;

    public OrderStatus(int statusID, String detail) {
        this.statusID = statusID;
        this.detail = detail;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
