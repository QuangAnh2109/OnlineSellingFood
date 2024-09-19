package model;

import java.time.LocalDateTime;

public class ImportProduct {
    private int importID, productID, price, importQuantity, inventoryQuantity;
    private LocalDateTime mfg, exp;

    public ImportProduct() {
    }

    public ImportProduct(int importID, int productID, int price, int importQuantity, int inventoryQuantity, LocalDateTime mfg, LocalDateTime exp) {
        this.importID = importID;
        this.productID = productID;
        this.price = price;
        this.importQuantity = importQuantity;
        this.inventoryQuantity = inventoryQuantity;
        this.mfg = mfg;
        this.exp = exp;
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

    public int getImportQuantity() {
        return importQuantity;
    }

    public void setImportQuantity(int importQuantity) {
        this.importQuantity = importQuantity;
    }

    public int getInventoryQuantity() {
        return inventoryQuantity;
    }

    public void setInventoryQuantity(int inventoryQuantity) {
        this.inventoryQuantity = inventoryQuantity;
    }

    public LocalDateTime getMfg() {
        return mfg;
    }

    public void setMfg(LocalDateTime mfg) {
        this.mfg = mfg;
    }

    public LocalDateTime getExp() {
        return exp;
    }

    public void setExp(LocalDateTime exp) {
        this.exp = exp;
    }
}
