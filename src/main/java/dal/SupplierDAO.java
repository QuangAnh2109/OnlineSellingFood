package dal;

import model.Import;
import model.Supplier;
import model.Warehouse;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class SupplierDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Supplier(rs.getInt("SupplierID"),rs.getInt("ContactInformationID"),rs.getString("Name"),rs.getString("Note"));
    }
    public List<Supplier> getAllSuppliers() throws SQLException {
        List<Supplier> suppliers = new ArrayList<>();
        String sql = "SELECT * FROM Supplier"; // Thay đổi tên bảng nếu cần

        try (
                PreparedStatement stmt = connection.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Supplier supplier = new Supplier();
                supplier.setSupplierID(rs.getInt("SupplierID")); // Thay đổi tên cột nếu cần
                supplier.setName(rs.getString("Name")); // Thay đổi tên cột nếu cần
                supplier.setContactInformationID(rs.getInt("ContactInformationID")); // Thay đổi tên cột nếu cần
                supplier.setNote(rs.getString("Note")); // Thay đổi tên cột nếu cần
                suppliers.add(supplier);
            }
        }
        return suppliers;
    }

    // Thêm nhà cung cấp mới
    public void insertSupplier(Supplier supplier) throws SQLException {
        String sql = "INSERT INTO Supplier (Name, ContactInformationID, Note) VALUES (?, ?, ?)"; // Thay đổi tên bảng và cột nếu cần
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, supplier.getName());
            stmt.setInt(2, supplier.getContactInformationID());
            stmt.setString(3, supplier.getNote());
            stmt.executeUpdate();
        }
    }

    // Cập nhật thông tin nhà cung cấp
    public void updateSupplier(Supplier supplier) throws SQLException {
        String sql = "UPDATE Supplier SET Name = ?, ContactInformationID = ?, Note = ? WHERE SupplierID = ?"; // Thay đổi tên bảng và cột nếu cần
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, supplier.getName());
            stmt.setInt(2, supplier.getContactInformationID());
            stmt.setString(3, supplier.getNote());
            stmt.setInt(4, supplier.getSupplierID());
            stmt.executeUpdate();
        }
    }

    // Xóa nhà cung cấp
    public void deleteSupplier(int supplierID) throws SQLException {
        String sql = "DELETE FROM Supplier WHERE SupplierID = ?"; // Thay đổi tên bảng và cột nếu cần
        try (
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, supplierID);
            stmt.executeUpdate();
        }
    }

    public List<Supplier> getAllSupplierActivity(){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Supplier ");
            return (List<Supplier>) (Object) getListObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return Collections.emptyList();
    }
}
