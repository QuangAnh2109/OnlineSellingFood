package controller;

import dal.AccountDAO;
import model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@WebServlet(name = "RegisterAdminServlet", urlPatterns = {"/register-admin"})
public class RegisterAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/nest-backend/page-account-register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String> errorMessages = new ArrayList<>();

        String roleID = request.getParameter("roleID");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String contactInformationID = request.getParameter("contactInformationID");
        String birthYear = request.getParameter("birthYear");
        //get random password
        String password = generateRandomPassword();

        Account account = new Account();
        try {
            account.setRoleID(roleID);
            account.setFirstName(firstName);
            account.setLastName(lastName);
            account.setEmail(email);
            account.setBirthYear(birthYear);
            account.setContactInformationID(contactInformationID);
            account.setPassword(password);
            account.setTime(LocalDateTime.now().format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
            account.setStatusID("3"); // status is request to change password (statusID=3)


            AccountDAO dao = new AccountDAO();
            int result = dao.addAccount(account);

            if (result > 0) {

                response.sendRedirect("success.jsp");
            } else {

                errorMessages.add("An unknown error occurred during registration.");
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            errorMessages.add("An error occurred: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // function to generate random password
    private String generateRandomPassword() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[10];
        random.nextBytes(bytes);
        return Base64.getEncoder().encodeToString(bytes);
    }
}
