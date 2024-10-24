package dal;

import common.Encrypt;
import common.InsertPrepareStatement;
import model.Account;
import model.Origin;
import model.Product;

import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collections;
import java.util.List;

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

    public List<Product> getAllProduct(){
        try{
            PreparedStatement ps = connection.prepareStatement("select ProductID,Price,DiscountID,Weight,CategoryID,ManufacturerID,OriginID,UnitID,CertificationID,StatusID,Name,Detail from Product");
            return (List<Product>) (Object) getListObject(ps);
        }catch(SQLException e){
            logger.info(getClass().getName()+": "+e.getMessage());
        }
        return Collections.emptyList();
    }

    public boolean deleteProduct(int prodcutID) {
        String sql = "DELETE FROM Product WHERE ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, prodcutID);
            return ps.executeUpdate()>0;
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
        }
        return false;
    }

    public boolean updateProduct(Product product) {
        String sql = "UPDATE Product SET Price = ?, DiscountID =?, Weight =?, CategoryID =?, ManufacturerID =?, OriginID =?, UnitID =?, CertificationID =?, StatusID =?, Name =?, Detail =? WHERE ProductID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, product.getPrice());
            InsertPrepareStatement.insertInteger(product.getDiscountID(),ps,2);
            ps.setInt(3,product.getWeight());
            ps.setInt(4,product.getCategoryID());
            ps.setInt(5,product.getManufacturerID());
            ps.setInt(6,product.getOriginID());
            ps.setInt(7,product.getUnitID());
            ps.setInt(8,product.getCertificationID());
            ps.setInt(9,product.getStatusID());
            ps.setNString(10,product.getName());
            ps.setNString(11,product.getDetail());
            ps.setInt(12,product.getProductID());
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
        }
        return false;
    }

    public Integer addProduct(Product product) {
        String sql = "INSERT INTO Product (Price,DiscountID,Weight,CategoryID,ManufacturerID,OriginID,UnitID,CertificationID,StatusID,Name,Detail) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, product.getPrice());
            InsertPrepareStatement.insertInteger(product.getDiscountID(),ps,2);
            ps.setInt(3,product.getWeight());
            ps.setInt(4,product.getCategoryID());
            ps.setInt(5,product.getManufacturerID());
            ps.setInt(6,product.getOriginID());
            ps.setInt(7,product.getUnitID());
            ps.setInt(8,product.getCertificationID());
            ps.setInt(9,product.getStatusID());
            ps.setNString(10,product.getName());
            ps.setNString(11,product.getDetail());
            ResultSet rs = executeUpdate(ps);
            if(rs!=null && rs.next()){
                return rs.getInt("ProductID");
            }
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
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
