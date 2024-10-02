package controller;

import dal.WarehouseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import dal.AccountDAO;
import dal.ContactInformationDAO;
import model.ContactInformation;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.ArrayList;
import java.util.List;
import model.Staff;
import dal.StaffDAO;
import model.Warehouse;

@WebServlet(name = "RegisterStaffServlet", urlPatterns = {"/registerstaff"})
public class RegisterStaffServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        WarehouseDAO warehouseDAO = new WarehouseDAO();
        List<Warehouse> warehouses = warehouseDAO.getAllWarehouseActivity();
        request.setAttribute("warehouses",warehouses);
        request.getRequestDispatcher("page-register-staff.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> errorMessages = new ArrayList<>();

        // Get form parameters
        String roleID = request.getParameter("roleID");
        String warehouseID = request.getParameter("WarehouseID");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String birthYearStr = request.getParameter("birthYear");
        String phoneNumber = request.getParameter("phone");
        String address = request.getParameter("address");

        // Validate input lengths
        if (address.length() < 5 || address.length() > 200) {
            errorMessages.add("Address must be between 5 and 200 characters.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        if (phoneNumber.length() < 6 || phoneNumber.length() > 11) {
            errorMessages.add("Phone number must be between 6 and 11 characters.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        ContactInformationDAO contactInfoDAO = new ContactInformationDAO();
        AccountDAO accountDAO = new AccountDAO();
        StaffDAO staffDAO = new StaffDAO();  // Add StaffDAO to manage staff data

        // Find contact information in the database
        ContactInformation contact = contactInfoDAO.getContactInformationByAddressAndPhone(address, phoneNumber);
        //if contact don't have in database, add new contact to database
        if (contact == null) {
            contact = new ContactInformation(address, phoneNumber);
            contact.setContactInformationID(contactInfoDAO.addContact(contact));
        }

        try {
            if(errorMessages.isEmpty()) {
                // Create the new Account
                Account newAccount = new Account(Integer.parseInt(roleID), Integer.parseInt(birthYearStr), contact.getContactInformationID(), 3, email, firstName, lastName, "123456789", LocalDateTime.now());
                // Add account to the database
                Integer accountID = accountDAO.addAccount(newAccount);
                if (accountID != null) {
                    // Insert Staff record with default salary and warehouseID set to 0
                    Staff newStaff = new Staff(accountID, 1000, Integer.parseInt(warehouseID));
                    staffDAO.addStaff(newStaff);
                    request.getSession().setAttribute("msg", "Successfully added staff.");
                    response.sendRedirect("registerstaff");
                } else {
                    // Rollback the contact information in case of failure
                    contactInfoDAO.deleteContact(contact.getContactInformationID());
                    request.getSession().setAttribute("msg", "Don't Successfully added staff.");
                    response.sendRedirect("registerstaff");
                }
            }
        } catch (Exception e) {
            // Handle exception and display error
            request.getSession().setAttribute("msg", "Don't Successfully added staff.");
            response.sendRedirect("registerstaff");
        }
    }
}
