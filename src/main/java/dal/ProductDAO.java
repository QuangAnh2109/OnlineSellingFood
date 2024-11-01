package dal;

import model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ProductDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Product(rs.getInt(1)
                ,rs.getInt(2)
                ,rs.getInt(3)
                ,rs.getInt(4)
                ,rs.getInt(5)
                ,rs.getInt(6)
                ,rs.getInt(7)
                ,rs.getInt(8)
                ,rs.getInt(9)
                ,rs.getInt(9)
                ,rs.getString(10)
                ,rs.getString(11));
    }
    public void deleteDiscount(int productID){
        String sql="UPDATE [dbo].[Product]\n" +
                "   SET \n" +
                "      [DiscountID] =NULL\n" +
                "      \n" +
                " WHERE ProductID=?";

        try{
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("ProductID"),
                        rs.getInt("Price"),
                        rs.getInt("DiscountID"),
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
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }
    public Product getProductById(int productId) {
        Product product = null;
        String sql = "SELECT * FROM Product WHERE ProductID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new Product(
                            rs.getInt("ProductID"),
                            rs.getInt("Price"),
                            rs.getInt("DiscountID"),
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
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }
    public List<String> getProductImages(int productId) {
        List<String> images = new ArrayList<>();
        String sql = "SELECT i.ImgLink FROM ProductImg pi " +
                "JOIN Img i ON pi.ImgID = i.ImgID " +
                "WHERE pi.ProductID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    images.add(rs.getString("ImgLink"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return images;
    }
    public int countProductsByCategory(int categoryID) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Product";

        // Nếu categoryID khác 0, thêm điều kiện vào truy vấn
        if (categoryID != 0) {
            sql += " WHERE CategoryID = ?";
        }

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            if (categoryID != 0) {
                ps.setInt(1, categoryID);
            }
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }
    public List<Product> getProductsByPageAndSort(int categoryID, int page, int pageSize, String sortBy, boolean ascending, String searchTerm) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product";

        // Nếu categoryID khác 0, thêm điều kiện vào truy vấn
        if (categoryID != 0) {
            sql += " WHERE CategoryID = ?";
        }

        // Thêm điều kiện tìm kiếm theo tên
        if (searchTerm != null && !searchTerm.isEmpty()) {
            sql += (categoryID != 0 ? " AND" : " WHERE") + " Name LIKE ?";
        }

        // Thêm phần sắp xếp
        sql += " ORDER BY " + sortBy + (ascending ? " ASC" : " DESC") +
                " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            int paramIndex = 1;
            if (categoryID != 0) {
                ps.setInt(paramIndex++, categoryID);
            }
            if (searchTerm != null && !searchTerm.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchTerm + "%");
            }
            ps.setInt(paramIndex++, (page - 1) * pageSize);
            ps.setInt(paramIndex++, pageSize);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product(
                            rs.getInt("ProductID"),
                            rs.getInt("Price"),
                            rs.getInt("DiscountID"),
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
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    public int countProductsByCategoryAndSearch(int categoryID, String searchTerm) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM Product";

        // Nếu categoryID khác 0, thêm điều kiện vào truy vấn
        if (categoryID != 0) {
            sql += " WHERE CategoryID = ?";
        }

        // Thêm điều kiện tìm kiếm theo tên
        if (searchTerm != null && !searchTerm.isEmpty()) {
            sql += (categoryID != 0 ? " AND" : " WHERE") + " Name LIKE ?";
        }

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            int paramIndex = 1;
            if (categoryID != 0) {
                ps.setInt(paramIndex++, categoryID);
            }
            if (searchTerm != null && !searchTerm.isEmpty()) {
                ps.setString(paramIndex++, "%" + searchTerm + "%"); // Tìm kiếm với wildcard
            }
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }
    public List<Product> get5RelatedProductsByManufacturer(int manufacturerID) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT TOP 5 * FROM Product WHERE ManufacturerID = ? ORDER BY ProductID DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, manufacturerID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product(
                            rs.getInt("ProductID"),
                            rs.getInt("Price"),
                            rs.getInt("DiscountID"),
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
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }




    public List<Product> get5ProductByDiscount() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT TOP 5 * FROM Product WHERE DiscountID IS NOT NULL ORDER BY DiscountID DESC";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("ProductID"),
                        rs.getInt("Price"),
                        rs.getInt("DiscountID"),
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
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }
    public List<Product> get4ProductByDiscount() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT TOP 4 * FROM Product WHERE DiscountID IS NOT NULL ORDER BY DiscountID ASC";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("ProductID"),
                        rs.getInt("Price"),
                        rs.getInt("DiscountID"),
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
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }


}
