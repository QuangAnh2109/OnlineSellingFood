package model;

import controller.Encrypt;
import controller.Validate;

import java.time.LocalDateTime;

public class Account {
    private int accountID;
    private int roleID;
    private String email;
    private String firstName;
    private String lastName;
    private int birthYear;
    private int contactInformationID;
    private String password;
    private LocalDateTime time;
    private int statusID;

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) throws Exception {
        Validate.checkString(accountID);
        this.accountID = Integer.parseInt(accountID);
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) throws Exception {
        Validate.checkString(roleID);
        this.roleID = Integer.parseInt(roleID);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) throws Exception {
        Validate.checkString(email,1,100);
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) throws Exception {
        Validate.checkString(firstName,1,100);
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) throws Exception {
        Validate.checkString(lastName,1,100);
        this.lastName = lastName;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(String birthYear) throws Exception {
        Validate.checkString(birthYear);
        this.birthYear = Integer.parseInt(birthYear);
    }

    public int getContactInformationID() {
        return contactInformationID;
    }

    public void setContactInformationID(String contactInformationID) throws Exception {
        Validate.checkString(contactInformationID);
        this.contactInformationID = Integer.parseInt(contactInformationID);
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) throws Exception {
        Validate.checkString(password,6,Integer.MAX_VALUE);
        Encrypt encrypt = new Encrypt();
        this.password = encrypt.toHexString(encrypt.getSHA(password));
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(String time) throws Exception {
        this.time = Validate.checkDateTime(time);
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(String statusID) throws Exception {
        Validate.checkString(statusID);
        this.statusID = Integer.parseInt(statusID);
    }
}
