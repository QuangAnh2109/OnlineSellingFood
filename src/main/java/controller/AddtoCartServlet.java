package controller;
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
public class AddtoCartServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            response.sendRedirect("page-login.jsp");
            return;
        }

        // Lấy customerID từ accountID
        CustomerDAO customerDAO = new CustomerDAO();
        Customer customer = customerDAO.getCustomerByAccountID(account.getAccountID());

        if (customer == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        int customerID = customer.getCustomerID();

        // Sử dụng CartDAO để thêm sản phẩm vào giỏ hàng
        CartDAO cartDAO = new CartDAO();
        Cart existingCart = cartDAO.getCartByCustomerIdAndProductId(customerID, productID);

        if (existingCart != null) {
            existingCart.setQuantity(existingCart.getQuantity() + 1);
            cartDAO.update(existingCart);
        } else {
            Cart newCart = new Cart();
            newCart.setCustomerID(customerID);
            newCart.setProductID(productID);
            newCart.setQuantity(1);
            cartDAO.insert(newCart);
        }

        // Lấy URL của trang trước đó từ header "referer" và chuyển hướng về đó
        String referer = request.getHeader("referer");
        if (referer != null && !referer.isEmpty()) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect("home-page.jsp");
        }
    }


}
