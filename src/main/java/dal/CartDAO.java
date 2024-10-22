package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Cart;

public class CartDAO extends DBContext {

    @Override
    protected Object getObjectByRs(ResultSet rs) throws SQLException {
        Cart cart = new Cart();
        cart.setCustomerID(rs.getInt("CustomerID"));
        cart.setProductID(rs.getInt("ProductID"));
        return cart;
    }

    // Thêm sản phẩm vào giỏ hàng
    public boolean addToCart(int customerID, int productID) {
        String sql = "INSERT INTO Cart(CustomerID, ProductID) VALUES(?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, customerID);
            ps.setInt(2, productID);

            return executeUpdate(ps) != null;
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
            return false;
        }
    }

    // Xóa sản phẩm khỏi giỏ hàng
    public boolean removeFromCart(int customerID, int productID) {
        String sql = "DELETE FROM Cart WHERE CustomerID = ? AND ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, customerID);
            ps.setInt(2, productID);

            return executeUpdate(ps) != null;
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
            return false;
        }
    }

    // Lấy tất cả sản phẩm trong giỏ hàng của một khách hàng
    public List<Cart> getCartByCustomerID(int customerID) {
        String sql = "SELECT * FROM Cart WHERE CustomerID = ?";
        List<Cart> cartItems = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customerID);

            List<Object> objects = getListObject(ps);
            for (Object obj : objects) {
                cartItems.add((Cart) obj);
            }
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
        }
        return cartItems;
    }

    // Kiểm tra sản phẩm đã tồn tại trong giỏ hàng chưa
    public Cart getCartItem(int customerID, int productID) {
        String sql = "SELECT * FROM Cart WHERE CustomerID = ? AND ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customerID);
            ps.setInt(2, productID);

            Object obj = getObject(ps);
            return obj != null ? (Cart) obj : null;
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
            return null;
        }
    }

    // Xóa toàn bộ giỏ hàng của một khách hàng
    public boolean clearCart(int customerID) {
        String sql = "DELETE FROM Cart WHERE CustomerID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, customerID);

            return executeUpdate(ps) != null;
        } catch (SQLException ex) {
            logger.info(ex.getMessage());
            return false;
        }
    }
}