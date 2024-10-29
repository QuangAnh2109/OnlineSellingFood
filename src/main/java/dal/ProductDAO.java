package dal;

import model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Certification;
import model.CertificateIssuer;
import model.Unit;
import model.Origin;
import model.ProductStatus;
import model.Discount;

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
    public Vector<Product> getAllProducts() {
        Vector<Product> products = new Vector<>();
        String sql = "SELECT * FROM Product WHERE StatusID != ?"; // Assuming status 0 is inactive
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, 0);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                products.add(extractProductFromResultSet(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public List<String> getAllProductNames() {
        List<String> productNames = new ArrayList<>();
        String sql = "SELECT Name FROM Product WHERE StatusID != ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, 0);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                productNames.add(rs.getString("Name"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productNames;
    }

    public Vector<Product> getHotProducts() {
        Vector<Product> products = new Vector<>();
        // Modified to use ImportProduct table for quantity
        String sql = "SELECT p.*, SUM(ip.InventoryQuantity) as TotalQuantity " +
                "FROM Product p " +
                "LEFT JOIN ImportProduct ip ON p.ProductID = ip.ProductID " +
                "WHERE p.StatusID != ? " +
                "GROUP BY p.ProductID, p.Name, p.Price, p.DiscountID, p.Weight, " +
                "p.CategoryID, p.ManufacturerID, p.OriginID, p.UnitID, " +
                "p.CertificationID, p.StatusID, p.Detail " +
                "ORDER BY TotalQuantity ASC " +
                "OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, 0);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                products.add(extractProductFromResultSet(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public int insertProduct(Product product) {
        String sql = "INSERT INTO Product (Name, Price, DiscountID, Weight, CategoryID, " +
                "ManufacturerID, OriginID, UnitID, CertificationID, StatusID, Detail) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, product.getName());
            stmt.setInt(2, product.getPrice());
            if (product.getDiscountID() != null) {
                stmt.setInt(3, product.getDiscountID());
            } else {
                stmt.setNull(3, java.sql.Types.INTEGER);
            }
            stmt.setInt(4, product.getWeight());
            stmt.setInt(5, product.getCategoryID());
            stmt.setInt(6, product.getManufacturerID());
            stmt.setInt(7, product.getOriginID());
            stmt.setInt(8, product.getUnitID());
            stmt.setInt(9, product.getCertificationID());
            stmt.setInt(10, product.getStatusID());
            stmt.setString(11, product.getDetail());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int updateProduct(Product product) {
        String sql = "UPDATE Product SET Name = ?, Price = ?, DiscountID = ?, " +
                "Weight = ?, CategoryID = ?, ManufacturerID = ?, OriginID = ?, " +
                "UnitID = ?, CertificationID = ?, StatusID = ?, Detail = ? " +
                "WHERE ProductID = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, product.getName());
            stmt.setInt(2, product.getPrice());
            if (product.getDiscountID() != null) {
                stmt.setInt(3, product.getDiscountID());
            } else {
                stmt.setNull(3, java.sql.Types.INTEGER);
            }
            stmt.setInt(4, product.getWeight());
            stmt.setInt(5, product.getCategoryID());
            stmt.setInt(6, product.getManufacturerID());
            stmt.setInt(7, product.getOriginID());
            stmt.setInt(8, product.getUnitID());
            stmt.setInt(9, product.getCertificationID());
            stmt.setInt(10, product.getStatusID());
            stmt.setString(11, product.getDetail());
            stmt.setInt(12, product.getProductID());

            return stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int deleteProduct(int productId) {
        // Update status to indicate deletion instead of actual deletion
        String sql = "UPDATE Product SET StatusID = ? WHERE ProductID = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setInt(1, 0); // Assuming 0 is the status for deleted/inactive products
            stmt.setInt(2, productId);
            return stmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    private Product extractProductFromResultSet(ResultSet rs) throws SQLException {
        return new Product(
                rs.getInt("ProductID"),
                rs.getInt("Price"),
                rs.getObject("DiscountID", Integer.class),
                rs.getInt("Weight"),
                rs.getInt("CategoryID"),
                rs.getInt("ManufacturerID"),
                rs.getInt("OriginID"),
                rs.getInt("UnitID"),
                rs.getInt("CertificationID"),
                rs.getInt("StatusID"),
                rs.getString("Name"),
                rs.getString("Detail")
        );
    }
}