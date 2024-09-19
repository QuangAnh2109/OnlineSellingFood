package dal;

import model.WarehouseStatus;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class WarehouseStatusDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new WarehouseStatus(rs.getInt("StatusID"),rs.getString("Detail"));
    }

    public ResultSet addStatus(WarehouseStatus status){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into WarehouseStatus (Detail) values (?)", Statement.RETURN_GENERATED_KEYS);
            ps.setNString(1, status.getDetail());
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public WarehouseStatus getStatusByStatusID(int status){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from WarehouseStatus where StatusID=?");
            ps.setInt(1, status);
            return (WarehouseStatus)getObject(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ArrayList<WarehouseStatus> getAllStatus(){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from WarehouseStatus");
            ArrayList<WarehouseStatus> list = new ArrayList<>();
            for(Object ob:getListObject(ps)){
                list.add((WarehouseStatus) ob);
            }
            return list;
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
