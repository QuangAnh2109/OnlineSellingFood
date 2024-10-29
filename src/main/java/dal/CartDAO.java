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
        cart.setQuantity(rs.getInt("quantity"));
        return cart;
    }

    public int insert(Cart cart) {
        int affectedRows = 0;
        try {
            String sql = "INSERT INTO [dbo].[Cart] (CustomerID, ProductID, Quantity) VALUES (?, ?, ?)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cart.getCustomerID());
            pre.setInt(2, cart.getProductID());
            pre.setInt(3, cart.getQuantity());
            affectedRows = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return affectedRows;
    }

    public int deleteByCustomerId(int customerId) {
        int affectedRows = 0;
        try {
            String sql = "DELETE FROM [dbo].[Cart] WHERE CustomerID = ?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, customerId);
            affectedRows = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return affectedRows;
    }

    public int getCartIdByCustomerId(int customerId) {
        int cartId = -1;
        try {
            String sql = "SELECT id FROM [dbo].[Cart]\n"
                    + " WHERE customerId = ?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, customerId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) { // Kiểm tra xem có dữ liệu trong ResultSet hay không
                cartId = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return cartId;
    }

    public List<Cart> getCartByCustomerId(int customerId) {
        List<Cart> cartItems = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Cart WHERE CustomerID = ?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, customerId);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setCustomerID(rs.getInt("CustomerID"));
                cart.setProductID(rs.getInt("ProductID"));
                cart.setQuantity(rs.getInt("Quantity"));
                cartItems.add(cart);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return cartItems;
    }

    public Cart getCartByCustomerIdAndProductId(int customerId, int productId) {
        Cart cart = null;
        try {
            String sql = "SELECT * FROM Cart WHERE CustomerID = ? AND ProductID = ?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, customerId);
            pre.setInt(2, productId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                cart = new Cart();
                cart.setCustomerID(rs.getInt("CustomerID"));
                cart.setProductID(rs.getInt("ProductID"));
                cart.setQuantity(rs.getInt("Quantity"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return cart;
    }

    // Cập nhật số lượng sản phẩm trong giỏ hàng
    public int update(Cart cart) {
        int affectedRows = 0;
        try {
            String sql = "UPDATE Cart SET Quantity = ? WHERE CustomerID = ? AND ProductID = ?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, cart.getQuantity());
            pre.setInt(2, cart.getCustomerID());
            pre.setInt(3, cart.getProductID());
            affectedRows = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return affectedRows;
    }
}