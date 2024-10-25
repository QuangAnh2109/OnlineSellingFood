package controller;


import dal.ImportDAO;
import dal.SupplierDAO;
import dal.WarehouseDAO;
import dto.ImportRespone;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import java.util.List;

@WebServlet(name = "ImportServlet", value = "/Import")
public class ImportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ImportDAO dao = new ImportDAO();
        List<ImportRespone> importList = dao.getImportList(); // Lấy danh sách nhập hàng từ DAO
        if (importList == null || importList.isEmpty()) {

            request.getRequestDispatcher("page-login.jsp").forward(request, response);
        } else {
            request.setAttribute("importList", importList);
            request.setAttribute("mess","Null");
            request.getRequestDispatcher("ImportList.jsp").forward(request, response);

        }



    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
    }

