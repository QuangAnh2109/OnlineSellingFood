package controller;

import dal.OrderProductDAO;
import dto.OrderProductResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewOrderDetailForStaffServlet", urlPatterns = {"/viewOrderDetail"})
public class ViewOrderDetailForStaffServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderID=Integer.parseInt(request.getParameter("orderID"));
        String customerName=request.getParameter("customerName");
        String email=request.getParameter("email");
        String orderTime=request.getParameter("orderTime");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        OrderProductDAO orderProductDAO=new OrderProductDAO();
        List<OrderProductResponse> list=orderProductDAO.getOrderProductByOrderID(orderID);
        request.setAttribute("list", list);



        request.setAttribute("phone",phone);
        request.setAttribute("address",address);
        request.setAttribute("customerName", customerName);
        request.setAttribute("email", email);
        request.setAttribute("orderID", orderID);
        request.setAttribute("orderTime", orderTime);
        request.getRequestDispatcher("page-orders-detail.jsp").forward(request, response);
    }
}
