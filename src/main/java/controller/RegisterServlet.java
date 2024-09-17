package controller;

import dal.AccountDAO;
import model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // get information from input form
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String birthYear = request.getParameter("birthYear");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String contactInformationID = request.getParameter("contactInfo");
            String roleID = "6"; // Default as Customer (RoleID=6)
            String statusID = "1"; // Default as active (StatusID=1)

            // Check if password are correct
            if (!password.equals(confirmPassword)) {
                request.setAttribute("errorMessage", "Passwords do not match.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            // Create new account
            Account newAccount = new Account();
            newAccount.setFirstName(firstName);
            newAccount.setLastName(lastName);
            newAccount.setEmail(email);
            newAccount.setBirthYear(birthYear);
            newAccount.setContactInformationID(contactInformationID);
            newAccount.setRoleID(roleID);
            newAccount.setStatusID(statusID);
            newAccount.setPassword(password);

            // Set time for birthDate
            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            newAccount.setTime(currentTime.format(formatter));

            // Add new account to database
            AccountDAO accountDAO = new AccountDAO();
            int result = accountDAO.addAccount(newAccount);

            if (result > 0) {
                // Register successfully
                request.setAttribute("successMessage", "Registration successful! You can now log in.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                // Register Fail
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during registration. Please try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}

