package dao;

import common.Encrypt;
import model.Account;
import model.PasswordReset;

import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.time.LocalDateTime;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

public class AccountDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Account(rs.getInt("AccountID"), rs.getInt("RoleID"), rs.getInt("BirthYear"), rs.getInt("ContactInformationID"), rs.getInt("StatusID"), rs.getString("Email"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Password"), rs.getObject("Time", LocalDateTime.class));
    }

    //login check
    public Account getAccountByEmailPassword(String email, String password) throws NoSuchAlgorithmException {
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Account where Email=? and Password=?");
            ps.setString(1, email);
            ps.setString(2,Encrypt.toHexString(Encrypt.getSHA(password)));

            return (Account)getObject(ps);
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

    public ResultSet updateAccountPassword(int accountID, String password) throws NoSuchAlgorithmException {
        try{
            PreparedStatement ps = connection.prepareStatement("update Account set Password=? where AccountID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, Encrypt.toHexString(Encrypt.getSHA(password)));
            ps.setInt(2, accountID);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ResultSet addAccount(Account acc) throws NoSuchAlgorithmException {
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
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

//    public ArrayList<Account> getAllAccount() {
//        ArrayList<Account> listAccounts = new ArrayList<>();
//        try {
//            String sql = "SELECT * FROM [Account]";
//            PreparedStatement statement = connection.prepareStatement(sql);
//            ResultSet rs = statement.executeQuery();
//            while (rs.next()) {
//                Account account = new Account();
//                    account.setAccountID(rs.getInt("AccountID"));
//                    account.setRoleID(rs.getInt("RoleID"));
//                    account.setBirthYear(rs.getInt("BirthYear"));
//                    account.setContactInformationID(rs.getInt("ContactInformationID"));
//                    account.setStatusID(rs.getInt("StatusID"));
//                    account.setEmail(rs.getString("Email"));
//                    account.setFirstName(rs.getString("FirstName"));
//                       account.setLastName(rs.getString("LastName"));
//                        account.setTime(rs.getString("Time"));
//                listAccounts.add(account);
//            }
//            rs.close();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return listAccounts;
//    }
//
//    public Account getAccountIdByEmail(String email) {
//        String sql = "SELECT * FROM [Account] \n"
//                + "WHERE Email = ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, email);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                return new Account(rs.getInt("AccountID"),
//                        rs.getInt("RoleID"),
//                        rs.getInt("BirthYear"),
//                        rs.getInt("ContactInformationID"),
//                        rs.getInt("StatusID"),
//                        rs.getString("Email"),
//                        rs.getString("FirstName"),
//                        rs.getString("LastName"),
//                        rs.getString("Time"));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
//
//    public PasswordReset getPasswordResetByEmail(String username) {
//        String sql = "SELECT * FROM PasswordReset \n"
//                + "WHERE AccountID = (SELECT AccountID FROM [Account] WHERE Email = ?)";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, username);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                return new PasswordReset(rs.getInt("AccountID"),
//                        rs.getString("Password"),
//                        rs.getString("ExpiryDateTime"));
//
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
//
//    public Account getUserLoginByPassReset(String email, String passwordReset) {
//        String sql = "SELECT a.*\n"
//                + "FROM [Account] a\n"
//                + "JOIN PasswordReset pr ON a.AccountID = pr.AccountID\n"
//                + "WHERE a.Email = ? AND pr.Password = ?;";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, email);
//            st.setString(2, passwordReset);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                return new Account(rs.getInt("AccountID"),
//                        rs.getInt("RoleID"),
//                        rs.getInt("BirthYear"),
//                        rs.getInt("ContactInformationID"),
//                        rs.getInt("StatusID"),
//                        rs.getString("Email"),
//                        rs.getString("FirstName"),
//                        rs.getString("LastName"),
//                        rs.getString("Time"));
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
//
//    public boolean checkEmailExits(String email, ArrayList<Account> listAccount) {
//        for (Account user : listAccount) {
//            if (user.getEmail().equals(email)) {
//                return true;
//            }
//        }
//        return false;
//    }
//
//    public void insertPasswordReset(int idUser, String password, String expiryTime) {
//        String sql = "INSERT INTO PasswordReset (AccountID, Password, ExpiryDateTime) VALUES (?, ?, ?)";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, idUser);
//            st.setString(2, password);
//            st.setString(3, expiryTime);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//
//    public void updatePasswordReset(int accountId, String password, String expiryDateTime) {
//        String sql = "UPDATE PasswordReset SET Password = ?, ExpiryDateTime = ? WHERE AccountID = ?";
//        try (PreparedStatement st = connection.prepareStatement(sql)) {
//            st.setString(1, password);
//            st.setString(2, expiryDateTime);
//            st.setInt(3, accountId);
//            st.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//    }
//    public boolean isUserInPasswordReset(int accountId) {
//        String sql = "SELECT 1 FROM PasswordReset WHERE AccountID = ?";
//        try (PreparedStatement st = connection.prepareStatement(sql)) {
//            st.setInt(1, accountId);
//            try (ResultSet rs = st.executeQuery()) {
//                return rs.next();
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
}