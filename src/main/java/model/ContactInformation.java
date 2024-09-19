package model;

public class ContactInformation {
    private int contactInformationID;
    private String address, phoneNumber; //len between 6 and 11

    public ContactInformation() {
    }

    public ContactInformation(int contactInformationID, String address, String phoneNumber) {
        this.contactInformationID = contactInformationID;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    public int getContactInformationID() {
        return contactInformationID;
    }

    public void setContactInformationID(int contactInformationID) {
        this.contactInformationID = contactInformationID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
