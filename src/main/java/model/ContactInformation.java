package model;

import controller.Validate;

public class ContactInformation {
    private int contactInformationID;
    private String address, phoneNumber; //len between 6 and 11

    public int getContactInformationID() {
        return contactInformationID;
    }

    public void setContactInformationID(String contactInformationID) throws Exception {
        Validate.checkString(contactInformationID);
        this.contactInformationID = Integer.parseInt(contactInformationID);
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) throws Exception {
        Validate.checkString(address, 1, 200);
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) throws Exception {
        Validate.checkString(phoneNumber,6,11);
        this.phoneNumber = phoneNumber;
    }
}
