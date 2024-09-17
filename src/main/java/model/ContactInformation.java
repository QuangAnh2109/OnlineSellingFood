package model;

import controller.Validate;

public class ContactInformation {
    private Integer contactInformationID;
    private String address, phoneNumber; //len between 6 and 11

    public ContactInformation() {
    }

    public ContactInformation(Integer contactInformationID, String address, String phoneNumber) {
        this.contactInformationID = contactInformationID;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    public Integer getContactInformationID() {
        return contactInformationID;
    }

    public void setContactInformationID(String contactInformationID) throws Exception {
        Validate.checkString(contactInformationID);
        int number = Integer.parseInt(contactInformationID);
        Validate.checkInt(number,1,Integer.MAX_VALUE);
        this.contactInformationID = number;
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
