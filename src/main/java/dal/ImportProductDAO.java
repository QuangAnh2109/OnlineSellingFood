package dal;


import dto.ImportProductResponse;
import model.ImportProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ImportProductDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new ImportProduct();
    }

    public List<ImportProductResponse> getAllImportProducts(int importID) {
        List<ImportProductResponse> importProducts = new ArrayList<>();
        String query = "SELECT ip.ImportID, p.Name, ip.Mfg, ip.Exp, ip.Price, ip.ImportQuantity, "
                + "ip.InventoryQuantity, u.Name as UnitName "
                + "FROM ImportProduct ip "
                + "JOIN Product p ON ip.ProductID = p.ProductID "
                + "JOIN Unit u ON ip.UnitID = u.UnitID "
                + "WHERE ip.ImportID = "+ importID;

        try (
             PreparedStatement stmt = connection.prepareStatement(query);

             ResultSet rs = stmt.executeQuery()) {
           // stmt.setInt(1, importID);
            while (rs.next()) {
                importProducts.add(new ImportProductResponse(rs.getInt(1)
                ,rs.getString(2)
                ,rs.getTimestamp(3).toLocalDateTime()
                ,rs.getTimestamp(4).toLocalDateTime()
                ,rs.getInt(5)
                ,rs.getInt(6)
                        ,rs.getInt(7)
                ,rs.getString(7)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return importProducts;
    }
    public boolean addImportProduct(int importID, int productID, String mfg, String exp,int price, int importQuantity, int inventoryQuantity, int unitID) {
        String query = "INSERT INTO ImportProduct (ImportID, ProductID, Mfg, Exp, Price, "
                + "ImportQuantity, InventoryQuantity, UnitID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (
                PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, importID);
            ps.setInt(2, productID);
            ps.setString(3, mfg);
            ps.setString(4, exp);
            ps.setInt(5, price);
            ps.setInt(6, importQuantity);
            ps.setInt(7, inventoryQuantity);
            ps.setInt(8, unitID);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có bản ghi được thêm
        } catch (SQLException e) {
            e.printStackTrace(); // In ra lỗi để biết nguyên nhân
        }
        return false; // Trả về false nếu có lỗi
    }
}



