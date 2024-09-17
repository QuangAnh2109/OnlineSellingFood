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

    public Integer getRoleID() {
        return statusID;
    }

    public void setRoleID(String statusID) throws Exception {
        Validate.checkString(statusID);
        int number = Integer.parseInt(statusID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.statusID = number;
    }

    public String getName() {
        return detail;
    }

    public void setName(String detail) throws Exception {
        Validate.checkString(detail,1,100);
        this.detail = detail;
    }
}
