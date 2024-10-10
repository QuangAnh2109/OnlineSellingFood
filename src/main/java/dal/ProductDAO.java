package dal;

import model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Product(rs.getInt(1)
                ,rs.getInt(2)
                ,rs.getInt(3)
                ,rs.getInt(4)
                ,rs.getInt(5)
                ,rs.getInt(6)
                ,rs.getInt(7)
                ,rs.getInt(8)
                ,rs.getInt(9)
                ,rs.getInt(9)
                ,rs.getString(10)
                ,rs.getString(11));
    }
    public void deleteDiscount(int productID){
        String sql="UPDATE [dbo].[Product]\n" +
                "   SET \n" +
                "      [DiscountID] =NULL\n" +
                "      \n" +
                " WHERE ProductID=?";

        try{
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
