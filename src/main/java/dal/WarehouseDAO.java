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
            return (Warehouse)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public int updateWarehouse(Warehouse warehouse){
        try{
            PreparedStatement ps = connection.prepareStatement("update Warehouse set ContactInformationID=?, StatusID=?, Name=? where WarehouseID=?");
            insertStatement(warehouse.getContactInformationID(), ps, 1);
            insertStatement(warehouse.getStatusID(), ps, 2);
            insertStatement(warehouse.getName(), ps, 3, false);
            insertStatement(warehouse.getWarehouseID(), ps, 4);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public int addWarehouse(Warehouse warehouse){
        try{
            PreparedStatement ps = connection.prepareStatement("insert Warehouse (ContactInformationID,StatusID,Name) values (?,?,?)");
            insertStatement(warehouse.getContactInformationID(), ps, 1);
            insertStatement(warehouse.getStatusID(), ps, 2);
            insertStatement(warehouse.getName(), ps, 3, false);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }
}
