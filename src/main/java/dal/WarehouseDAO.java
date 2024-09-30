package dal;

import model.Warehouse;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WarehouseDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Warehouse(rs.getInt("WarehouseID"), rs.getInt("ContactInformationID"), rs.getInt("StatusID"), rs.getString("Name"));
    }

    public Warehouse getWarehouse(int warehouseID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Warehouse where WarehouseID=?");
            ps.setInt(1, warehouseID);
            return (Warehouse)getObject(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public boolean updateWarehouse(Warehouse warehouse){
        try{
            PreparedStatement ps = connection.prepareStatement("update Warehouse set ContactInformationID=?, StatusID=?, Name=? where WarehouseID=?");
            ps.setInt(1, warehouse.getContactInformationID());
            ps.setInt(2, warehouse.getStatusID());
            ps.setNString(3, warehouse.getName());
            ps.setInt(4, warehouse.getWarehouseID());
            return executeUpdate(ps).next();
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public Integer addWarehouse(Warehouse warehouse){
        try{
            PreparedStatement ps = connection.prepareStatement("insert Warehouse (ContactInformationID,StatusID,Name) values (?,?,?)");
            ps.setInt(1, warehouse.getContactInformationID());
            ps.setInt(2, warehouse.getStatusID());
            ps.setNString(3, warehouse.getName());
            ResultSet rs = executeUpdate(ps);
            if(rs.next()) return rs.getInt(1);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
