package dal;

import model.Staff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StaffDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Staff(rs.getInt("StaffID"),rs.getInt("AccountID"),rs.getInt("Salary"),rs.getInt("SarehouseID"));
    }

    public Staff getStaffByCustomerID(int staffID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Staff where StaffID=?");
            insertStatement(staffID,ps,1);
            return (Staff)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public Staff getStaffByAccountID(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Staff where AccountID=?");
            insertStatement(accountID,ps,1);
            return (Staff)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public int updateStaffInformation(Staff staff){
        try{
            PreparedStatement ps = connection.prepareStatement("update Staff set Salary=?, WarehouseID=? where StaffID=?");
            insertStatement(staff.getSalary(), ps, 1);
            insertStatement(staff.getWarehouseID(), ps, 2);
            insertStatement(staff.getStaffID(), ps, 3);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public int addStaff(Staff staff){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into Staff(AccountID,Salary,WarehouseID) values (?,?,?)");
            insertStatement(staff.getAccountID(), ps, 1);
            insertStatement(staff.getSalary(), ps, 2);
            insertStatement(staff.getWarehouseID(), ps, 3);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }
}
