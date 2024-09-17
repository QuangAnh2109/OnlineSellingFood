package dal;

import model.Account;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Account(rs.getInt("AccountID"), rs.getInt("RoleID"), rs.getInt("BirthYear"), rs.getInt("ContactInformationID"), rs.getInt("StatusID"), rs.getString("Email"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Time"));
    }

    //login check
    public Account getAccountBy(String email, String password){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Account where Email=? and Password=?");
            ps.setString(1, email);
            ps.setString(2, password);
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
            ps.setInt(1, acc.getRoleID());
            ps.setString(2, acc.getEmail());
            ps.setString(3, acc.getFirstName());
            ps.setString(4, acc.getLastName());
            ps.setInt(5, acc.getBirthYear());
            ps.setInt(6, acc.getContactInformationID());
            ps.setInt(7, acc.getStatusID());
            ps.setInt(8, acc.getAccountID());
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public int updateAccount(int accountID, String password){
        try{
            PreparedStatement ps = connection.prepareStatement("update Account set Password=? where AccountID=?");
            ps.setString(1, password);
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
            ps.setInt(1, acc.getRoleID());
            ps.setString(2, acc.getEmail());
            ps.setString(3, acc.getFirstName());
            ps.setString(4, acc.getLastName());
            ps.setInt(5, acc.getBirthYear());
            ps.setInt(6, acc.getContactInformationID());
            ps.setString(7, acc.getPassword());
            ps.setString(8, acc.getTime());
            ps.setInt(9, acc.getStatusID());
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }
}