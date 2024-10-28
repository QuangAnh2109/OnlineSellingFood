package dal;

import model.Product;
import model.Warehouse;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class ProductDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Product(rs.getInt("productID"),rs.getInt("price"),rs.getInt("discountID"),rs.getInt("weight"),rs.getInt("categoryID"),rs.getInt("manufacturerID"),rs.getInt("originID"),rs.getInt("unitID"),rs.getInt("certificationID"),rs.getInt("statusID"),rs.getString("name"),rs.getString("detail"));
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
    public List<Product> getAllProductActivity(){
        try{
            PreparedStatement ps = connection.prepareStatement("select * from Product ");
            return (List<Product>) (Object) getListObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return Collections.emptyList();
    }
}
