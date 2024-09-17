package model;

import controller.Validate;

public class EventType {
    private Integer evenTypeID;
    private String detail;

    public EventType() {
    }

    public EventType(Integer evenTypeID, String detail) {
        this.evenTypeID = evenTypeID;
        this.detail = detail;
    }

    public Integer getEvenTypeID() {
        return evenTypeID;
    }

    public void setEvenTypeID(String evenTypeID) throws Exception {
        Validate.checkString(evenTypeID);
        int number = Integer.parseInt(evenTypeID);
        Validate.checkInt(number, 1, Integer.MAX_VALUE);
        this.evenTypeID = number;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) throws Exception {
        Validate.checkString(detail,1,100);
        this.detail = detail;
    }
}