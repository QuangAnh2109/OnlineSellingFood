package dal;

import model.Supplier;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class SupplierDAO extends DBContext {
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Supplier(
                rs.getInt("SupplierID"),
                rs.getInt("ContactInformationID"),
                rs.getString("Name"),
                rs.getString("Note")
        );
    }

    public Supplier getSupplier(int supplierID) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Supplier WHERE SupplierID=?");
            ps.setInt(1, supplierID);
            return (Supplier) getObject(ps);
        } catch (SQLException e) {
            logger.info(getClass().getName() + ": " + e.getMessage());
        }
        return null;
    }

    public List<Supplier> getAllSuppliers() {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Supplier");
            return (List<Supplier>) (Object) getListObject(ps);
        } catch (SQLException e) {
            logger.info(getClass().getName() + ": " + e.getMessage());
        }
        return Collections.emptyList();
    }

    public boolean updateSupplier(Supplier supplier) {
        try {
            PreparedStatement ps = connection.prepareStatement("UPDATE Supplier SET ContactInformationID=?, Name=?, Note=? WHERE SupplierID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, supplier.getContactInformationID());
            ps.setNString(2, supplier.getName());
            ps.setNString(3, supplier.getNote());
            ps.setInt(4, supplier.getSupplierID());
            ResultSet rs = executeUpdate(ps);
            if (rs != null) return rs.next();
        } catch (SQLException e) {
            logger.info(getClass().getName() + ": " + e.getMessage());
        }
        return false;
    }

    public Integer addSupplier(Supplier supplier) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO Supplier (ContactInformationID, Name, Note) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, supplier.getContactInformationID());
            ps.setNString(2, supplier.getName());
            ps.setNString(3, supplier.getNote());
            ResultSet rs = executeUpdate(ps);
            if (rs != null && rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            logger.info(getClass().getName() + ": " + e.getMessage());
        }
        return null;
    }

    public List<Supplier> searchSuppliers(String keyword) {
        List<Supplier> suppliers = new ArrayList<>();
        String sql = "SELECT SupplierID, Name, ContactInformationID, Note FROM Supplier WHERE Name LIKE ?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int supplierID = rs.getInt("SupplierID");
                String name = rs.getString("Name");
                int contactInformationID = rs.getInt("ContactInformationID");
                String note = rs.getString("Note");
                Supplier supplier = new Supplier(supplierID, contactInformationID, name, note);
                suppliers.add(supplier);
            }
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
        }
        return suppliers;
    }
    public boolean deleteSupplier(int supplierID) {
        String sql = "DELETE FROM Supplier WHERE SupplierID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, supplierID);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
        }
        return false;
    }

}
