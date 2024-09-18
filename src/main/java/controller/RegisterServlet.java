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
        String phoneNumber = request.getParameter("phone");
        String address = request.getParameter("address");
        ContactInformationDAO contactinfo = new ContactInformationDAO();
        //add new contact information
        ContactInformation ci = new ContactInformation();
        try {
            ci.setAddress(address);
            ci.setPhoneNumber(phoneNumber);
            contactinfo.addContact(ci);
        }catch (Exception e){
            e.printStackTrace();
            errorMessages.add("AN error occurred when trying to add new contact information");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
        //get contact information id
        String contactinfoID = contactinfo.getContactInformationIDbyAdressAndPhone(phoneNumber, address);
        Account newAccount = new Account();
        try {
            newAccount.setFirstName(firstName);
            newAccount.setLastName(lastName);
            newAccount.setEmail(email);
            newAccount.setBirthYear(birthYearStr);
            newAccount.setContactInformationID(contactinfoID);
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
