package model;

public class PaymentStatement {
    private int paymentStatementID;
    private String name;

    public PaymentStatement() {
    }

    public int getPaymentStatementID() {
        return paymentStatementID;
    }

    public void setPaymentStatementID(int paymentStatementID) {
        this.paymentStatementID = paymentStatementID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
