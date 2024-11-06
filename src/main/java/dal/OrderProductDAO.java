package dal;


import dto.OrderProductResponse;
import model.OrderProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderProductDAO extends DBContext {
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new OrderProduct();
    }

    public double getTotalRevenue() {
        double totalRevenue = 0.0;
        try {

            String query = "SELECT Price, Quantity FROM dbo.OrderProduct";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                double price = resultSet.getDouble("Price");
                int quantity = resultSet.getInt("Quantity");
                totalRevenue += price * quantity;
            }

            resultSet.close();
            statement.close();
//                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalRevenue;
    }


    public void addOrderProduct(OrderProduct orderProduct) {
        String sql = "INSERT INTO OrderProduct (OrderID, ProductID, Price, Quantity, UnitID) VALUES (?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderProduct.getOrderID());
            st.setInt(2, orderProduct.getProductID());
            st.setDouble(3, orderProduct.getPrice());
            st.setInt(4, orderProduct.getQuantity());
            st.setInt(5, orderProduct.getUnitID());
            st.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<OrderProductResponse> getOrderProductByCutomerID(int customerID) {
        List<OrderProductResponse> list = new ArrayList<>();
        String sql = "SELECT p.ProductID, p.Name AS ProductName, op.Price, op.Quantity, o.OrderTime, os.Detail " +
                "FROM OrderProduct op " +
                "JOIN [Order] o ON op.OrderID = o.OrderID " +
                "JOIN OrderStatus os ON o.StatusID = os.StatusID " +
                "JOIN Product p ON op.ProductID = p.ProductID " +
                "WHERE o.CustomerID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customerID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderProductResponse opr = new OrderProductResponse();
                opr.setProductID(rs.getInt("ProductID"));
                opr.setProductName(rs.getString("ProductName"));
                opr.setPrice(rs.getInt("Price"));
                opr.setQuantity(rs.getInt("Quantity"));
                opr.setTime(rs.getDate("OrderTime"));
                opr.setStatusDetail(rs.getString("Detail"));
                list.add(opr);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }


}


