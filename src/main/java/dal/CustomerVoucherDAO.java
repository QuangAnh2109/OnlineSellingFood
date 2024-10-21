package dal;

import dto.CustomerVoucherResponse;
import model.CustomerVoucher;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerVoucherDAO  extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
//        return new Discount(rs.getObject("DiscountID",Integer.class),rs.getObject("DiscountPercent",Integer.class),rs.getObject("St"))
        return null;
    }
    public void addCustomerVoucher(List<Integer> customerIDS, int voucherID) {
        String sql = "INSERT INTO CustomerVoucher (customerID, voucherID) VALUES (?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            if (customerIDS.size() == 1) {
                st.setInt(1, customerIDS.get(0));
                st.setInt(2, voucherID);
                st.executeUpdate();
            } else {
                for (int customerID : customerIDS) {
                    st.setInt(1, customerID);
                    st.setInt(2, voucherID);
                    st.addBatch();
                }
                st.executeBatch();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean checkExistCustomerVoucher(int customerID, int voucherID) {
        String sql = "SELECT * FROM CustomerVoucher WHERE customerID = ? AND voucherID = ?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, customerID);
            st.setInt(2, voucherID);
            ResultSet rs=st.executeQuery();
            if(rs.next()) {
                return true;
            }else{
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<CustomerVoucherResponse> getCustomerVouchers()  {
        List<CustomerVoucherResponse> list = new ArrayList<CustomerVoucherResponse>();
        String sql = "select c.CustomerID,a.[Name],c.Point,c.[Level] from Customer" +
                " c join Account a on c.AccountID=a.AccountID";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            while (rs.next()) {
                CustomerVoucherResponse cvr = new CustomerVoucherResponse();
                cvr.setCustomerID(rs.getInt(1));
                cvr.setCustomerName(rs.getString(2));
                cvr.setPoint(rs.getInt(3));
                cvr.setLevel(rs.getInt(4));
                list.add(cvr);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }



    public static void main(String[] args) {

    }

}
