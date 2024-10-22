package dal;

import model.Unit;

import java.sql.*;
import java.util.Collections;
import java.util.List;

public class UnitDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Unit(rs.getInt("UnitID"), rs.getString("Name"), rs.getObject("BaseUnitID", Integer.class), rs.getObject("ConversionRate", Integer.class));
    }

    public List<Unit> getAllUnit(){
        try{
            PreparedStatement ps = connection.prepareStatement("select UnitID, Name, BaseUnitID, ConversionRate from Unit");
            return (List<Unit>)(Object)getListObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return Collections.emptyList();
    }

    public List<Unit> getAllUnit(String search){
        try{
            PreparedStatement ps = connection.prepareStatement("select UnitID, Name, BaseUnitID, ConversionRate from Unit where Name LIKE ?");
            ps.setNString(1,"%"+search+"%");
            return (List<Unit>)(Object)getListObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return Collections.emptyList();
    }

    public Unit getUnitByID(int id){
        try{
            PreparedStatement ps = connection.prepareStatement("select UnitID, Name, BaseUnitID, ConversionRate from Unit where UnitID=?");
            ps.setInt(1, id);
            return (Unit)getObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return null;
    }

    public boolean deleteUnit(int id){
        try{
            PreparedStatement ps = connection.prepareStatement("DELETE FROM Unit WHERE UnitID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, id);
            ResultSet rs = executeUpdate(ps);
            if(rs!=null)return rs.next();
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return false;
    }

    public boolean updateUnit(Unit unit){
        try{
            PreparedStatement ps = connection.prepareStatement("update Unit set Name=?, BaseUnitID=?, ConversionRate=? where UnitID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, unit.getName());
            ps.setInt(2, unit.getBaseUnitID());
            ps.setInt(3, unit.getConversionRate());
            ps.setInt(4, unit.getUnitID());
            ResultSet rs = executeUpdate(ps);
            if(rs!=null)return rs.next();
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return false;
    }

    public Integer addUnit(String name, int baseUnitID, int conversionRate){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into Unit (Name, BaseUnitID, ConversionRate) values (?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setNString(1, name);
            ps.setInt(2, baseUnitID);
            ps.setInt(3, conversionRate);
            ResultSet rs = executeUpdate(ps);
            if(rs!=null && rs.next()) return rs.getInt(1);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return null;
    }
}