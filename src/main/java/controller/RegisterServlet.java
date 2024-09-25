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
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("page-register.jsp").forward(request, response);
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
        }
        if (phoneNumber.length() < 6 || phoneNumber.length() > 11) {
            errorMessages.add("Phone number must be between 6 and 11 characters.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        // Validate password length
        if (password.length() < 8) {
            errorMessages.add("Password must be more than 8 characters.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        //Validate password
        if (!password.equals(confirmPassword)) {
            errorMessages.add("Passwords do not match.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

        ContactInformationDAO contactInfoDAO = new ContactInformationDAO();
        AccountDAO accountDAO = new AccountDAO();

        /*
        // Check if contact information already exists
        String existingContactID = contactInfoDAO.getContactInformationIDbyAddressAndPhone(address, phoneNumber);

        if (existingContactID != null) {
            errorMessages.add("Contact information already exists with the provided phone number and address.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return; // Exit the method to prevent further processing
        }
         */

        //find contact information in database
        ContactInformation contact = contactInfoDAO.getContactInformationByAddressAndPhone(address, phoneNumber);
        boolean checkContactExist = true;
        //if contact don't have in database, add new contact to database
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


/*
            // Create and add contact information
            ContactInformation contactInfo = new ContactInformation();
            contactInfo.setAddress(address);
            contactInfo.setPhoneNumber(phoneNumber);

            int contactInfoResult = contactInfoDAO.addContact(contactInfo);
            if (contactInfoResult == 0) {
                errorMessages.add("Failed to add contact information.");
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Retrieve the newly inserted ContactInformationID
            String contactInfoIDStr = contactInfoDAO.getContactInformationIDbyAddressAndPhone(address, phoneNumber);

            if (contactInfoIDStr == null) {
                errorMessages.add("No contact information found with the provided phone number and address.");
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
*/
        try{
            // Create the new Account
            Account newAccount = new Account(6, Integer.parseInt(birthYearStr), contact.getContactInformationID(), 1, email, firstName, lastName, password, LocalDateTime.now());

            // Debugging information
            System.out.println("Inserting Account with details: ");
            System.out.println("FirstName: " + firstName);
            System.out.println("LastName: " + lastName);
            System.out.println("Email: " + email);
            System.out.println("BirthYear: " + birthYearStr);
            System.out.println("ContactInformationID: " + contact.getContactInformationID());
            System.out.println("RoleID: " + newAccount.getRoleID());
            System.out.println("StatusID: " + newAccount.getStatusID());
            System.out.println("Password: [HIDDEN]");
            System.out.println("Time: " + newAccount.getTime());

            if(errorMessages.isEmpty()){
                ResultSet accountResult = accountDAO.addAccount(newAccount);
                if (accountResult!=null) {
                    response.sendRedirect("success.jsp");
                } else {
                    // Rollback the contact information in case of failure
                    if(!checkContactExist) contactInfoDAO.deleteContact(contact.getContactInformationID());
                    errorMessages.add("Registration failed. Please try again.");
                    request.setAttribute("errorMessages", errorMessages);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            // Log the actual exception message to the console and display on the error page
            errorMessages.add("An error occurred during registration: " + e.getMessage());
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

