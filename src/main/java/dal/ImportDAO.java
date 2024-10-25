package dal;


import model.Import;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ImportDAO extends DBContext {
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Import();
    }


    public List<Import> getAllImports() {
        List<Import> imports = new ArrayList<>();
        String sql = "SELECT i.ImportID, a.Name AS AccountName, w.Name AS WarehouseName, "
                + "s.Name AS SupplierName, i.Time "
                + "FROM Import i "
                + "JOIN Staff st ON i.StaffID = st.StaffID "
                + "JOIN Account a ON st.AccountID = a.AccountID "
                + "JOIN Warehouse w ON i.WarehouseID = w.WarehouseID "
                + "JOIN Supplier s ON i.SupplierID = s.SupplierID";
        try (
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Import imp = new Import();
                imp.setImportID(rs.getInt("ImportID"));
                imp.setAccountName(rs.getString("AccountName"));
                imp.setWarehouseName(rs.getString("WarehouseName"));
                imp.setSupplierName(rs.getString("SupplierName"));

                // Convert SQL Timestamp to LocalDateTime
                Timestamp timestamp = rs.getTimestamp("Time");
                if (timestamp != null) {
                    imp.setTime(timestamp.toLocalDateTime());
                }

                imports.add(imp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imports;
    }

    // Create a new import record


}
