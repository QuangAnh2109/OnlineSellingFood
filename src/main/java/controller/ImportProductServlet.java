package controller;

import dal.ImportProductDAO;
import dto.ImportProductResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ImportProductServlet", value = "/ImportProduct")
public class ImportProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ImportProductDAO dao = new ImportProductDAO();
        String importIDStr = request.getParameter("importID");
        if (importIDStr != null) {
            int importID = Integer.parseInt(importIDStr);
            List<ImportProductResponse> list = dao.getAllImportProducts(importID);
            request.setAttribute("list", list);
        }

        request.getRequestDispatcher("importProduct.jsp").forward(request, response);
    }
}
