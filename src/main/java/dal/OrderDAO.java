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
;
    public int countOrdersComplete()  {
        int totalexrOrders = 0;
        try {
        String query = "SELECT COUNT(*) AS total FROM [Order] o " +
                "WHERE o.StatusID =  4";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                totalexrOrders = resultSet.getInt("total");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalexrOrders;
    }



    public int countOrdersBeingDelivery()  {
        int totalexrOrders = 0;
        try {
            String query = "SELECT COUNT(*) AS total FROM [Order] o " +
                    "WHERE o.StatusID = 3";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                totalexrOrders = resultSet.getInt("total");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalexrOrders;
    }


    public int countOtherOrders()  {
        int totalOtherOrders = 0;
        try {
        String query = "SELECT COUNT(*) AS total FROM [Order] o"+
           " WHERE o.StatusID NOT IN (3,4)";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                totalOtherOrders = resultSet.getInt("total");
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalOtherOrders;


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
    public List<OrderResponse> getAllOrdersdComplete(int index) {
        List<OrderResponse> orderList = new ArrayList<>();


        if (index == 1) {
            index = 0;
        } else if (index != 0) {
            index = (index - 1) * 5;
        }


        String query = "SELECT o.OrderID, a.Name AS CustomerName, o.OrderTime AS OrderDate, " +
                "o.Price, os.Detail AS OrderStatusName, ps.Name AS OrderPaymentName " +
                "FROM [Order] o " +
                "JOIN Customer c ON o.CustomerID = c.CustomerID " +
                "JOIN Account a ON c.AccountID = a.AccountID " +
                "JOIN OrderStatus os ON o.StatusID = os.StatusID " +
                "LEFT JOIN PaymentStatement ps ON o.PaymentStatementID = ps.PaymentStatementID "+
                "WHERE o.StatusID = 4";
        query += "ORDER BY o.OrderID OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";

        try (PreparedStatement statement = connection.prepareStatement(query)) {

            int paramIndex = 1;


            statement.setInt(paramIndex, index);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    orderList.add(new OrderResponse(
                            resultSet.getInt(1),
                            resultSet.getString(2),
                            resultSet.getTimestamp(3).toLocalDateTime(),
                            resultSet.getInt(4),
                            resultSet.getString(5),
                            resultSet.getString(6)
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }
    public List<OrderResponse> getAllOrdersdBeing(int index) {
        List<OrderResponse> orderList = new ArrayList<>();


        if (index == 1) {
            index = 0;
        } else if (index != 0) {
            index = (index - 1) * 5;
        }


        String query = "SELECT o.OrderID, a.Name AS CustomerName, o.OrderTime AS OrderDate, " +
                "o.Price, os.Detail AS OrderStatusName, ps.Name AS OrderPaymentName " +
                "FROM [Order] o " +
                "JOIN Customer c ON o.CustomerID = c.CustomerID " +
                "JOIN Account a ON c.AccountID = a.AccountID " +
                "JOIN OrderStatus os ON o.StatusID = os.StatusID " +
                "LEFT JOIN PaymentStatement ps ON o.PaymentStatementID = ps.PaymentStatementID "+
                "WHERE o.StatusID = 3";
        query += "ORDER BY o.OrderID OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";

        try (PreparedStatement statement = connection.prepareStatement(query)) {

            int paramIndex = 1;


            statement.setInt(paramIndex, index);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    orderList.add(new OrderResponse(
                            resultSet.getInt(1),
                            resultSet.getString(2),
                            resultSet.getTimestamp(3).toLocalDateTime(),
                            resultSet.getInt(4),
                            resultSet.getString(5),
                            resultSet.getString(6)
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }
    public List<OrderResponse> getAllOrdersd(int index, String search,String orderStatus) {
        List<OrderResponse> orderList = new ArrayList<>();


        if (index == 1) {
            index = 0;
        } else if (index != 0) {
            index = (index - 1) * 5;
        }


        String query = "SELECT o.OrderID, a.Name AS CustomerName, o.OrderTime AS OrderDate, " +
                "o.Price, os.Detail AS OrderStatusName, ps.Name AS OrderPaymentName " +
                "FROM [Order] o " +
                "JOIN Customer c ON o.CustomerID = c.CustomerID " +
                "JOIN Account a ON c.AccountID = a.AccountID " +
                "JOIN OrderStatus os ON o.StatusID = os.StatusID " +
                "LEFT JOIN PaymentStatement ps ON o.PaymentStatementID = ps.PaymentStatementID ";


        if (search != null && !search.trim().isEmpty()) {
            query += "WHERE a.Name LIKE ? ";
        }
        if (orderStatus != null && !orderStatus.trim().isEmpty()) {
            if (search != null && !search.trim().isEmpty()) {
                query += "AND os.Detail = ? ";
            } else {
                query += "WHERE os.Detail = ? ";
            }
        }


        query += "ORDER BY o.OrderID OFFSET ? ROWS FETCH NEXT 5 ROWS ONLY";

        try (PreparedStatement statement = connection.prepareStatement(query)) {

            int paramIndex = 1;
            if (search != null && !search.trim().isEmpty()) {
                statement.setString(paramIndex++, "%" + search + "%");
            }

            if (orderStatus != null && !orderStatus.trim().isEmpty()) {
                statement.setString(paramIndex++, orderStatus);
            }

            statement.setInt(paramIndex, index);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    orderList.add(new OrderResponse(
                            resultSet.getInt(1),
                            resultSet.getString(2),
                            resultSet.getTimestamp(3).toLocalDateTime(),
                            resultSet.getInt(4),
                            resultSet.getString(5),
                            resultSet.getString(6)
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }

    public int getTotalOrdersWithSearch(String search) {
        String query = "SELECT COUNT(*) FROM [Order] o " +
                "JOIN Customer c ON o.CustomerID = c.CustomerID " +
                "JOIN Account a ON c.AccountID = a.AccountID ";
        if (search != null && !search.trim().isEmpty()) {
            query += "WHERE a.Name LIKE ?";
        }

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            if (search != null && !search.trim().isEmpty()) {
                statement.setString(1, "%" + search + "%");
            }

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1); // Total count
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }



    public int getTotalOrdersWithStatus(String orderStatus) {
        String query = "SELECT COUNT(*) FROM [Order] o " +
                "JOIN Customer c ON o.CustomerID = c.CustomerID " +
                "JOIN Account a ON c.AccountID = a.AccountID " +
                "JOIN OrderStatus os ON o.StatusID = os.StatusID " +
                "WHERE os.Detail = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, orderStatus); // Set the orderStatus parameter
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1); // Return the count of orders
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
