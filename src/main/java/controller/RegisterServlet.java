package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import dal.AccountDAO;

import java.io.IOException;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
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
        String contactInfoStr = request.getParameter("contactInfo");

        // Validate input data
        if (firstName == null || firstName.isEmpty()) {
            errorMessages.add("First name is required.");
        }
        if (lastName == null || lastName.isEmpty()) {
            errorMessages.add("Last name is required.");
        }
        if (email == null || email.isEmpty()) {
            errorMessages.add("Email is required.");
        }
        if (birthYearStr == null || birthYearStr.isEmpty()) {
            errorMessages.add("Birth year is required.");
        } else {
            try {
                Integer.parseInt(birthYearStr);
            } catch (NumberFormatException e) {
                errorMessages.add("Invalid birth year format.");
            }
        }
        if (contactInfoStr == null || contactInfoStr.isEmpty()) {
            errorMessages.add("Contact information ID is required.");
        } else {
            try {
                Integer.parseInt(contactInfoStr);
            } catch (NumberFormatException e) {
                errorMessages.add("Invalid contact information ID format.");
            }
        }
        if (password == null || password.isEmpty()) {
            errorMessages.add("Password is required.");
        }
        if (!password.equals(confirmPassword)) {
            errorMessages.add("Passwords do not match.");
        }

        // If validation errors exist, forward to error page
        if (!errorMessages.isEmpty()) {
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        Account newAccount = new Account();
        try {
            newAccount.setFirstName(firstName);
            newAccount.setLastName(lastName);
            newAccount.setEmail(email);
            newAccount.setBirthYear(birthYearStr);
            newAccount.setContactInformationID(contactInfoStr);
            newAccount.setRoleID("6"); // Default RoleID
            newAccount.setStatusID("1"); // Default StatusID
            newAccount.setPassword(password);
            newAccount.setTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))); // Current time

            // Add account to the database
            AccountDAO accountDAO = new AccountDAO();
            int result = accountDAO.addAccount(newAccount);

            if (result > 0) {
                response.sendRedirect("success.jsp");
            } else {
                errorMessages.add("Registration failed. Please try again.");
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            errorMessages.add("An error occurred during registration. Please try again.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}
