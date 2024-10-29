package dto;

public class FeedbackResponse {
    private int customerID;
    private String customerName;
    private int star;
    private String feedback,time;

    public FeedbackResponse() {
    }

    public FeedbackResponse(int customerID, String customerName, int star, String feedback, String time) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.star = star;
        this.feedback = feedback;
        this.time = time;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
