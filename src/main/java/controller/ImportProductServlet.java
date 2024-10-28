package controller;

import dal.ImportDAO;
import dal.ImportProductDAO;
import dto.ImportProductResponse;
import dto.ImportRespone;
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


        ImportProductDAO daoP = new ImportProductDAO();
        int importID = Integer.parseInt(request.getParameter("id"));

        List<ImportProductResponse> list = daoP.getAllImportProducts(importID);
        request.setAttribute("list", list);


        request.getRequestDispatcher("importProduct.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int importID = Integer.parseInt(request.getParameter("importId"));
        int productID = Integer.parseInt(request.getParameter("productID"));
        String mfg = request.getParameter("mfg");
        String exp = request.getParameter("exp");
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int inventory = Integer.parseInt(request.getParameter("inventory"));
        int unitId = Integer.parseInt(request.getParameter("unitID"));

        // Thêm bản ghi vào cơ sở dữ liệu
        ImportProductDAO daoP = new ImportProductDAO();
        boolean isAdded = daoP.addImportProduct(importID, productID, mfg, exp, price, quantity, inventory, unitId);

        response.sendRedirect("ImportProduct");
    }
}

