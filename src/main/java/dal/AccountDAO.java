package dal;

import model.Account;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

public class AccountDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Account(rs.getInt("AccountID"), rs.getInt("RoleID"), rs.getInt("BirthYear"), rs.getInt("ContactInformationID"), rs.getInt("StatusID"), rs.getString("Email"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Time"));
    }

    //login check
    public Account getAccountBy(String email, String password){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Account where Email=? and Password=?");
            insertStatement(email,ps,1,true);
            insertStatement(password,ps,2,true);
            return (Account)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    //get account by account id
    public Account getAccountBy(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Account where AccountID=?");
            ps.setInt(1, accountID);
            return (Account)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public int updateAccount(Account acc){
        try{
            PreparedStatement ps = connection.prepareStatement("update Account set RoleID=?, Email=?, FirstName=?, LastName=?, BirthYear=?, ContactInformationID=?, StatusID=? where AccountID=?");
            insertStatement(acc.getRoleID(), ps, 1);
            insertStatement(acc.getEmail(), ps, 2,true);
            insertStatement(acc.getFirstName(), ps, 3, false);
            insertStatement(acc.getLastName(), ps, 4, false);
            insertStatement(acc.getBirthYear(), ps, 5);
            insertStatement(acc.getContactInformationID(), ps, 6);
            insertStatement(acc.getStatusID(), ps, 7);
            insertStatement(acc.getAccountID(), ps, 8);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public int updateAccount(int accountID, String password){
        try{
            PreparedStatement ps = connection.prepareStatement("update Account set Password=? where AccountID=?");
            insertStatement(password,ps,1,true);
            ps.setInt(2, accountID);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public int addAccount(Account acc){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into Account (RoleID, Email, FirstName, LastName, BirthYear, ContactInformationID, Password, Time, StatusID) values (?,?,?,?,?,?,?,CAST(? AS DateTime),?)");
            insertStatement(acc.getRoleID(), ps, 1);
            insertStatement(acc.getEmail(), ps, 2, true);
            insertStatement(acc.getFirstName(), ps, 3, false);
            insertStatement(acc.getLastName(), ps, 4, false);
            insertStatement(acc.getBirthYear(), ps, 5);
            insertStatement(acc.getContactInformationID(), ps, 6);
            insertStatement(acc.getPassword(), ps, 7, true);
            insertStatement(acc.getTime(), ps, 8, false);
            insertStatement(acc.getStatusID(), ps, 9);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }
}