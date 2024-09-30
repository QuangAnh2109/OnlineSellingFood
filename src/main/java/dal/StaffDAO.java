package dal;

import model.Staff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
}