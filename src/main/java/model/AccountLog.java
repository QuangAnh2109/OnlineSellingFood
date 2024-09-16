package model;

import controller.Validate;

import java.time.LocalDateTime;

public class AccountLog {
    private int logID, accountID, eventTypeID;
    private LocalDateTime time;
    private String ipAddress, dataType, value;

    public int getLogID() {
        return logID;
    }

    public void setLogID(String logID) throws Exception {
        Validate.checkString(logID);
        int number = Integer.parseInt(logID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.logID = number;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) throws Exception {
        Validate.checkString(accountID);
        int number = Integer.parseInt(accountID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.accountID = number;
    }

    public int getEventTypeID() {
        return eventTypeID;
    }

    public void setEventTypeID(String eventTypeID) throws Exception {
        Validate.checkString(eventTypeID);
        int number = Integer.parseInt(eventTypeID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.eventTypeID = number;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(String time) throws Exception {
        this.time = Validate.checkDateTime(time);
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