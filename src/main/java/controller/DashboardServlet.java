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
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


import javax.swing.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "DashboardServlet", value = "/Dashboard")
public class DashboardServlet extends HttpServlet {

    private OrderProductDAO orderProductDAO;





    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = 0;
        if (request.getParameter("index") != null) {
            index = Integer.parseInt(request.getParameter("index"));
        }
        OrderProductDAO dao = new OrderProductDAO();
        double totalRevenue = dao.getTotalRevenue();
        OrderDAO dao1 = new OrderDAO();
        int totalOrders = dao1.getTotalOrders();
        ProductDAO dao2 = new ProductDAO();
        int totalProducts = dao2.getTotalProducts();
        List<OrderResponse> orderList = dao1.getAllOrdersd(index);
        int totalRecords = dao1.getTotalOrders();
        int endPage = totalRecords / 5;
        if (totalRecords % 5 != 0) {
            endPage++;
        }
        request.setAttribute("endPage", endPage);




        request.setAttribute("orderList", orderList);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalProducts", totalProducts);
        request.getRequestDispatcher("DashboardSale.jsp").forward(request, response);

    }


}
