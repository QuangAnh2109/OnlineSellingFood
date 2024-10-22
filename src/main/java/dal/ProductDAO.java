package dal;

import model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBContext {
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        Product product = new Product();
        product.setProductID(rs.getInt("ProductID"));
        product.setPrice(rs.getInt("Price"));
        product.setDiscountID(rs.getInt("DiscountID"));
        product.setWeight(rs.getInt("Weight"));
        product.setCategoryID(rs.getInt("CategoryID"));
        product.setManufacturerID(rs.getInt("ManufacturerID"));
        product.setOriginID(rs.getInt("OriginID"));
        product.setUnitID(rs.getInt("UnitID"));
        product.setCertificationID(rs.getInt("CertificationID"));
        product.setStatusID(rs.getInt("StatusID"));
        product.setName(rs.getString("Name"));
        product.setDetail(rs.getString("Detail"));
        // Thêm debug log
        System.out.println("Created Product: " + product.getProductID() + " - " + product.getName());
        return product;
    }

    public Product getProductByID(int productID) {
        String sql = "SELECT * FROM Product WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);

            // Debug log
            System.out.println("Executing SQL: " + sql + " with ID: " + productID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("Found product with ID: " + productID);
                return (Product) getObjectByRs(rs);
            } else {
                System.out.println("No product found with ID: " + productID);
            }
        } catch (SQLException ex) {
            System.out.println("Error getting product: " + ex.getMessage());
            logger.info(ex.getMessage());
        }
        return null;
    }
}