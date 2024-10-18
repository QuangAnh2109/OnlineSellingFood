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

@WebServlet(name = "SupplierListServlet", value = "/supplierList")
public class SupplierListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        if (search == null) {
            search = "";
        }
        ContactInformationDAO contactInfoDAO = new ContactInformationDAO();
        SupplierDAO supplierDAO = new SupplierDAO();
        List<Supplier> supplierList = supplierDAO.searchSuppliers(search);

        for (Supplier supplier : supplierList) {
            ContactInformation contactInfo = contactInfoDAO.getContactInformationByContactID(supplier.getContactInformationID());
            request.setAttribute("contactInfo_" + supplier.getContactInformationID(), contactInfo);
        }

        request.setAttribute("supplierList", supplierList);
        request.getRequestDispatcher("supplierList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Implement POST method if needed
    }
}
