package controller;

import dal.CartDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Cart;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "updateCartServlet", value = "/updateCartServlet")
public class updateCartServlet extends HttpServlet {

    private CartDAO cartDAO;

    @Override
    public void init() throws ServletException {
        cartDAO = new CartDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin từ request
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Tạo một đối tượng Cart với thông tin vừa lấy
        Cart cart = new Cart();
        cart.setCustomerID(customerId);
        cart.setProductID(productId);
        cart.setQuantity(quantity);

        // Cập nhật số lượng sản phẩm trong giỏ hàng
        int affectedRows = cartDAO.update(cart);

        // Thiết lập kiểu dữ liệu trả về là JSON
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Kiểm tra kết quả cập nhật và trả về phản hồi
        if (affectedRows > 0) {
            out.print("{\"status\": \"success\"}");
        } else {
            out.print("{\"status\": \"error\"}");
        }
        out.flush();
    }
}
