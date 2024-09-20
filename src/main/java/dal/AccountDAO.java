package dal;

import model.Account;
import model.PasswordReset;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

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

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> listAccounts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Account]";
            PreparedStatement statement = connection.prepareStatement(sql);

            for(Object ob:getListObjectBySQL(statement)){
                listAccounts.add((Account)ob);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listAccounts;
    }

    public Account getAccountIdByEmail(String email) {
        String sql = "SELECT * FROM [Account] \n"
                + "WHERE Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt("AccountID"),
                        rs.getInt("RoleID"),
                        rs.getInt("BirthYear"),
                        rs.getInt("ContactInformationID"),
                        rs.getInt("StatusID"),
                        rs.getString("Email"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Time"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public PasswordReset getPasswordResetByEmail(String username) {
        String sql = "SELECT * FROM PasswordReset \n"
                + "WHERE AccountID = (SELECT AccountID FROM [Account] WHERE Email = ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new PasswordReset(rs.getInt("AccountID"),
                        rs.getString("Password"),
                        rs.getString("ExpiryDateTime"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account getUserLoginByPassReset(String email, String passwordReset) {
        String sql = "SELECT a.*\n"
                + "FROM [Account] a\n"
                + "JOIN PasswordReset pr ON a.AccountID = pr.AccountID\n"
                + "WHERE a.Email = ? AND pr.Password = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, passwordReset);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt("AccountID"), rs.getInt("RoleID"), rs.getInt("BirthYear"), rs.getInt("ContactInformationID"), rs.getInt("StatusID"), rs.getString("Email"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Time"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean checkEmailExits(String email, ArrayList<Account> listAccount) {
        for (Account user : listAccount) {
            if (user.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }

    public void insertPasswordReset(int idUser, String password, String expiryTime) {
        String sql = "INSERT INTO PasswordReset (AccountID, Password, ExpiryDateTime) VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, idUser);
            st.setString(2, password);
            st.setString(3, expiryTime);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updatePasswordReset(int accountId, String password, String expiryDateTime) {
        String sql = "UPDATE PasswordReset SET Password = ?, ExpiryDateTime = ? WHERE AccountID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, password);
            st.setString(2, expiryDateTime);
            st.setInt(3, accountId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    public void updatePassword(String email, String newPassword) {
        String sql = "UPDATE [Account] SET Password = ? WHERE Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public boolean isUserInPasswordReset(int accountId) {
        String sql = "SELECT 1 FROM PasswordReset WHERE AccountID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountId);
            try (ResultSet rs = st.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}