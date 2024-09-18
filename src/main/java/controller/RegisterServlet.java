package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import dal.AccountDAO;
import model.ContactInformation;
import model.Role;

import java.io.IOException;

import java.time.LocalDateTime;



@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/nest-frontend/page_register.jsp").forward(request, response);
        //response.sendRedirect(request.getContextPath() + "/nest-frontend/page_register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        // Get form parameters
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String birthYear_raw = request.getParameter("birthYear");
        String password = request.getParameter("password");
        String cPassword = request.getParameter("confirmPassword");

        AccountDAO ad = new AccountDAO();
        Account a = ad.getAccountByEmailPassword(email, password);
        int birthYear;
        try {
            birthYear = Integer.parseInt(birthYear_raw);
            if (a != null || ad.existedEmail(email)) {
                String ms = "Email existed!";
                request.setAttribute("message", ms);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else if (!password.equals(cPassword)) {
                String ms = "Passwords do not match!";
                request.setAttribute("message", ms);
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                Role role = ad.getRoleByRoleId(6);
                LocalDateTime now = LocalDateTime.now();
                Account account = new Account();
                account.setRole(role);
                account.setEmail(email);
                account.setFirstName(firstName);
                account.setLastName(lastName);
                account.setBirthYear(birthYear);
                ContactInformation c = new ContactInformation(0, address, phone);
                account.setPassword(password);
                account.setTime(now);
                account.setStatusID(2);
                ad.addAccount(account, c);
//                response.sendRedirect("login");

            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
    }


