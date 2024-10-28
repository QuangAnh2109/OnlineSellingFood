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
import jakarta.servlet.http.HttpSession;
import model.Import;
import model.Supplier;
import model.Warehouse;


import java.io.IOException;

import java.util.List;

@WebServlet(name = "ImportServlet", value = "/Import")
public class ImportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ImportDAO dao = new ImportDAO();
        List<ImportRespone> importList = dao.getImportList();
        request.setAttribute("importList", importList);

        WarehouseDAO warehouseDAO = new WarehouseDAO();
        List<Warehouse> warehouses = warehouseDAO.getAllWarehouseActivity();
        request.setAttribute("warehouses",warehouses);
        SupplierDAO supplierDAO = new SupplierDAO();
        List<Supplier> suppliers = supplierDAO.getAllSupplierActivity();
        request.setAttribute("suppliers",suppliers);

        request.getRequestDispatcher("ImportList.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int staffID = Integer.parseInt(request.getParameter("staffID"));
        int warehouseID = Integer.parseInt(request.getParameter("warehouseID"));
        int supplierID = Integer.parseInt(request.getParameter("supplierID"));
        String time = request.getParameter("time");

        // Thêm bản ghi vào cơ sở dữ liệu
        ImportDAO dao = new ImportDAO();
        boolean isAdded = dao.addImport(staffID, warehouseID, supplierID, time);
        response.sendRedirect("Import");
    }
    }

