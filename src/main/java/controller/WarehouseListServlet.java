package controller;

import dal.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "WarehouseListServlet", value = "/warehouseList")
public class WarehouseListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        if (search == null) {search = "";}
        // Initialize DAO objects
        ContactInformationDAO contactInfoDAO = new ContactInformationDAO();
        WarehouseStatusDAO statusDAO = new WarehouseStatusDAO();
        WarehouseDAO warehouseDAO = new WarehouseDAO();

        List<Warehouse> warehouseList = warehouseDAO.searchWarehouses(search);

        List<WarehouseStatus> statusList = statusDAO.getAllWarehouseStatuses();

        for (Warehouse warehouse : warehouseList) {
            ContactInformation contactInfo = contactInfoDAO.getContactInformationByContactID(warehouse.getContactInformationID());
            WarehouseStatus status = statusDAO.getStatusByStatusID(warehouse.getStatusID());

            request.setAttribute("contactInfo_" + warehouse.getContactInformationID(), contactInfo);
            request.setAttribute("status_" + warehouse.getStatusID(), status);
        }

        request.setAttribute("warehouseList", warehouseList);
        request.setAttribute("statusList", statusList);
        request.getRequestDispatcher("warehouseList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement POST method if needed
    }
}
