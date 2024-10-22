
import dal.CartDAO;
import model.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cart;
import model.Product;
import dal.CartDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {

    private CartDAO cartDAO;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        cartDAO = new CartDAO();
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect("login");
            return;
        }

        Integer customerID = account.getAccountID();
        session.setAttribute("customerID", customerID);
        session.setAttribute("account", account);

        // Retrieve cart items
        List<Cart> cartItems = cartDAO.getCartByCustomerID(customerID);
        List<Product> products = new ArrayList<>();
        double total = 0;

        // Check if cartItems is empty
        if (cartItems.isEmpty()) {
            System.out.println("Cart is empty for customer ID: " + customerID);
        }

        // Retrieve product details
        for (Cart item : cartItems) {
            Product product = productDAO.getProductByID(item.getProductID());
            if (product != null) {
                products.add(product);
                total += product.getPrice();
            } else {
                System.out.println("Product not found for ID: " + item.getProductID());
            }
        }

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("products", products);
        request.setAttribute("total", total);
        request.getRequestDispatcher("shop-cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer customerID = (Integer) session.getAttribute("customerID");
        if (customerID == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");
        int productID = Integer.parseInt(request.getParameter("productID"));

        switch (action) {
            case "add":
                // Kiểm tra sản phẩm đã có trong giỏ hàng chưa
                Cart existingItem = cartDAO.getCartItem(customerID, productID);
                if (existingItem == null) {
                    cartDAO.addToCart(customerID, productID);
                }
                break;

            case "remove":
                cartDAO.removeFromCart(customerID, productID);
                break;

            case "clear":
                cartDAO.clearCart(customerID);
                break;

            case "update":
                // Có thể thêm logic cập nhật số lượng ở đây
                break;
        }

        // Redirect back to cart page
        response.sendRedirect("shop-cart");

    }
}