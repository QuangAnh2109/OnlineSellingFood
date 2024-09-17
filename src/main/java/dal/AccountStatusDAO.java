package dal;

import model.ContactInformation;
import model.Status;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountStatusDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Status(rs.getInt("StatusID"),rs.getString("Detail"));
    }

    public int addStatus(Status status){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into AccountStatus (Detail) values (?)");
            insertStatement(status.getDetail(), ps, 1,false);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public ContactInformation getStatusByStatusID(Integer StatusID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from AccountStatus where StatusID=?");
            insertStatement(StatusID,ps,1);
            return (ContactInformation)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
