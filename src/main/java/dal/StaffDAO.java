package dal;

import dto.StaffDetailRespone;
import dto.StaffListResponse;
import model.Account;
import model.ContactInformation;
import model.Staff;
import model.Warehouse;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Staff(rs.getInt("StaffID"),rs.getInt("AccountID"),rs.getInt("Salary"),rs.getInt("SarehouseID"));
    }

    public Staff getStaffByCustomerID(int staffID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Staff where StaffID=?");
            ps.setInt(1, staffID);
            return (Staff)getObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return null;
    }

    public Staff getStaffByAccountID(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Staff where AccountID=?");
            ps.setInt(1, accountID);
//            return (Staff)getObject(ps);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                return new Staff(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getInt(4));
            }
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public boolean updateStaffInformation(Staff staff){
        try{
            PreparedStatement ps = connection.prepareStatement("update Staff set Salary=?, WarehouseID=? where StaffID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, staff.getSalary());
            ps.setInt(2, staff.getWarehouseID());
            ps.setInt(3, staff.getStaffID());
            ResultSet rs = executeUpdate(ps);
            if(rs!=null)return rs.next();
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return false;
    }

    public Integer addStaff(Staff staff){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into Staff(AccountID,Salary,WarehouseID) values (?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, staff.getAccountID());
            ps.setInt(2, staff.getSalary());
            ps.setInt(3, staff.getWarehouseID());
            ResultSet rs = executeUpdate(ps);
            if(rs!=null&&rs.next()) return rs.getInt(1);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return null;
    }
    public List<StaffListResponse> getAllStaff(){
        List<StaffListResponse> listStaff = new ArrayList<StaffListResponse>();
        String sql = "\tselect a.AccountID,a.FirstName,a.LastName,a.Email,ast.Detail,a.[Time]\n" +
                "\tfrom Account a join AccountStatus ast on a.StatusID = ast.StatusID\n" +
                "\twhere a.RoleID != 6 and a.RoleID != 1";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                StaffListResponse slr=new StaffListResponse();
                slr.setAcoountID(rs.getInt("AccountID"));
                slr.setFirstName(rs.getString("FirstName"));
                slr.setLastName(rs.getString("LastName"));
                slr.setEmail(rs.getString("Email"));
                slr.setDetail(rs.getString("Detail"));
                slr.setTime(rs.getDate("Time"));
                listStaff.add(slr);
            }
            return listStaff;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public StaffDetailRespone getStaffDetail(int accountID){
        String sql = "select r.[RoleID],[as].StatusID,a.FirstName,a.LastName,a.Email,ci.PhoneNumber,ci.[Address],a.BirthYear,s.Salary,w.[WarehouseID]\n" +
                "from Account a join Staff s on a.AccountID = s.AccountID\n" +
                "join [Role] r on r.RoleID = a.RoleID\n" +
                "join Warehouse w on w.WarehouseID = s.WarehouseID\n" +
                "join ContactInformation ci on ci.ContactInformationID = a.ContactInformationID\n" +
                "join AccountStatus [as] on a.StatusID=[as].StatusID\n" +
                "where (a.RoleID != 6 and a.RoleID != 1 and a.AccountID=?)";

        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, accountID);
            ResultSet rs=st.executeQuery();
            StaffDetailRespone sdr=new StaffDetailRespone();

            while(rs.next()){
                sdr.setRoleID(rs.getInt("RoleID"));
                sdr.setStatusID(rs.getInt("StatusID"));
                sdr.setFirstName(rs.getString("FirstName"));
                sdr.setLastName(rs.getString("LastName"));
                sdr.setEmail(rs.getString("Email"));
                sdr.setPhoneNumber(rs.getString("PhoneNumber"));
                sdr.setAddress(rs.getString("Address"));
                sdr.setYearOfBirth(rs.getInt("BirthYear"));
                sdr.setSalary(rs.getInt("Salary"));
                sdr.setWarehouseID(rs.getInt("WarehouseID"));

            }
            return sdr;
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public void updateProfileForStaff(Account a, ContactInformation c, Staff s){
        String sql="UPDATE [dbo].[Account]\n" +
                "   SET [RoleID] = ?\n" +
                "      ,[Email] = ?\n" +
                "      ,[FirstName] =? \n" +
                "      ,[LastName] = ?\n" +
                "      ,[BirthYear] = ?\n" +
                "      ,[StatusID] =? \n" +
                " WHERE AccountID=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1,a.getRoleID());
            st.setString(2,a.getEmail());
            st.setString(3,a.getFirstName());
            st.setString(4,a.getLastName());
            st.setInt(5,a.getBirthYear());
            st.setInt(6,a.getStatusID());
            st.setInt(7,a.getAccountID());



            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

         sql="UPDATE [dbo].[ContactInformation]\n" +
                "   SET [Address] =?\n" +
                "      ,[PhoneNumber] =?\n" +
                " WHERE ContactInformationID=?";

        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1,c.getAddress());
            st.setString(2,c.getPhoneNumber());
            st.setInt(3,c.getContactInformationID());
            st.executeUpdate();
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }

        sql="UPDATE [dbo].[Staff]\n" +
                "      SET [Salary] = ?\n" +
                "      ,[WarehouseID] = ?\n" +
                " WHERE AccountID=?";

        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1,s.getSalary());
            st.setInt(2,s.getWarehouseID());
            st.setInt(3,s.getAccountID());
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public static void main(String[] args) {
        StaffDAO dao = new StaffDAO();
        AccountDAO adao = new AccountDAO();
        Account a = adao.getAccountByAccountID(3);
        Account a1=new Account(a.getAccountID(),4,2004,a.getContactInformationID(),a.getStatusID(),"ducdeptrai123@gmail.com","Su","Nguyen",a.getPassword(),a.getTime());
        ContactInformationDAO cdao = new ContactInformationDAO();
        ContactInformation ci = new ContactInformation(a.getContactInformationID(),"Xom Thuong","0011992233");

        StaffDAO sdao = new StaffDAO();
        Staff staff1=sdao.getStaffByAccountID(4);
        System.out.println(staff1);
        Staff staff=new Staff(staff1.getAccountID(),9000,3);
        dao.updateProfileForStaff(a1,ci,staff);
    }
}
