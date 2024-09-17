package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import dal.AccountDAO;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect to the registration page
        response.sendRedirect(request.getContextPath() + "/nest-frontend/page-register.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get information from the form
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String birthYearStr = request.getParameter("birthYear");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String contactInfoStr = request.getParameter("contactInfo");
            Integer birthYear = Integer.parseInt(birthYearStr);
            Integer contactInformationID = Integer.parseInt(contactInfoStr);
            Integer roleID = 6; // Default as Customer (RoleID=6)
            Integer statusID = 1; // Default as active (StatusID=1)

            // Check if passwords match
            if (!password.equals(confirmPassword)) {
                request.setAttribute("errorMessage", "Passwords do not match.");
                request.getRequestDispatcher("/nest-frontend/page-register.html").forward(request, response);
                return;
            }

            // Create a new account object
            Account newAccount = new Account();
            newAccount.setFirstName(firstName);
            newAccount.setLastName(lastName);
            newAccount.setEmail(email);
            newAccount.setBirthYear(birthYear.toString());
            newAccount.setContactInformationID(contactInformationID.toString());
            newAccount.setRoleID(roleID.toString());
            newAccount.setStatusID(statusID.toString());
            newAccount.setPassword(password);

            // Set the current time for the account creation
            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            newAccount.setTime(currentTime.format(formatter));

            // Add the new account to the database
            AccountDAO accountDAO = new AccountDAO();
            int result = accountDAO.addAccount(newAccount);

            if (result > 0) {
                // Registration success, redirect to index.html
                response.sendRedirect(request.getContextPath() + "/nest-frontend/index.html");
            } else {
                // Registration failed, forward to registration page with error message
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("/nest-frontend/page-register.html").forward(request, response);
            }

        } catch (NumberFormatException e) {
            // Handle case where number conversion fails
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid input format. Please check your input.");
            request.getRequestDispatcher("/nest-frontend/page-register.html").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during registration. Please try again.");
            request.getRequestDispatcher("/nest-frontend/page-register.html").forward(request, response);
        }
    }
}
