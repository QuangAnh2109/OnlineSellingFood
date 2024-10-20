package dal;

import model.Unit;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UnitDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Unit(rs);
    }
}
