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
        // Retrieve the search parameter from the request
        String searchName = request.getParameter("searchName");

        // Initialize the StaffDAO to retrieve staff list
        StaffDAO sd = new StaffDAO();

        // If searchName is provided, perform a search; otherwise, get all staff
        List<StaffListResponse> sls;
        if (searchName != null && !searchName.trim().isEmpty()) {
            sls = sd.searchStaffByName(searchName);
        } else {
            sls = sd.getAllStaff();
        }

        // Set the staff list and the search query as attributes to be used in the JSP
        request.setAttribute("staffList", sls);
        request.setAttribute("searchName", searchName);

        // Forward the request to the JSP page
        request.getRequestDispatcher("staff-list.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}