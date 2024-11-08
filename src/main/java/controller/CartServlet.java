package controller;

import dal.CustomerDAO;
import dal.DiscountDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;
import dal.CartDAO;
import dal.ProductDAO;
import org.openxmlformats.schemas.presentationml.x2006.main.impl.CTCustomerDataListImpl;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        Account account = (Account) request.getSession().getAttribute("account");
        try{
            String customerIdParam = new CustomerDAO().getCustomerByAccountID(account.getAccountID()).getCustomerID()+"";
            try {
                int customerId = Integer.parseInt(customerIdParam);

                List<Cart> cartItems = cartDAO.getCartByCustomerId(customerId);

                // Check if cart is empty
                if (cartItems.isEmpty()) {
                    request.getSession().setAttribute("msg", "Không có sản phẩm nào trong giỏ hàng");
                    response.sendRedirect("shop-cart.jsp");
                    return;
                }
                DiscountDAO discountDAO = new   DiscountDAO();
                Discount discount;
                Map<Integer, Product> productMap = new HashMap<>();
                for (Cart cartItem : cartItems) {
                    Product product = productDAO.getProductById(cartItem.getProductID());
                    Integer discountID = product.getDiscountID();
                    if (discountID != null) {
                        discount = discountDAO.getDiscountById(discountID);
                        if (discount.getEndTime().isAfter(LocalDateTime.now())) {
                            product.setPrice(product.getPrice() * (100-discount.getDiscountPercent())/100);
                        }
                    }
                    productMap.put(cartItem.getProductID(), product);
                }

                request.setAttribute("cartItems", cartItems);
                request.setAttribute("productMap", productMap);

                // Calculate total price
                double total = cartItems.stream()
                        .mapToDouble(cartItem -> productMap.get(cartItem.getProductID()).getPrice() * cartItem.getQuantity())
                        .sum();
                request.setAttribute("total", total);

                RequestDispatcher dispatcher = request.getRequestDispatcher("shop-cart.jsp");
                dispatcher.forward(request, response);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Customer ID");
            }
        }catch (NullPointerException e){
            response.sendRedirect("homepage");
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
