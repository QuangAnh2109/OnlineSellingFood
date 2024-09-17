package dal;

import model.Status;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StatusDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Status(rs.getInt("StatusID"),rs.getString("Detail"));
    }

    public int addStatus(Status status, String table){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into "+table+" (Detail) values (?)");
            insertStatement(status.getDetail(), ps, 1,false);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public Status getStatusByStatusID(Integer statusID, String table){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from "+table+" where StatusID=?");
            insertStatement(statusID,ps,1);
            return (Status)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
