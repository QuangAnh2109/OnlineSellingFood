package dal;


import dto.ImportProductResponse;
import model.ImportProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                + "WHERE ip.ImportID = ?";

        try (
             PreparedStatement stmt = connection.prepareStatement(query);

             ResultSet rs = stmt.executeQuery()) {
            stmt.setInt(1, importID);
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
}
