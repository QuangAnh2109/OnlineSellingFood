package controller;

import dal.ContactInformationDAO;
import dal.SupplierDAO;
import model.Supplier;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "SupplierDeleteServlet", value = "/supplierDelete")
public class SupplierDeleteServlet extends HttpServlet {
    private SupplierDAO supplierDAO = new SupplierDAO();
    private ContactInformationDAO contactInformationDAO = new ContactInformationDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String supplierID = request.getParameter("supplierID");

        if (supplierID != null && !supplierID.isEmpty()) {
            Supplier supplier = supplierDAO.getSupplier(Integer.parseInt(supplierID));

            if (supplier != null) {
                boolean isSupplierDeleted = supplierDAO.deleteSupplier(Integer.parseInt(supplierID));
                contactInformationDAO.deleteContact(supplier.getContactInformationID());

                if (isSupplierDeleted) {
                    response.sendRedirect("supplierList");
                }
                 else {
                    System.out.println("Failed to delete supplier or contact information");
                }
            } else {
                System.out.println("Supplier not found");
            }
        } else {
            System.out.println("supplierID is null or empty");
        }
    }
}
