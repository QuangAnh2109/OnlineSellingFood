package model;

public class OrderProduct {
    private Integer orderID;
    private Integer importID;
    private Integer productID;
    private Integer price;
    private Integer quantity;
    private String feedback;
    private Integer star;

    public OrderProduct() {
    }

    public OrderProduct(Integer orderID, Integer importID, Integer productID, Integer price, Integer quantity, String feedback, Integer star) {
        this.orderID = orderID;
        this.importID = importID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
        this.feedback = feedback;
        this.star = star;
    }

    public Integer getOrderID() {
        return orderID;
    }

    public void setOrderID(Integer orderID) {
        this.orderID = orderID;
    }

    public Integer getImportID() {
        return importID;
    }

    public void setImportID(Integer importID) {
        this.importID = importID;
    }

    public Integer getProductID() {
        return productID;
    }

    public void setProductID(Integer productID) {
        this.productID = productID;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }
}
