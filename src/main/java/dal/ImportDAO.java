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
                Import imp = new Import(
                        rs.getInt("ImportID"),
                        rs.getString("AccountName"),
                        rs.getString("WarehouseName"),
                        rs.getString("SupplierName"),
                        rs.getTimestamp("Time").toLocalDateTime()
                );
                imports.add(imp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imports;
    }

    // Create a new import record
    public void insertImport(int staffID, int warehouseID, int supplierID, Timestamp time) throws SQLException {
        String sql = "INSERT INTO imports (staffID, warehouseID, supplierID, importTime) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, staffID);
            statement.setInt(2, warehouseID);
            statement.setInt(3, supplierID);
            statement.setTimestamp(4, time);
            statement.executeUpdate();
        }
    }

    // Update an existing import record
    public void updateImport(int importID, int warehouseID, int supplierID, Timestamp time) throws SQLException {
        String sql = "UPDATE imports SET warehouseID = ?, supplierID = ?, importTime = ? WHERE importID = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, warehouseID);
            statement.setInt(2, supplierID);
            statement.setTimestamp(3, time);
            statement.setInt(4, importID);
            statement.executeUpdate();
        }
    }

    // Delete an import record
    public void deleteImport(int importID) throws SQLException {
        String query = "DELETE FROM Import WHERE ImportID = ?";
        try (
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, importID);
            stmt.executeUpdate();
        }
    }

    // Method to retrieve an import record by ID
    public Import getImportById(int importID) throws SQLException {
        String query = "SELECT * FROM Import WHERE ImportID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, importID);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int staffID = resultSet.getInt("StaffID");
                    int warehouseID = resultSet.getInt("WarehouseID");
                    int supplierID = resultSet.getInt("SupplierID");
                    Timestamp time = resultSet.getTimestamp("Time");

                    // Create and return the Import object
                    return new Import(importID, staffID, warehouseID, supplierID, time.toLocalDateTime());
                }
            }
        }
        return null;  // Return null if no record found
    }

}
