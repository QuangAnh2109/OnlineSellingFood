package dal;


import dto.ImportRespone;
import dto.ProductDiscountResponse;
import model.Import;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class ImportDAO extends DBContext {
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Import();
    }


    public List<ImportRespone> getImportList() {
        List<ImportRespone> importList = new Vector<ImportRespone>();
        String sql = "SELECT i.ImportID, a.Name AS AccountName, w.Name AS WarehouseName, " +
                "s.Name AS SupplierName, i.Time " +
                "FROM Import i " +
                "JOIN Staff st ON i.StaffID = st.StaffID " +
                "JOIN Account a ON st.AccountID = a.AccountID " +
                "JOIN Warehouse w ON i.WarehouseID = w.WarehouseID " +
                "JOIN Supplier s ON i.SupplierID = s.SupplierID";

        try (
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                importList.add(new ImportRespone(rs.getInt(1)
                ,rs.getString(2)
                ,rs.getString(3)
                ,rs.getString(4)
                , rs.getTimestamp(5).toLocalDateTime()));
            }
            return importList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Create a new import record


}
