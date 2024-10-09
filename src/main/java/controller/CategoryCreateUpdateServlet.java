package controller;

import java.io.IOException;
import dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;

@WebServlet(name = "CategoryCreateUpdateServlet", value = "/categoryCU")
public class CategoryCreateUpdateServlet extends HttpServlet {
    private CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String categoryID = request.getParameter("categoryID");
        if (categoryID != null) {
            CategoryDAO categoryDAO = new CategoryDAO();
            Category category = categoryDAO.getCategoryById(Integer.parseInt(categoryID));
            request.setAttribute("categoryID", category.getCategoryID());
            request.setAttribute("categoryName", category.getName());
        }
        request.getRequestDispatcher("page-origin-category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryID = request.getParameter("categoryID");
        String name = request.getParameter("name");

        CategoryDAO categoryDAO = new CategoryDAO();

        if (categoryID != null && !categoryID.isEmpty()) {
            if (name != null && !name.isEmpty()) {
                boolean isUpdated = categoryDAO.updateCategory(categoryID, name);
                if (isUpdated) {
                    response.sendRedirect("categoryList");
                } else {
                    request.setAttribute("error", "Update failed. Please try again.");
                    request.getRequestDispatcher("categoryCU").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Name cannot be empty.");
                request.getRequestDispatcher("categoryCU").forward(request, response);
            }
        } else {
            if (name != null && !name.isEmpty()) {
                boolean isCreated = categoryDAO.createCategory(name);
                if (isCreated) {
                    response.sendRedirect("categoryList");
                } else {
                    request.setAttribute("error", "Create failed. Please try again.");
                    request.getRequestDispatcher("categoryCU").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Name cannot be empty.");
                request.getRequestDispatcher("categoryCU").forward(request, response);
            }
        }
    }


}
