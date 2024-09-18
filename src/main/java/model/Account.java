package model;

import controller.Encrypt;
import controller.Validate;
import java.time.LocalDateTime;
import java.sql.Date;

public class Account {
    private int accountID;
    private Role role;
    private String email,firstName,lastName;
    private int birthYear;
    ContactInformation contactInformation;
    private String password;
    private LocalDateTime time;
    private int statusID;


    public Account() {
    }


    public Account(int accountID, Role role, String email, String firstName, String lastName, int birthYear, ContactInformation contactInformation, String password, LocalDateTime time, int statusID) {
        this.accountID = accountID;
        this.role = role;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.birthYear = birthYear;
        this.contactInformation = contactInformation;
        this.password = password;
        this.time = time;
        this.statusID = statusID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
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

    public int getBirthYear() {
        return birthYear;
    }

    public void setBirthYear(int birthYear) {
        this.birthYear = birthYear;
    }

    public ContactInformation getContactInformation() {
        return contactInformation;
    }

    public void setContactInformation(ContactInformation contactInformation) {
        this.contactInformation = contactInformation;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    //    public Integer getAccountID() {
//        return accountID;
//    }
//
//    public void setAccountID(String accountID) throws Exception {
//        Validate.checkString(accountID);
//        int number = Integer.parseInt(accountID);
//        Validate.checkInt(number,1,Integer.MAX_VALUE);
//        this.accountID = number;
//    }
//
//    public Integer getRoleID() {
//        return roleID;
//    }
//
//    public void setRoleID(String roleID) throws Exception {
//        Validate.checkString(roleID);
//        int number = Integer.parseInt(roleID);
//        Validate.checkInt(number, 1, Integer.MAX_VALUE);
//        this.roleID = number;
//    }
//
//    public String getEmail() {
//        return email;
//    }
//
//    public void setEmail(String email) throws Exception {
//        Validate.checkString(email,1,100);
//        this.email = email;
//    }
//
//    public String getFirstName() {
//        return firstName;
//    }
//
//    public void setFirstName(String firstName) throws Exception {
//        Validate.checkString(firstName,1,100);
//        this.firstName = firstName;
//    }
//
//    public String getLastName() {
//        return lastName;
//    }
//
//    public void setLastName(String lastName) throws Exception {
//        Validate.checkString(lastName,1,100);
//        this.lastName = lastName;
//    }
//
//    public Integer getBirthYear() {
//        return birthYear;
//    }
//
//    public void setBirthYear(String birthYear) throws Exception {
//        Validate.checkString(birthYear);
//        int year = Integer.parseInt(birthYear);
//        Validate.checkInt(year, 1900, LocalDate.now().getYear() - 1);
//        this.birthYear = year;
//    }
//
//    public Integer getContactInformationID() {
//        return contactInformationID;
//    }
//
//    public void setContactInformationID(String contactInformationID) throws Exception {
//        Validate.checkString(contactInformationID);
//        int number = Integer.parseInt(contactInformationID);
//        Validate.checkInt(number, 1, Integer.MAX_VALUE);
//        this.contactInformationID = number;
//    }
//
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) throws Exception {
//        Validate.checkString(password,6,Integer.MAX_VALUE);
//        Encrypt encrypt = new Encrypt();
//        this.password = encrypt.toHexString(encrypt.getSHA(password));
//    }
//
//    public void setTime(String time) throws Exception {
//        DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
//        LocalDateTime parsedTime = LocalDateTime.parse(time, formatter);
//        this.time = parsedTime.format(formatter);
//    }
//
//    public String getTime() {
//        return time;
//    }
//
//    public Integer getStatusID() {
//        return statusID;
//    }
//
//    public void setStatusID(String statusID) throws Exception {
//        Validate.checkString(statusID);
//        int number = Integer.parseInt(statusID);
//        Validate.checkInt(number, 1, Integer.MAX_VALUE);
//        this.statusID = number;
//    }
}
