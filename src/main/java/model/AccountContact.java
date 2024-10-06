package model;

public class AccountContact {
    private Integer accountID;
    private Integer contactInformationID;

    public AccountContact() {
    }

    public AccountContact(Integer accountID, Integer contactInformationID) {
        this.accountID = accountID;
        this.contactInformationID = contactInformationID;
    }

    public Integer getAccountID() {
        return accountID;
    }

    public void setAccountID(Integer accountID) {
        this.accountID = accountID;
    }

    public Integer getContactInformationID() {
        return contactInformationID;
    }

    public void setContactInformationID(Integer contactInformationID) {
        this.contactInformationID = contactInformationID;
    }
}
