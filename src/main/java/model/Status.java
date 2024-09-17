package model;

import controller.Validate;

public class Status {
    private Integer statusID;
    private String detail;

    public Status() {
    }

    public Status(Integer statusID, String detail) {
        this.statusID = statusID;
        this.detail = detail;
    }

    public Integer getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) throws Exception {
        Validate.checkString(statusID);
        int number = Integer.parseInt(statusID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.statusID = number;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) throws Exception {
        Validate.checkString(detail,1,100);
        this.detail = detail;
    }
}
