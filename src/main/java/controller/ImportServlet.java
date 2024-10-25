package controller;


import dal.ImportDAO;
import dal.SupplierDAO;
import dal.WarehouseDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Import;
import model.Supplier;
import model.Warehouse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "ImportServlet", value = "/Import")
public class ImportServlet extends HttpServlet {
    private final ImportDAO importDAO = new ImportDAO();
    private final WarehouseDAO warehouseDAO = new WarehouseDAO(); // Khởi tạo WarehouseDAO
    private final SupplierDAO supplierDAO = new SupplierDAO(); // Khởi tạo SupplierDAO
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve list of imports
            List<Import> imports = importDAO.getAllImports();
            request.setAttribute("imports", imports);

            // Retrieve list of warehouses
            List<Warehouse> warehouseList = warehouseDAO.getAllWarehouses();
            request.setAttribute("warehouseList", warehouseList);

            // Retrieve list of suppliers
            List<Supplier> supplierList = supplierDAO.getAllSuppliers();
            request.setAttribute("supplierList", supplierList);

            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("ImportList.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            log("Error retrieving import data: ", e); // Log error for debugging
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while retrieving imports.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
    }

