package dal;

import model.Unit;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class UnitDAO extends DBContext {
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Unit(rs.getInt(1), rs.getString(2), rs.getObject(3,Integer.class), rs.getObject(4,Integer.class));
    }

    public List<Unit> getAllUnit() {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Unit");
            return (List<Unit>) (Object) getListObject(ps);
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return Collections.emptyList();
    }

    public Unit getUnitByID(int unitID) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Unit WHERE UnitID = ?");
            ps.setInt(1, unitID);
            return (Unit) getObject(ps);
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        return null;
    }
}
