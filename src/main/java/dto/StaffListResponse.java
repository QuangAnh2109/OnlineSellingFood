package dto;

import java.sql.Date;

public class StaffListResponse {
    private int accountID;
    private String firstName, lastName,email,detail;
    private Date time;
    public StaffListResponse(int accountID,String firstName, String lastName, String email, String detail, Date time) {
        this.accountID = accountID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.detail = detail;
        this.time = time;

    }

    public StaffListResponse() {
    }
     public int getAccountID() {
        return accountID;
     }
     public void setAcoountID(int accountID) {
        this.accountID = accountID;
     }
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}
