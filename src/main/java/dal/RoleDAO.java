package dal;

import model.Role;
import model.Status;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RoleDAO extends  DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Role(rs.getInt("RoleID"),rs.getString("Name"));
    }

    public Role getRole(Integer roleID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Role where RoleID=?");
            insertStatement(roleID,ps,1);
            return (Role)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

}
