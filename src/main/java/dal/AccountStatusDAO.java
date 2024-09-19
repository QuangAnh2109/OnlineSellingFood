package dal;

import model.AccountStatus;

import java.sql.*;
import java.util.ArrayList;

public class AccountStatusDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new AccountStatus(rs.getInt("StatusID"),rs.getString("Detail"));
    }

    public ResultSet addStatus(AccountStatus status){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into AccountStatus (Detail) values (?)", Statement.RETURN_GENERATED_KEYS);
            ps.setNString(1, status.getDetail());
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public AccountStatus getStatusByStatusID(int status){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from AccountStatus where StatusID=?");
            ps.setInt(1, status);
            return (AccountStatus)getObject(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ArrayList<AccountStatus> getAllStatus(){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from AccountStatus");
            ArrayList<AccountStatus> list = new ArrayList<>();
            for(Object ob:getListObject(ps)){
                list.add((AccountStatus) ob);
            }
            return list;
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
