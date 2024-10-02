package dal;

import dto.StaffDetailRespone;
import dto.StaffListResponse;
import model.Account;
import model.Staff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Staff(rs.getInt("StaffID"),rs.getInt("AccountID"),rs.getInt("Salary"),rs.getInt("SarehouseID"));
    }

    public Staff getStaffByCustomerID(int staffID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Staff where StaffID=?");
            ps.setInt(1, staffID);
            return (Staff)getObject(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public Staff getStaffByAccountID(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Staff where AccountID=?");
            ps.setInt(1, accountID);
            return (Staff)getObject(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ResultSet updateStaffInformation(Staff staff){
        try{
            PreparedStatement ps = connection.prepareStatement("update Staff set Salary=?, WarehouseID=? where StaffID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, staff.getSalary());
            ps.setInt(2, staff.getWarehouseID());
            ps.setInt(3, staff.getStaffID());
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ResultSet addStaff(Staff staff){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into Staff(AccountID,Salary,WarehouseID) values (?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, staff.getAccountID());
            ps.setInt(2, staff.getSalary());
            ps.setInt(3, staff.getWarehouseID());
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
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
        String sql = "select r.[RoleID],a.FirstName,a.LastName,a.Email,ci.PhoneNumber,ci.[Address],a.BirthYear,s.Salary,w.[WarehouseID]\n" +
                "from Account a join Staff s on a.AccountID = s.AccountID\n" +
                "join [Role] r on r.RoleID = a.RoleID\n" +
                "join Warehouse w on w.WarehouseID = s.WarehouseID\n" +
                "join ContactInformation ci on ci.ContactInformationID = a.ContactInformationID\n" +
                "where (a.RoleID != 6 and a.RoleID != 1 and a.AccountID=?)";

        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, accountID);
            ResultSet rs=st.executeQuery();
            StaffDetailRespone sdr=new StaffDetailRespone();

            while(rs.next()){
                sdr.setRoleID(rs.getInt("RoleID"));
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



    public static void main(String[] args) {
        StaffDAO staffDAO = new StaffDAO();
        StaffDetailRespone sdr=staffDAO.getStaffDetail(3);
        System.out.println(sdr);
    }
}
