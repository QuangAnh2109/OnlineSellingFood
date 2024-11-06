package dal;

import dto.OrderResponse;
import model.Order;


import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Order(1, 1, 13, 4, 173068, new Date(System.currentTimeMillis()), 1);
    }

    public int getTotalOrders() {
        int totalOrders = 0;
        try {

            String query = "SELECT COUNT(*) AS total FROM dbo.[Order]";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                totalOrders = resultSet.getInt("total");
            }

            resultSet.close();
            statement.close();
//            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalOrders;
    }

    public List<OrderResponse> getAllOrders() {
        List<OrderResponse> orderList = new ArrayList<>();
        String query = "SELECT o.OrderID, a.Name AS CustomerName, o.OrderTime AS OrderDate, " +
                "o.Price, os.Detail AS OrderStatusName, ps.Name AS OrderPaymentName " +
                "FROM [Order] o " +
                "JOIN Customer c ON o.CustomerID = c.CustomerID " +
                "JOIN Account a ON c.AccountID = a.AccountID " +
                "JOIN OrderStatus os ON o.StatusID = os.StatusID " +
                "LEFT JOIN PaymentStatement ps ON o.PaymentStatementID = ps.PaymentStatementID";

        try (
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                orderList.add(new OrderResponse(resultSet.getInt(1)
                ,resultSet.getString(2)
                ,resultSet.getTimestamp(3).toLocalDateTime()
                ,resultSet.getInt(4)
                ,resultSet.getString(5)
                ,resultSet.getString(6)));
            }
            return orderList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int addOrder(Order order) {
        int orderID = -1;
        String sql = "INSERT INTO [Order] (CustomerID, PaymentStatementID, ContactInformationID, VoucherID, Price, OrderTime, StatusID) VALUES (?, ?, ?, ?, ?, ?, ?)";
        System.out.println(order.getCustomerID());
        try {
            PreparedStatement st= connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, order.getCustomerID());
            st.setInt(2, order.getPaymentStatementID());
            st.setInt(3,order.getContactInformationID());
            if (order.getVoucherID() != null) {
                st.setInt(4, order.getVoucherID());
            } else {
                st.setNull(4, java.sql.Types.INTEGER);
            }
            st.setInt(5,order.getPrice());
            if (order.getOrderTime() != null) {
                st.setTimestamp(6, java.sql.Timestamp.valueOf(order.getOrderTime()));
            } else {
                st.setNull(6, java.sql.Types.TIMESTAMP);
            }
            st.setInt(7,order.getStatusID());
            st.executeUpdate();

            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                orderID = rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderID;
    }

    public static void main(String[] args) {
            OrderDAO dao = new OrderDAO();
            Order o = new Order(1,1,13,4,173068,LocalDateTime.now(),1);
        System.out.println(o.getCustomerID());
        int a =dao.addOrder(o);
        System.out.println(a);

    }


}
