package dal;


import dto.ImportRespone;
import dto.ProductDiscountResponse;
import model.Import;
import model.Staff;

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
        return new Import(rs.getInt("inportID"),rs.getInt("staffID"),rs.getInt("warehouseID"),rs.getInt("supplierID"),rs.getTimestamp("time").toLocalDateTime());
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

    public boolean addImport(int staffID, int warehouseID, int supplierID, String time) {
        String query = "INSERT INTO Import (StaffID, WarehouseID, SupplierID, Time) VALUES (?, ?, ?, ?)";
        try (
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, staffID);
            ps.setInt(2, warehouseID);
            ps.setInt(3, supplierID);
            ps.setString(4, time);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có bản ghi được thêm
        } catch (SQLException e) {
            e.printStackTrace(); // In ra lỗi để biết nguyên nhân
        }
        return false; // Trả về false nếu có lỗi
    }


    public Import getImportID(int importID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Import where ImportID=?");
            ps.setInt(1, importID);
            return (Import)getObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return null;
    }

}
