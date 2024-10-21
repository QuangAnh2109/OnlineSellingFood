package dal;

import dto.StaffDetailRespone;
import dto.StaffListResponse;
import model.Account;
import model.ContactInformation;
import model.Staff;
import model.Warehouse;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Staff(rs.getInt("StaffID"),rs.getInt("AccountID"),rs.getInt("Salary"),rs.getInt("WarehouseID"));
    }

    public Staff getStaffByCustomerID(int staffID){
        try{
            PreparedStatement ps = connection.prepareStatement("select StaffID,AccountID,Salary,WarehouseID from Staff where StaffID=?");
            ps.setInt(1, staffID);
            return (Staff)getObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return null;
    }

    public Staff getStaffByAccountID(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select StaffID,AccountID,Salary,WarehouseID from Staff where AccountID=?");
            ps.setInt(1, accountID);
            return (Staff)getObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
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
        String sql = "\tselect a.AccountID,a.Name,a.Email,ast.Detail,a.[Time]\n" +
                "\tfrom Account a join AccountStatus ast on a.StatusID = ast.StatusID\n" +
                "\twhere a.RoleID != 6 and a.RoleID != 1";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                StaffListResponse slr=new StaffListResponse();
                slr.setAcoountID(rs.getInt("AccountID"));
                slr.setName(rs.getString("Name"));
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
        String sql = "select r.[RoleID],[as].StatusID,a.Name,a.Email,ci.PhoneNumber,ci.[Address],a.Birth,s.Salary,w.[WarehouseID]\n" +
                "from Account a join Staff s on a.AccountID = s.AccountID\n" +
                "join [Role] r on r.RoleID = a.RoleID\n" +
                "join Warehouse w on w.WarehouseID = s.WarehouseID\n" +
                "join AccountContact ac on ac.AccountID = a.AccountID\n" +
                "join ContactInformation ci on ci.ContactInformationID = ac.ContactInformationID\n" +
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
                sdr.setName(rs.getString("Name"));
                sdr.setEmail(rs.getString("Email"));
                sdr.setPhoneNumber(rs.getString("PhoneNumber"));
                sdr.setAddress(rs.getString("Address"));
                sdr.setBirth(rs.getObject("Birth", LocalDateTime.class));
                sdr.setSalary(rs.getInt("Salary"));
                sdr.setWarehouseID(rs.getInt("WarehouseID"));

            }
            return sdr;
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
