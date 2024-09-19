package model;

import java.time.LocalDateTime;

public class Discount {
    private int discountID, discountPercent;
    private LocalDateTime startTime, endTime;

    public Discount() {
    }

    public Discount(int discountID, int discountPercent, LocalDateTime startTime, LocalDateTime endTime) {
        this.discountID = discountID;
        this.discountPercent = discountPercent;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }
}
