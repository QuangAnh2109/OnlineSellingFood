package dal;

import model.AccountLog;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountLogDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new AccountLog(rs.getInt("LogID"), rs.getInt("AccountID"), rs.getInt("EventTypeID"), rs.getString("IPAddress"), rs.getString("DataType"), rs.getString("Value"), rs.getString("Time"));
    }

    public AccountLog getAccountLogByLogID(int logID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from AccountLog where LogID=?");
            ps.setInt(1, logID);
            return (AccountLog)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public AccountLog getAccountLogByAccountID(Integer accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from AccountLog where AccountID=?");
            insertStatement(accountID,ps,1);
            return (AccountLog)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public AccountLog getAccountLogByEventTypeID(int typeID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from AccountLog where TypeID=?");
            ps.setInt(1, typeID);
            return (AccountLog)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public AccountLog getAccountLogByIpAddress(int ipAddress){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from AccountLog where TypeID=?");
            ps.setInt(1, ipAddress);
            return (AccountLog)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ArrayList<AccountLog> getAllAccountLog(){
        try{
            ArrayList<Object> listObject = getListObjectBySQL(connection.prepareStatement("select * from AccountLog"));
            ArrayList<AccountLog> listLog = new ArrayList<AccountLog>();
            convertListOBjectToListAccountLog(listObject,listLog);
            return listLog;
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public int addAccountLog(AccountLog accountLog){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into AccountLog (AccountID, EventTypeID, Time, IPAddress, DataType, Value) values (?,?,CAST(? AS DateTime),?,?,?");
            insertStatement(accountLog.getAccountID(), ps, 1);
            insertStatement(accountLog.getEventTypeID(), ps, 2);
            insertStatement(accountLog.getTime(), ps, 3,false);
            insertStatement(accountLog.getIpAddress(), ps, 4,true);
            insertStatement(accountLog.getDataType(), ps, 5, true);
            insertStatement(accountLog.getValue(), ps, 6,false);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    private  void convertListOBjectToListAccountLog(List<Object> listObject, List<AccountLog> listLog){
        for(Object ob:listObject){
            listLog.add((AccountLog)ob);
        }
    }
}