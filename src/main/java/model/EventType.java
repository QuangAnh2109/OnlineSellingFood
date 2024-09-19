package model;

import controller.Validate;

public class EventType {
    private int evenTypeID;
    private String detail;

    public EventType() {
    }

    public EventType(int evenTypeID, String detail) {
        this.evenTypeID = evenTypeID;
        this.detail = detail;
    }

    public int getEvenTypeID() {
        return evenTypeID;
    }

    public void setEvenTypeID(int evenTypeID) {
        this.evenTypeID = evenTypeID;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }
}
