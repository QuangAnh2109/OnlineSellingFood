package model;

public class PasswordReset {
    private int AccountID;
    private String Password;
    private String ExpiryDateTime;

    public PasswordReset() {
    }

    public PasswordReset(int accountID, String password, String expiryDateTime) {
        this.AccountID = accountID;
        this.Password = password;
        this.ExpiryDateTime = expiryDateTime;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int accountID) {
        AccountID = accountID;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getExpiryDateTime() {
        return ExpiryDateTime;
    }

    public void setExpiryDateTime(String expiryDateTime) {
        ExpiryDateTime = expiryDateTime;
    }
}
