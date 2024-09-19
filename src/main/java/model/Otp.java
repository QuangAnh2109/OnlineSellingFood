package model;

import java.time.LocalDateTime;

public class Otp {
    private int accountID;
    private String code;
    private LocalDateTime expiryDateTime;

    public Otp() {
    }

    public Otp(int accountID, String code, LocalDateTime expiryDateTime) {
        this.accountID = accountID;
        this.code = code;
        this.expiryDateTime = expiryDateTime;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public LocalDateTime getExpiryDateTime() {
        return expiryDateTime;
    }

    public void setExpiryDateTime(LocalDateTime expiryDateTime) {
        this.expiryDateTime = expiryDateTime;
    }
}
