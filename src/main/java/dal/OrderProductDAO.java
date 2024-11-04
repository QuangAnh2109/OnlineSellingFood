package dal;


import model.OrderProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderProductDAO extends DBContext {
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new OrderProduct();
    }

        public double getTotalRevenue () {
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
    }

