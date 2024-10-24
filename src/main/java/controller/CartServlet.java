
import dal.CartDAO;
import model.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import model.Cart;
import model.Product;
import model.Customer;
import dal.ProductDAO;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import dal.CustomerDAO;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})  // Thêm cả 2 URL pattern
public class CartServlet extends HttpServlet {
    private CartDAO cartDAO;
    private ProductDAO productDAO;
    private CustomerDAO customerDAO;

    @Override
    public void init() throws ServletException {
        cartDAO = new CartDAO();
        productDAO = new ProductDAO();
        customerDAO = new CustomerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        // Debug log
        System.out.println("Account: " + account);

        if (account == null) {
            response.sendRedirect("login");
            return;
        }
        Customer customer = customerDAO.getCustomerByAccountID(account.getAccountID());

        if (customer == null) {
            // If no customer details are found, redirect to login
            response.sendRedirect("login");
            return;
        }
        Integer customerID = customer.getCustomerID();
        Integer AccountID = account.getAccountID();
        System.out.println("CustomerID: " + customerID);

        session.setAttribute("customerID", customerID);
        session.setAttribute("account", account);

        // Retrieve cart items
        List<Cart> cartItems = cartDAO.getCartByCustomerID(customerID);
        System.out.println("Cart Items size: " + cartItems.size());

        List<Product> products = new ArrayList<>();
        double total = 0;

        // Retrieve product details
        for (Cart item : cartItems) {
            Product product = productDAO.getProductByID(item.getProductID());
            System.out.println("Product found for ID " + item.getProductID() + ": " + product);

            if (product != null) {
                products.add(product);
                total += product.getPrice();
            }
        }

        System.out.println("Total Products: " + products.size());
        System.out.println("Total Price: " + total);

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("products", products);
        request.setAttribute("total", total);
        request.getRequestDispatcher("shop-cart.jsp").forward(request, response);
        System.out.println("Cart Items size: " + cartItems.size());
        System.out.println("Products size: " + products.size());
        System.out.println("Total: " + total);
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
        String productIDParam = request.getParameter("productID");

        if (action == null || productIDParam == null) {
            response.sendRedirect("cart");
            return;
        }

        int productID = Integer.parseInt(productIDParam);

        switch (action) {
            case "add":
                Cart existingItem = cartDAO.getCartItem(customerID, productID);
                if (existingItem == null) {
                    boolean added = cartDAO.addToCart(customerID, productID);
                    System.out.println("Product " + productID + " added to cart: " + added);
                }
                break;

            case "remove":
                boolean removed = cartDAO.removeFromCart(customerID, productID);
                System.out.println("Product " + productID + " removed from cart: " + removed);
                break;

            case "clear":
                boolean cleared = cartDAO.clearCart(customerID);
                System.out.println("Cart cleared: " + cleared);
                break;
        }

        response.sendRedirect("cart");
    }
}