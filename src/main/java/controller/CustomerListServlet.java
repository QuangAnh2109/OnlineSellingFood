package controller;

import dal.CustomerDAO;
import dal.StaffDAO;
import dto.StaffListResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerListServlet", urlPatterns = {"/customerList"})
public class CustomerListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String indexPage=request.getParameter("index");
        if(indexPage==null){
            indexPage="1";
        }
        int index=Integer.parseInt(indexPage);
        CustomerDAO cdao = new CustomerDAO();
        int count=cdao.getTotalAccountCustomer();
        int endPage=count/5;
        if(count%5!=0){
            endPage++;
        }


        List<StaffListResponse> sls= cdao.getAllCustomer(index);
        request.setAttribute("customerList", sls);
        request.setAttribute("index", index);
        request.setAttribute("endPage", endPage);
        request.getRequestDispatcher("customer-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}