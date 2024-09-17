package model;

import controller.Validate;

import java.time.LocalDateTime;

public class AccountLog {
    private Integer logID, accountID, eventTypeID;
    private String ipAddress, dataType, value, time;

    public AccountLog() {
    }

    public AccountLog(Integer logID, Integer accountID, Integer eventTypeID, String ipAddress, String dataType, String value, String time) {
        this.logID = logID;
        this.accountID = accountID;
        this.eventTypeID = eventTypeID;
        this.ipAddress = ipAddress;
        this.dataType = dataType;
        this.value = value;
        this.time = time;
    }

    public Integer getLogID() {
        return logID;
    }

    public void setLogID(String logID) throws Exception {
        Validate.checkString(logID);
        int number = Integer.parseInt(logID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.logID = number;
    }

    public Integer getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) throws Exception {
        Validate.checkString(accountID);
        int number = Integer.parseInt(accountID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.accountID = number;
    }

    public Integer getEventTypeID() {
        return eventTypeID;
    }

    public void setEventTypeID(String eventTypeID) throws Exception {
        Validate.checkString(eventTypeID);
        int number = Integer.parseInt(eventTypeID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.eventTypeID = number;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) throws Exception {
        Validate.checkDateTime(time);
        this.time = time;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) throws Exception{
        Validate.checkString(ipAddress,1,100);
        this.ipAddress = ipAddress;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) throws Exception{
        Validate.checkString(dataType,0,50);
        this.dataType = dataType;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) throws Exception {
        Validate.checkString(value, 0, Integer.MAX_VALUE);
        this.value = value;
    }
}