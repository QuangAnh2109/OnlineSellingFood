package controller;

import common.Mail;
import common.RandomPasswordGenerator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.ContactInformation;
import dal.AccountDAO;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetRegisterInforServlet", urlPatterns = {"/register"})
public class GetRegisterInforServlet extends HttpServlet {

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
        //Validate password
        if (!password.equals(confirmPassword)) {
            errorMessages.add("Passwords do not match.");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        if (new AccountDAO().getAccountByEmail(email)!=null) {
            errorMessages.add("Email duplicate");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        try {
            String otp = RandomPasswordGenerator.generateRandomString();
            if(Mail.sendEmail(email, otp)){
                // Create the new Account
                HttpSession session = request.getSession();
                session.setAttribute("account", new Account(6, Integer.parseInt(birthYearStr), 2, email, firstName, lastName, password, LocalDateTime.now()));
                session.setAttribute("contact", new ContactInformation(address, phoneNumber));
                session.setAttribute("otp", otp);
                session.setAttribute("datetime", LocalDateTime.now().plusMinutes(5));
                request.getRequestDispatcher("register-authen.jsp").forward(request, response);
            }
            else{
                errorMessages.add("Some error when make and send email");
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Log the actual exception message to the console and display on the error page
            errorMessages.add("An error occurred during registration: " + e.getMessage());
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

