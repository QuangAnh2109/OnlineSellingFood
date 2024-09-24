package dal;

import common.Encrypt;
import model.Account;

import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.time.LocalDateTime;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Account(rs.getInt("AccountID"), rs.getInt("RoleID"), rs.getInt("BirthYear"), rs.getInt("ContactInformationID"), rs.getInt("StatusID"), rs.getString("Email"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Password"), rs.getObject("Time", LocalDateTime.class));
    }

    //login check
    public Account getAccountByEmailPassword(String email, String password){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Account where Email=? and Password=?");
            ps.setString(1, email);
            ps.setString(2,Encrypt.toHexString(Encrypt.getSHA(password)));

            return (Account)getObject(ps);
        }catch (SQLException | NoSuchAlgorithmException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    //get account by account id
    public Account getAccountByAccountID(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Account where AccountID=?");
            ps.setInt(1, accountID);
            return (Account)getObject(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ResultSet updateAccountInformation(Account acc){
        try{
            PreparedStatement ps = connection.prepareStatement("update Account set RoleID=?, Email=?, FirstName=?, LastName=?, BirthYear=?, ContactInformationID=?, StatusID=? where AccountID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, acc.getRoleID());
            ps.setString(2, acc.getEmail());
            ps.setNString(3, acc.getFirstName());
            ps.setNString(4, acc.getLastName());
            ps.setInt(5, acc.getBirthYear());
            ps.setInt(6, acc.getContactInformationID());
            ps.setInt(7, acc.getStatusID());
            ps.setInt(8, acc.getAccountID());
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ResultSet updateAccountPassword(int accountID, String password){
        try{
            PreparedStatement ps = connection.prepareStatement("update Account set Password=? where AccountID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, Encrypt.toHexString(Encrypt.getSHA(password)));
            ps.setInt(2, accountID);
            return executeUpdate(ps);
        }catch (SQLException | NoSuchAlgorithmException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ResultSet addAccount(Account acc) {
        try{
            PreparedStatement ps = connection.prepareStatement("insert into Account (RoleID, Email, FirstName, LastName, BirthYear, ContactInformationID, Password, Time, StatusID) values (?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, acc.getRoleID());
            ps.setString(2, acc.getEmail());
            ps.setNString(3, acc.getFirstName());
            ps.setNString(4, acc.getLastName());
            ps.setInt(5, acc.getBirthYear());
            ps.setInt(6, acc.getContactInformationID());
            ps.setString(7, Encrypt.toHexString(Encrypt.getSHA(acc.getPassword())));
            ps.setTimestamp(8, Timestamp.valueOf(acc.getTime()));
            ps.setInt(9, acc.getStatusID());
            return executeUpdate(ps);
        }catch (SQLException | NoSuchAlgorithmException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}