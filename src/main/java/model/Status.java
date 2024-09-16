package model;

import controller.Validate;

public class Status {
    private int statusID;
    private String detail;

    public int getRoleID() {
        return statusID;
    }

    public void setRoleID(String statusID) throws Exception {
        Validate.checkString(statusID);
        this.statusID = Integer.parseInt(statusID);
    }

    public String getName() {
        return detail;
    }

    public void setName(String detail) throws Exception {
        Validate.checkString(detail,1,100);
        this.detail = detail;
    }
}
