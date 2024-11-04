package dal;

import model.Manufacturer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class ManufacturerDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Manufacturer(rs.getInt(1),rs.getString(3),rs.getString(2));
    }

    public List<Manufacturer> getAllManufacturer() {
        try{
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Manufacturer");
            return (List<Manufacturer>) (Object) getListObject(ps);
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return Collections.emptyList();
    }

    public Manufacturer getManufacturerByID(int manufacturerID) {
        try{
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Manufacturer WHERE ManufacturerID = ?");
            ps.setInt(1,manufacturerID);
            return (Manufacturer) getObject(ps);
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return null;
    }
}
