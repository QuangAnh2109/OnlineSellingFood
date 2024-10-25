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
            // Lấy danh sách nhập khẩu
            List<Import> imports = importDAO.getAllImports();
            request.setAttribute("imports", imports);

            // Lấy danh sách kho
            List<Warehouse> warehouseList = warehouseDAO.getAllWarehouses();
            request.setAttribute("warehouseList", warehouseList);

            // Lấy danh sách nhà cung cấp
            List<Supplier> supplierList = supplierDAO.getAllSuppliers();
            request.setAttribute("supplierList", supplierList);

            // Chuyển tiếp đến JSP
            request.getRequestDispatcher("ImportList.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<p>Error: " + e.getMessage() + "</p>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int importID = request.getParameter("importID").isEmpty() ? 0 : Integer.parseInt(request.getParameter("importID"));
        int staffID = Integer.parseInt(request.getParameter("staffID"));
        int warehouseID = Integer.parseInt(request.getParameter("warehouseID"));
        int supplierID = Integer.parseInt(request.getParameter("supplierID"));
        Timestamp time = Timestamp.valueOf(request.getParameter("time").replace("T", " "));  // Xử lý input datetime-local

        try {
            if (importID == 0) {
                // Tạo mới nhập khẩu
                importDAO.insertImport(staffID, warehouseID, supplierID, time); // Thêm time vào hàm insert
            } else {
                // Cập nhật nhập khẩu đã tồn tại
                importDAO.updateImport(importID, warehouseID, supplierID, time); // Cập nhật supplierID và time
            }
            response.sendRedirect("Import"); // Chuyển hướng đến doGet
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<p>Error: " + e.getMessage() + "</p>");
        }
    }
    }

