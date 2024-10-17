package controller;

import dal.CategoryDAO;
import java.io.IOException;

import dal.WarehouseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "WarehouseDeleteServlet", value = "/warehouseDelete")
public class WarehouseDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String warehouseID = request.getParameter("warehouseID");
//        if (warehouseID != null) {
//            int warehouseID1 = Integer.parseInt(warehouseID);
//            WarehouseDAO warehouseDAO1 = new WarehouseDAO();
//            warehouseDAO1.deleteWarehouse(warehouseID1);
//        }
//        response.sendRedirect("warehouseList");
//    }
}
