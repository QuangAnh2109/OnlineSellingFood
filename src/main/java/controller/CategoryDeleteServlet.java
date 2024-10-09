package controller;

import dal.CategoryDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;

@WebServlet(name = "CategoryDeleteServlet", value = "/categoryDelete")
public class CategoryDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String categoryIdParam = request.getParameter("categoryID");
//        if (categoryIdParam != null) {
//            int categoryID = Integer.parseInt(categoryIdParam);
//            CategoryDAO categoryDAO = new CategoryDAO();
//            categoryDAO.deleteCategory(categoryID);
//        }
//
//        response.sendRedirect("categoryList.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryIdParam = request.getParameter("categoryID");
        if (categoryIdParam != null) {
            int categoryID = Integer.parseInt(categoryIdParam);
            CategoryDAO categoryDAO = new CategoryDAO();
            categoryDAO.deleteCategory(categoryID);
        }
        response.sendRedirect("categoryList");
    }
}
