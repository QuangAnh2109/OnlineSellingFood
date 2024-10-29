import dal.CartDAO;
import dal.CustomerDAO;
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

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
public class CartServlet extends HttpServlet {
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
        response.setContentType("text/html;charset=UTF-8");
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

            int customerId = customer.getCustomerID();

            // Get cart items by CustomerID
            List<Cart> cartItems = cartDAO.getCartByCustomerId(customerId);

            // Create a list to hold products
            List<Product> productsInCart = new ArrayList<>();

            // Fetch product details for each cart item
            for (Cart cart : cartItems) {
                Product product = productDAO.getProductByID(cart.getProductID());
                if (product != null) {
                    productsInCart.add(product);
                }
            }

            // Set products in request to be accessed in JSP
            request.setAttribute("products", productsInCart);

            // Forward to cart page
            request.getRequestDispatcher("shop-cart.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your cart");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}