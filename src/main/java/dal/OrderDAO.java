package dal;

import dto.ImportProductResponse;
import dto.OrderResponse;
import model.Order;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Order();
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

    public List<OrderResponse> getAllOrdersd(int index) {
        List<OrderResponse> orderList = new ArrayList<>();
        if (index ==1 ){index = 0;}
        if(index != 0){
            index = (index-1)*5;}
        String query = "SELECT o.OrderID, a.Name AS CustomerName, o.OrderTime AS OrderDate, " +
                "o.Price, os.Detail AS OrderStatusName, ps.Name AS OrderPaymentName " +
                "FROM [Order] o " +
                "JOIN Customer c ON o.CustomerID = c.CustomerID " +
                "JOIN Account a ON c.AccountID = a.AccountID " +
                "JOIN OrderStatus os ON o.StatusID = os.StatusID " +
                "LEFT JOIN PaymentStatement ps ON o.PaymentStatementID = ps.PaymentStatementID "+
                 "order by o.OrderID offset " + index +" rows fetch next 5 rows only";

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
}
