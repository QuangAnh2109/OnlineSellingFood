package controller;


import dal.OrderDAO;
import dal.OrderProductDAO;
import dal.ProductDAO;
import dto.OrderResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.List;


@WebServlet(name = "DashboardServlet", value = "/Dashboard")
public class DashboardServlet extends HttpServlet {

    private OrderProductDAO orderProductDAO;





    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderProductDAO dao = new OrderProductDAO();
        double totalRevenue = dao.getTotalRevenue();
        OrderDAO dao1 = new OrderDAO();
        int totalOrders = dao1.getTotalOrders();
        ProductDAO dao2 = new ProductDAO();
        int totalProducts = dao2.getTotalProducts();
        List<OrderResponse> orderList = dao1.getAllOrders();
        request.setAttribute("orderList", orderList);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalProducts", totalProducts);
        request.getRequestDispatcher("DashboardSale.jsp").forward(request, response);

    }
}
