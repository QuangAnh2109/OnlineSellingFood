package dal;

import model.Product;
import model.Supplier;
import model.Unit;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class UnitDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Unit(rs.getInt("unitID"),rs.getString("name"),rs.getInt("baseUnitID"),rs.getInt("conversionRate"));

        }
    public List<Unit> getAllUnit(){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Unit ");
            return (List<Unit>) (Object) getListObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return Collections.emptyList();
    }
}
