
import dal.CartDAO;
import dal.CustomerDAO;
import dal.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.Cart;
import model.Customer;
import model.Product;

import java.io.IOException;

@WebServlet(name = "AddToCartServlet", value = "/addtocart")
public class AddToCartServlet extends HttpServlet {
    private CartDAO cartDAO;
    private CustomerDAO customerDAO;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        cartDAO = new CartDAO();
        customerDAO = new CustomerDAO();
        productDAO = new ProductDAO();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        try {
            // Get account from session
            Account account = (Account) session.getAttribute("account");

            if (account == null) {
                // Redirect to login if not logged in
                response.sendRedirect("login");
                return;
            }

            // Get CustomerID from AccountID
            int accountId = account.getAccountID();
            Customer customer = customerDAO.getCustomerByAccountId(accountId);

            if (customer == null) {
                // Handle case where account is not a customer
                request.setAttribute("errorMessage", "This account is not a customer account");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            int customerID = customer.getCustomerID();

            // Get product ID from request
            String productIdStr = request.getParameter("productID");
            int productID = Integer.parseInt(productIdStr);

            // Check if product exists
            Product product = productDAO.getProductByID(productID);
            if (product != null) {
                Cart existingCart = cartDAO.getCartByCustomerIdAndProductId(customerID, productID);

                if (existingCart == null) {
                    // Product not in cart, add with quantity 1
                    Cart cart = new Cart();
                    cart.setCustomerID(customerID);
                    cart.setProductID(productID);
                    cart.setQuantity(1); // Default quantity

                    cartDAO.insert(cart);
                } else {
                    // Product already in cart, update quantity
                    existingCart.setQuantity(existingCart.getQuantity() + 1);
                    cartDAO.update(existingCart);
                }
            }

            // Redirect or forward to a cart page or confirmation message
            response.sendRedirect("homepage"); // Modify the path as needed
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while adding to cart.");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
