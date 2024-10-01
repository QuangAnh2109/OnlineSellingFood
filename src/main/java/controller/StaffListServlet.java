package controller;

import dal.StaffDAO;
import dto.StaffListResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "StaffListServlet", urlPatterns = {"/staffList"})
public class StaffListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StaffDAO sd = new StaffDAO();
        List<StaffListResponse> sls=sd.getAllStaff();
        request.setAttribute("staffList", sls);
        request.getRequestDispatcher("staff-list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}