package dal;

import model.Manufacturer;
import model.Staff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class ManufacterDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Manufacturer(rs.getInt("ManufacturerID"),rs.getString("Introduce"),rs.getString("Name"),rs.getInt("productCount"));
    }
    public Manufacturer getManufacturerByID(int manufacturerID) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "SELECT ManufacturerID, Introduce, Name FROM Manufacturer WHERE ManufacturerID=?"
            );
            ps.setInt(1, manufacturerID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Manufacturer manufacturer = new Manufacturer();
                manufacturer.setManufacturerID(rs.getInt("ManufacturerID"));
                manufacturer.setIntroduce(rs.getString("Introduce"));
                manufacturer.setName(rs.getString("Name"));
                return manufacturer;
            }
        } catch (SQLException e) {
            logger.info(getClass().getName() + ": " + e.getMessage());
        }
        return null;
    }
    public Integer addManufacturer(Manufacturer manufacturer) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "INSERT INTO Manufacturer (Introduce, Name) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS
            );
            ps.setString(1, manufacturer.getIntroduce());
            ps.setString(2, manufacturer.getName());
            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // Trả về ManufacturerID mới được tạo
                }
            }
        } catch (SQLException e) {
            logger.info(getClass().getName() + ": " + e.getMessage());
        }
        return null;
    }
    public boolean updateManufacturer(Manufacturer manufacturer) {
        try {
            // Kiểm tra xem tên mới có trùng với tên của nhà sản xuất khác không
            Manufacturer existingManufacturer = getManufacturerByID(manufacturer.getManufacturerID());
            if (!existingManufacturer.getName().equals(manufacturer.getName())) {
                // Chỉ kiểm tra nếu tên đã thay đổi
                if (isManufacturerNameExists(manufacturer.getName())) {
                    return false; // Tên đã tồn tại, không thể cập nhật
                }
            }

            PreparedStatement ps = connection.prepareStatement(
                    "UPDATE Manufacturer SET Introduce=?, Name=? WHERE ManufacturerID=?"
            );
            ps.setString(1, manufacturer.getIntroduce());
            ps.setString(2, manufacturer.getName());
            ps.setInt(3, manufacturer.getManufacturerID());

            int affectedRows = ps.executeUpdate();
            return affectedRows > 0; // Trả về true nếu cập nhật thành công
        } catch (SQLException e) {
            logger.info(getClass().getName() + ": " + e.getMessage());
        }
        return false;
    }
    public List<Manufacturer> getAllManufacturers() {
        List<Manufacturer> manufacturers = new ArrayList<>();
        try {
            String query = "SELECT m.ManufacturerID, m.Introduce, m.Name, COUNT(p.ProductID) AS ProductCount " +
                    "FROM Manufacturer m " +
                    "LEFT JOIN Product p ON m.ManufacturerID = p.ManufacturerID " +
                    "GROUP BY m.ManufacturerID, m.Introduce, m.Name";
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Manufacturer manufacturer = new Manufacturer();
                manufacturer.setManufacturerID(rs.getInt("ManufacturerID"));
                manufacturer.setIntroduce(rs.getString("Introduce"));
                manufacturer.setName(rs.getString("Name"));
                manufacturer.setProductCount(rs.getInt("ProductCount")); // Add product count
                manufacturers.add(manufacturer);
            }
        } catch (SQLException e) {
            logger.info(getClass().getName() + ": " + e.getMessage());
        }
        return manufacturers;
    }

    public boolean isManufacturerNameExists(String name) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "SELECT ManufacturerID FROM Manufacturer WHERE Name = ?"
            );
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            return rs.next(); // Return true if a manufacturer with the same name exists
        } catch (SQLException e) {
            logger.info(getClass().getName() + ": " + e.getMessage());
        }
        return false;
    }
    public boolean deleteManufacturer(int manufacturerID) {
        try {
            PreparedStatement ps = connection.prepareStatement(
                    "DELETE FROM Manufacturer WHERE ManufacturerID = ?"
            );
            ps.setInt(1, manufacturerID);
            int affectedRows = ps.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            logger.info(getClass().getName() + ": " + e.getMessage());
        }
        return false;
    }
    public List<Manufacturer> searchManufacturersByName(String name) {
        List<Manufacturer> manufacturers = new ArrayList<>();
        try {
            String query = "SELECT ManufacturerID, Introduce, Name FROM Manufacturer WHERE Name LIKE ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + name.trim() + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Manufacturer manufacturer = new Manufacturer();
                manufacturer.setManufacturerID(rs.getInt("ManufacturerID"));
                manufacturer.setIntroduce(rs.getString("Introduce"));
                manufacturer.setName(rs.getString("Name"));
                manufacturers.add(manufacturer);
            }
        } catch (SQLException e) {
            logger.info(getClass().getName() + ": " + e.getMessage());
        }
        return manufacturers;
    }
    public class TextTruncator {
        private static final int MAX_LENGTH = 40;

        public static String truncate(String text) {
            if (text == null) return "";
            if (text.length() <= MAX_LENGTH) return text;

            // Find the last space before MAX_LENGTH to avoid cutting words
            int lastSpace = text.substring(0, MAX_LENGTH).lastIndexOf(' ');
            int truncateIndex = lastSpace > 0 ? lastSpace : MAX_LENGTH;

            return text.substring(0, truncateIndex) + "...";
        }
    }
}
