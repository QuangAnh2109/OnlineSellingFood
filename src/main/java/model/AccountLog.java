package model;

public class AccountLog {
    private int logID, eventTypeID;
    private Integer accountID;
    private String ipAddress, dataType, value, time;

    public AccountLog() {
    }

    public AccountLog(int logID, int eventTypeID, Integer accountID, String ipAddress, String dataType, String value, String time) {
        this.logID = logID;
        this.eventTypeID = eventTypeID;
        this.accountID = accountID;
        this.ipAddress = ipAddress;
        this.dataType = dataType;
        this.value = value;
        this.time = time;
    }

    public int getLogID() {
        return logID;
    }

    public void setLogID(int logID) {
        this.logID = logID;
    }

    public int getEventTypeID() {
        return eventTypeID;
    }

    public void setEventTypeID(int eventTypeID) {
        this.eventTypeID = eventTypeID;
    }

    public Integer getAccountID() {
        return accountID;
    }

    public void setAccountID(Integer accountID) {
        this.accountID = accountID;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}