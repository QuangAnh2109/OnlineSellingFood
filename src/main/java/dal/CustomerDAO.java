package dal;

import model.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws Exception {
        return new Customer(rs.getInt("CustomerID"),rs.getInt("AccountID"),rs.getInt("Point"),rs.getInt("Level"));
    }

    public Customer getCustomerByCustomerID(int customerID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Customer where CustomerID=?");
            insertStatement(customerID,ps,1);
            return (Customer)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public Customer getCustomerByAccountID(int accountID){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Customer where AccountID=?");
            insertStatement(accountID,ps,1);
            return (Customer)getObjectBySQL(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public int updateAccountInformation(Customer customer){
        try{
            PreparedStatement ps = connection.prepareStatement("update Customer set Point=?, Level=? where CustomerID=?");
            insertStatement(customer.getPoint(), ps, 1);
            insertStatement(customer.getLevel(), ps, 2);
            insertStatement(customer.getCustomerID(), ps, 3);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public int addAccount(Customer customer){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into Customer(AccountID,Point,Level) values (?,?,?)");
            insertStatement(customer.getAccountID(), ps, 1);
            insertStatement(customer.getPoint(), ps, 2);
            insertStatement(customer.getLevel(), ps, 3);
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return 0;
    }
}
