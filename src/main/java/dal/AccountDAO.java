package dal;

import model.Account;

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
    public Account getAccountByEmailPassword(String email, String password){
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
    public Account getAccountByAccountID(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Account where AccountID=?");
            ps.setInt(1, accountID);
            return (Account)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public int updateAccountInformation(Account acc){
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

    public int updateAccountPassword(int accountID, String password){
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

    public int addAccount(Account acc) {
        try {
            PreparedStatement ps = connection.prepareStatement("INSERT INTO Account (RoleID, Email, FirstName, LastName, BirthYear, ContactInformationID, Password, Time, StatusID) VALUES (?,?,?,?,?,?,?,CAST(? AS DateTime),?)");
            ps.setInt(1, acc.getRoleID());
            ps.setString(2, acc.getEmail());
            ps.setString(3, acc.getFirstName());
            ps.setString(4, acc.getLastName());
            ps.setInt(5, acc.getBirthYear());
            ps.setInt(6, acc.getContactInformationID());
            ps.setString(7, acc.getPassword());
            ps.setString(8, acc.getTime());
            ps.setInt(9, acc.getStatusID());

            return ps.executeUpdate();
        } catch (SQLException ex) {
            System.out.println("SQL Error: " + ex.getMessage());
            ex.printStackTrace();
        }
        return 0;
    }

    public static void main(String[] args) {
        System.out.println(new AccountDAO().connection);
    }
}