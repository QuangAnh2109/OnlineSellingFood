package controller;


import dal.ImportProductDAO;
import dal.SupplierDAO;
import dal.WarehouseDAO;
import dto.ImportProductResponse;
import dto.OrderResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DashboardIServlet", value = "/DashboardI")
public class DashboardIServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = 0;
        if (request.getParameter("index") != null) {
            index = Integer.parseInt(request.getParameter("index"));
        }

        WarehouseDAO warehouseDAO = new WarehouseDAO();
        int totalWarehouse = warehouseDAO.getTotalWarehouses();
        SupplierDAO supplierDAO = new SupplierDAO();
        int totalSupplier = supplierDAO.getTotalSuppliers();
        ImportProductDAO dao = new ImportProductDAO();
        List<ImportProductResponse> importList =  dao.getAllImportProductsd(index);
        int totalRecords = dao.getTotalImports();
        int endPage = totalRecords / 5;
        if (totalRecords % 5 != 0) {
            endPage++;
        }
        request.setAttribute("endPage", endPage);




        request.setAttribute("importList", importList);
        request.setAttribute("totalWarehouse", totalWarehouse);
        request.setAttribute("totalSupplier", totalSupplier);
        request.getRequestDispatcher("DashboardImport.jsp").forward(request, response);
    }
}
