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

        try {
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
                errorMessages.add("Passwords do not match.");
            }

            if (!errorMessages.isEmpty()) {
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            Account newAccount = new Account();
            newAccount.setFirstName(firstName);
            newAccount.setLastName(lastName);
            newAccount.setEmail(email);
            newAccount.setBirthYear(birthYear.toString());
            newAccount.setContactInformationID(contactInformationID.toString());
            newAccount.setRoleID(roleID.toString());
            newAccount.setStatusID(statusID.toString());
            newAccount.setPassword(password);

            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            newAccount.setTime(currentTime.format(formatter));

            AccountDAO accountDAO = new AccountDAO();
            int result = accountDAO.addAccount(newAccount);

            if (result > 0) {
                errorMessages.add("Successfully added account.");
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } else {
                errorMessages.add("Registration failed. Please try again.");
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            e.printStackTrace(); // Print stack trace for more detailed error information
            errorMessages.add("Invalid input format. Please check your input.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Print stack trace for more detailed error information
            errorMessages.add("An error occurred during registration. Please try again.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

