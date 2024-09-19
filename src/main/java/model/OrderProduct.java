package model;

public class OrderProduct {
    private int orderID, importID, productID, price, quantity;
    private String feedback;
    private Integer star;

    public OrderProduct() {
    }

    public OrderProduct(int orderID, int importID, int productID, int price, int quantity, String feedback, Integer star) {
        this.orderID = orderID;
        this.importID = importID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
        this.feedback = feedback;
        this.star = star;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getImportID() {
        return importID;
    }

    public void setImportID(int importID) {
        this.importID = importID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
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
