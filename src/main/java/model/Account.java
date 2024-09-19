package model;

import java.time.LocalDateTime;

public class Account {
    private int accountID, roleID, birthYear, contactInformationID, statusID;
    private String email, firstName, lastName, password;
    private LocalDateTime time;


    public Account() {
    }

    public Account(int accountID, int roleID, int birthYear, int contactInformationID, int statusID, String email, String firstName, String lastName, String password, LocalDateTime time) {
        this.accountID = accountID;
        this.roleID = roleID;
        this.birthYear = birthYear;
        this.contactInformationID = contactInformationID;
        this.statusID = statusID;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.time = time;
    }

    public Account(int roleID, int birthYear, int contactInformationID, int statusID, String email, String firstName, String lastName, String password, LocalDateTime time) {
        this.roleID = roleID;
        this.birthYear = birthYear;
        this.contactInformationID = contactInformationID;
        this.statusID = statusID;
        this.email = email;
        this.lastName = lastName;
        this.firstName = firstName;
        this.password = password;
        this.time = time;
    }

    public Account(int roleID, int birthYear, int contactInformationID, int statusID, String email, String firstName, String lastName, int accountID) {
        this.roleID = roleID;
        this.birthYear = birthYear;
        this.contactInformationID = contactInformationID;
        this.statusID = statusID;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.accountID = accountID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public int getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(int birthYear) {
        this.birthYear = birthYear;
    }

    public int getContactInformationID() {
        return contactInformationID;
    }

    public void setContactInformationID(int contactInformationID) {
        this.contactInformationID = contactInformationID;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }
}
