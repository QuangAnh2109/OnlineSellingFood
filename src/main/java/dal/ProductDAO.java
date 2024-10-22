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
        return product;
    }

    // Lấy sản phẩm theo ID (cần cho CartDAO)
    public Product getProductByID(int productID) {
        String sql = "SELECT * FROM Product WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);

            Object obj = getObject(ps);
            return obj != null ? (Product) obj : null;
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
            return null;
        }
    }

    // Lấy nhiều sản phẩm theo danh sách ID
    public List<Product> getProductsByIDs(List<Integer> productIDs) {
        if (productIDs == null || productIDs.isEmpty()) {
            return new ArrayList<>();
        }

        String placeholders = String.join(",", java.util.Collections.nCopies(productIDs.size(), "?"));
        String sql = "SELECT * FROM Product WHERE ProductID IN (" + placeholders + ")";

        List<Product> products = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            for (int i = 0; i < productIDs.size(); i++) {
                ps.setInt(i + 1, productIDs.get(i));
            }

            List<Object> objects = getListObject(ps);
            for (Object obj : objects) {
                products.add((Product) obj);
            }
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
        }
        return products;
    }

    // Kiểm tra sản phẩm có tồn tại không (hữu ích khi thêm vào giỏ hàng)
    public boolean checkProductExists(int productID) {
        String sql = "SELECT COUNT(*) FROM Product WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
        }
        return false;
    }

    // Lấy giá sản phẩm (hữu ích khi tính tổng tiền giỏ hàng)
    public Integer getProductPrice(int productID) {
        String sql = "SELECT Price FROM Product WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("Price");
            }
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
        }
        return null;
    }
}
