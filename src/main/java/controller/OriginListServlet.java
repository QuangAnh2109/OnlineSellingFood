package controller;

import java.io.IOException;
import java.util.List;
import dal.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import dal.OriginDAO;
import model.Origin;

@WebServlet(name = "OriginListServlet", value = "/originList")
public class OriginListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OriginDAO originDAO = new OriginDAO();
        List<Origin> originList = originDAO.getAllOrigins();
        request.setAttribute("originList", originList);
        request.getRequestDispatcher("page-origin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
