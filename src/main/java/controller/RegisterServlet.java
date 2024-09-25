package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.ContactInformation;
import model.Customer;
import dal.AccountDAO;
import dal.ContactInformationDAO;
import dal.CustomerDAO;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/nest-frontend/page-register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> errorMessages = new ArrayList<>();

        // Get form parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String birthYearStr = request.getParameter("birthYear");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
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
        if (password.length() < 8) {
            errorMessages.add("Password must be more than 8 characters.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        if (!password.equals(confirmPassword)) {
            errorMessages.add("Passwords do not match.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        ContactInformationDAO contactInfoDAO = new ContactInformationDAO();
        AccountDAO accountDAO = new AccountDAO();

        // Find contact information in the database
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
                return;
            }
        }

        try {
            // Create the new Account
            Account newAccount = new Account(6, Integer.parseInt(birthYearStr), contact.getContactInformationID(), 1, email, firstName, lastName, password, LocalDateTime.now());

            if (errorMessages.isEmpty()) {
                ResultSet accountResult = accountDAO.addAccount(newAccount);
                if (accountResult.next()) {
                    // Get the generated AccountID
                    int accountID = accountResult.getInt(1);

                    // Create a new Customer object with initial point = 0 and level = 0
                    Customer newCustomer = new Customer(accountID, 0, 0);

                    // Insert the new Customer into the database
                    CustomerDAO customerDAO = new CustomerDAO();
                    ResultSet customerResult = customerDAO.addCustomer(newCustomer);

                    // Check if the customer was added successfully
                    if (customerResult.next()) {
                        response.sendRedirect("success.jsp");
                    } else {
                        // Rollback the contact information in case of failure
                        if (!checkContactExist) contactInfoDAO.deleteContact(contact.getContactInformationID());
                        errorMessages.add("Registration failed. Please try again.");
                        request.setAttribute("errorMessages", errorMessages);
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
                }
            }
        } catch (Exception e) {
            errorMessages.add("An error occurred during registration: " + e.getMessage());
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
