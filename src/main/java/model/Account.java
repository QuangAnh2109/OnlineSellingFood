package model;

import controller.Encrypt;
import controller.Validate;

import java.time.LocalDateTime;

public class Account {
    private int AccountID;
    private int RoleID;
    private String Email;
    private String FirstName;
    private String LastName;
    private int BirthYear;
    private int ContactInformationID;
    private String Password;
    private LocalDateTime Time;
    private int StatusID;

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(String accountID) throws Exception {
        Validate.checkString(accountID);
        AccountID = Integer.parseInt(accountID);
    }

    public int getRoleID() {
        return RoleID;
    }

    public void setRoleID(String roleID) throws Exception {
        Validate.checkString(roleID);
        RoleID = Integer.parseInt(roleID);
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) throws Exception {
        Validate.checkString(email,1,100);
        Email = email;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String firstName) throws Exception {
        Validate.checkString(firstName,1,100);
        FirstName = firstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String lastName) throws Exception {
        Validate.checkString(lastName,1,100);
        LastName = lastName;
    }

    public int getBirthYear() {
        return BirthYear;
    }

    public void setBirthYear(String birthYear) throws Exception {
        Validate.checkString(birthYear);
        BirthYear = Integer.parseInt(birthYear);
    }

    public int getContactInformationID() {
        return ContactInformationID;
    }

    public void setContactInformationID(String contactInformationID) throws Exception {
        Validate.checkString(contactInformationID);
        ContactInformationID = Integer.parseInt(contactInformationID);
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) throws Exception {
        Validate.checkString(password,6,Integer.MAX_VALUE);
        Encrypt encrypt = new Encrypt();
        Password = encrypt.toHexString(encrypt.getSHA(password));
    }

    public LocalDateTime getTime() {
        return Time;
    }

    public void setTime(String time) throws Exception {
        Time = Validate.checkDateTime(time);
    }

    public int getStatusID() {
        return StatusID;
    }

    public void setStatusID(String statusID) throws Exception {
        Validate.checkString(statusID);
        StatusID = Integer.parseInt(statusID);
    }
}
