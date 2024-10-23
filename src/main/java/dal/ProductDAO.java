package dal;

import common.Encrypt;
import model.Account;
import model.Product;

import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDAO extends DBContext{
    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        return new Product(rs.getInt("ProductID")
                ,rs.getInt("Price")
                ,rs.getObject("DiscountID",Integer.class)
                ,rs.getInt("Weight")
                ,rs.getInt("CategoryID")
                ,rs.getInt("ManufacturerID")
                ,rs.getInt("OriginID")
                ,rs.getInt("UnitID")
                ,rs.getInt("CertificationID")
                ,rs.getInt("StatusID")
                ,rs.getString("Name")
                ,rs.getString("Detail"));
    }

    public Product getProductByID(int productID){
        try{
            PreparedStatement ps = connection.prepareStatement("select ProductID,Price,DiscountID,Weight,CategoryID,ManufacturerID,OriginID,UnitID,CertificationID,StatusID,Name,Detail from Product where ProductID=?");
            ps.setInt(1, productID);
            return (Product)getObject(ps);
        }catch (SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return null;
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
