package dal;

import model.Account;
import model.ContactInformation;
import model.Role;
import java.time.LocalDateTime;
import model.Account;

import java.sql.*;


public class AccountDAO extends DBContext{
    public String status = "ok";
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
            return null;
//        return new Account(rs.getInt("AccountID"), rs.getInt("RoleID"), rs.getInt("BirthYear"), rs.getInt("ContactInformationID"), rs.getInt("StatusID"), rs.getString("Email"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Time"));
    }

    //login check
    public Account getAccountByEmailPassword(String email, String password){
        String sql="SELECT [AccountID]\n" +
                "      ,[RoleID]\n" +
                "      ,[Email]\n" +
                "      ,[FirstName]\n" +
                "      ,[LastName]\n" +
                "      ,[BirthYear]\n" +
                "      ,[ContactInformationID]\n" +
                "      ,[Password]\n" +
                "      ,[Time]\n" +
                "      ,[StatusID]\n" +
                "  FROM [dbo].[Account]\n" +
                "  where Email=? and Password=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,email);
            st.setString(2,password);
            ResultSet rs=st.executeQuery();

            if(rs.next()){
                Account a=new Account();
                Role role=getRoleByRoleId(rs.getInt("RoleID"));
                a.setRole(role);
                a.setEmail(rs.getString("Email"));
                a.setFirstName(rs.getString("FirstName"));
                a.setLastName(rs.getString("LastName"));
                a.setBirthYear(rs.getInt("BirthYear"));
                ContactInformation contactInformation=getContactInformationById(rs.getInt("ContactInformationID"));
                a.setContactInformation(contactInformation);
                a.setPassword(rs.getString("Password"));

                java.sql.Timestamp timestamp = rs.getTimestamp("Time");
                if (timestamp != null) {
                    a.setTime(timestamp.toLocalDateTime()); // Chuyển đổi từ Timestamp sang LocalDateTime
                }

                return a;
            }
        } catch (SQLException e) {

        }
        return null;
    }
    public boolean existedEmail(String email){
        String sql="SELECT [AccountID]\n" +
                "      ,[RoleID]\n" +
                "      ,[Email]\n" +
                "      ,[FirstName]\n" +
                "      ,[LastName]\n" +
                "      ,[BirthYear]\n" +
                "      ,[ContactInformationID]\n" +
                "      ,[Password]\n" +
                "      ,[Time]\n" +
                "      ,[StatusID]\n" +
                "  FROM [dbo].[Account]\n" +
                "  where Email=? ";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,email);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                return true;
            }
        }catch (SQLException e){
            System.out.println(e);
        }
        return false;
    }

    public Role getRoleByRoleId(int roleId){
        String sql="Select * from Role where RoleID=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1,roleId);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                Role role=new Role(rs.getInt("roleId"),
                        rs.getString("name"));
                return role;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public ContactInformation getContactInformationById(int contactInformationID){
        String sql="Select * from ContactInformation where ContactInformationID=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1,contactInformationID);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                ContactInformation contactInformation=new ContactInformation(rs.getInt("contactInformationID"),
                        rs.getString("address"),rs.getString("phoneNumber"));
                return contactInformation;
            }
        } catch (SQLException e) {
            System.out.println(e);
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

    public void addAccount(Account acc,ContactInformation c) {
        int generatedKey = 0;
        String sql="INSERT into account values(?,?,?,?,?,?,?,?,?)";
        String sql1 = "insert into ContactInformation values(?,?)";
        try {
            PreparedStatement st1=connection.prepareStatement(sql1,Statement.RETURN_GENERATED_KEYS);
            st1.setString(1,c.getAddress());
            st1.setString(2,c.getPhoneNumber());
            st1.executeUpdate();
            ResultSet rs=st1.getGeneratedKeys();

            if(rs.next()){
                generatedKey = rs.getInt(1);
            }
            System.out.println(generatedKey);
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1,6);
            st.setString(2,acc.getEmail());
            st.setString(3,acc.getFirstName());
            st.setString(4,acc.getLastName());
            st.setInt(5,acc.getBirthYear());
            st.setInt(6,generatedKey);
            st.setString(7,acc.getPassword());
            LocalDateTime localDateTime = acc.getTime();
            java.sql.Date sqlDate = java.sql.Date.valueOf(localDateTime.toLocalDate());
            st.setDate(8,sqlDate);
            st.setInt(9,acc.getStatusID());



            st.executeUpdate();
        }catch (SQLException e){
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        ContactInformation c=new ContactInformation(2,"Ha Noi","01234567889");
        Role role=new Role(6,"Ha Noi");
        LocalDateTime date=LocalDateTime.now();
        System.out.println(date);
        Account a=new Account(1,role,"minh@gmail.com","Minh","Hoang",2005,c,"123",date,3);
        AccountDAO dao = new AccountDAO();
        dao.addAccount(a,c);

    }
}