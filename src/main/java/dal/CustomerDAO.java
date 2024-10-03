package dal;

import dto.CustomerDetailRespone;
import dto.StaffDetailRespone;
import dto.StaffListResponse;
import model.Account;
import model.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
            //return (Customer)getObject(ps);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                return new Customer(rs.getInt("CustomerID"),rs.getInt("AccountID"),rs.getInt("Point"),rs.getInt("Level"));
            }
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ResultSet updateCustomer(Customer customer){
        try{
            PreparedStatement ps = connection.prepareStatement("update Customer set Point=?, Level=? where CustomerID=?", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(3, customer.getCustomerID());
            ps.setInt(1, customer.getPoint());
            ps.setInt(2, customer.getLevel());
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public ResultSet addCustomer(Customer customer){
        try{
            PreparedStatement ps = connection.prepareStatement("insert into Customer(AccountID,Point,Level) values (?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, customer.getAccountID());
            ps.setInt(2, customer.getPoint());
            ps.setInt(3, customer.getLevel());
            return executeUpdate(ps);
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public List<StaffListResponse> getAllCustomer(){
        List<StaffListResponse> listCustomer = new ArrayList<StaffListResponse>();
        String sql = "\tselect a.AccountID,a.FirstName,a.LastName,a.Email,ast.Detail,a.[Time]\n" +
                "\tfrom Account a join AccountStatus ast on a.StatusID = ast.StatusID\n" +
                "\twhere a.RoleID = 6 and a.RoleID != 1";
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
                listCustomer.add(slr);
            }
            return listCustomer;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public CustomerDetailRespone getCustomerDetail(int accountID){
        String sql = "select [as].StatusID,a.FirstName,a.LastName,a.Email,ci.PhoneNumber,ci.[Address],a.BirthYear,c.Point,c.[Level]\n" +
                "from Account a join AccountStatus [as] on a.StatusID = [as].StatusID\n" +
                "join [Role] r on r.RoleID=a.RoleID\n" +
                "join [Customer] c on c.AccountID = a.AccountID\n" +
                "join ContactInformation ci on ci.ContactInformationID = a.ContactInformationID\n" +
                "where (a.RoleID = 6 and a.RoleID != 1 and a.AccountID=?)";

        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, accountID);
            ResultSet rs=st.executeQuery();
            CustomerDetailRespone cdr=new CustomerDetailRespone();

            while(rs.next()){
                cdr.setStatusID(rs.getInt("StatusID"));
                cdr.setFirstName(rs.getString("FirstName"));
                cdr.setLastName(rs.getString("LastName"));
                cdr.setEmail(rs.getString("Email"));
                cdr.setPhoneNumber(rs.getString("PhoneNumber"));
                cdr.setAddress(rs.getString("Address"));
                cdr.setBirthYear(rs.getInt("BirthYear"));
                cdr.setPoint(rs.getInt("Point"));
                cdr.setLevel(rs.getInt("Level"));


            }
            return cdr;
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public void updateProfileCustomerForAdmin(Account a,Customer c){
        String sql="UPDATE [dbo].[Account]\n" +
                "   SET [StatusID] =?\n" +
                " WHERE AccountID=?";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
           st.setInt(2, a.getAccountID());
           st.setInt(1, a.getStatusID());
            st.executeUpdate();
            System.out.println("after execute update status");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        sql="UPDATE [dbo].[Customer]\n" +
                "   SET  [Point] = ?\n" +
                "      ,[Level] = ?\n" +
                " WHERE AccountID=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1,c.getPoint());
            st.setInt(2,c.getLevel());
            st.setInt(3,c.getAccountID());

            System.out.println(c.getPoint());
            System.out.println(c.getLevel());
            System.out.println(c.getAccountID());
            st.executeUpdate();

        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }

    }
    public static void main(String[] args) {
        CustomerDAO customerDAO = new CustomerDAO();
        AccountDAO accountDAO = new AccountDAO();
        Account account=accountDAO.getAccountByAccountID(2);
        System.out.println(account.getStatusID());
        Customer customer=customerDAO.getCustomerByAccountID(account.getAccountID());
        System.out.println(customer.getCustomerID());
        Customer cutomer1=new Customer(customer.getAccountID(),3000,100);
        customerDAO.updateProfileCustomerForAdmin(account,cutomer1);
        System.out.println(customer.getAccountID());
    }
}
