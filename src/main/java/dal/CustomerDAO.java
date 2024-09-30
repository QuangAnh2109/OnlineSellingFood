package dal;

import model.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CustomerDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Customer(rs.getInt("CustomerID"),rs.getInt("AccountID"),rs.getInt("Point"),rs.getInt("Level"));
    }

    public Customer getCustomerByCustomerID(int customerID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Customer where CustomerID=?");
            ps.setInt(1, customerID);
            return (Customer)getObject(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public Customer getCustomerByAccountID(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Customer where AccountID=?");
            ps.setInt(1, accountID);
            return (Customer)getObject(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public boolean updateCustomer(Customer customer){
        try{
            PreparedStatement ps = connection.prepareStatement("update Customer set Point=?, Level=? where CustomerID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(3, customer.getCustomerID());
            ps.setInt(1, customer.getPoint());
            ps.setInt(2, customer.getLevel());
            return executeUpdate(ps).next();
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public Integer addCustomer(Customer customer){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into Customer(AccountID,Point,Level) values (?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, customer.getAccountID());
            ps.setInt(2, customer.getPoint());
            ps.setInt(3, customer.getLevel());
            ResultSet rs = executeUpdate(ps);
            if(rs.next()) return rs.getInt(1);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
}
