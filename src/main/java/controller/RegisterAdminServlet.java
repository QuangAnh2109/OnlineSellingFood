package controller;

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

@WebServlet(name = "RegisterAdminServlet", urlPatterns = {"/register-admin"})
public class RegisterAdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/nest-backend/page-account-register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> errorMessages = new ArrayList<>();

        // Get form parameters
        String roleID = request.getParameter("roleID");
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

        // Find or add contact information
        ContactInformation contact = contactInfoDAO.getContactInformationByAddressAndPhone(address, phoneNumber);
        boolean checkContactExist = true;
        if (contact == null) {
            checkContactExist = false;
            contact = new ContactInformation(address, phoneNumber);
            try {
                ResultSet rs = contactInfoDAO.addContact(contact);
                rs.next();
                contact.setContactInformationID(rs.getInt(1));
            } catch (SQLException e) {
                errorMessages.add(e.getMessage());
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }

        try {
            // Create the new Account
            Account newAccount = new Account(
                    Integer.parseInt(roleID),
                    Integer.parseInt(birthYearStr),
                    contact.getContactInformationID(),
                    3,  // Status ID for active accounts
                    email,
                    firstName,
                    lastName,
                    "123456789",  // Default password
                    LocalDateTime.now()
            );

            if (errorMessages.isEmpty()) {
                // Add account to the database
                ResultSet accountResult = accountDAO.addAccount(newAccount);
                if (accountResult != null && accountResult.next()) {
                    int accountID = accountResult.getInt(1);

                    // Insert Staff record with default salary and warehouseID set to 0
                    Staff newStaff = new Staff(accountID, 0, 0);
                    staffDAO.addStaff(newStaff);

                    response.sendRedirect("success.jsp");
                } else {
                    // Rollback contact information in case of failure
                    if (!checkContactExist) contactInfoDAO.deleteContact(contact.getContactInformationID());
                    errorMessages.add("Registration failed. Please try again.");
                    request.setAttribute("errorMessages", errorMessages);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            // Handle exception and display error
            errorMessages.add("An error occurred during registration: " + e.getMessage());
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
