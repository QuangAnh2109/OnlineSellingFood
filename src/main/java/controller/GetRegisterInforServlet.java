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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
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
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String phoneNumber = request.getParameter("phone");
        String address = request.getParameter("address");
        Integer genderID;
        LocalDateTime birth;
        try{
            birth = LocalDate.parse(request.getParameter("birth"), DateTimeFormatter.ISO_LOCAL_DATE).atStartOfDay();
        }catch(DateTimeParseException e){
            birth = null;
        }
        try{
            genderID = Integer.valueOf(request.getParameter("gender"));
        }catch (NumberFormatException e){
            genderID = null;
        }

        //Validate password
        if (!password.equals(confirmPassword)) {
            request.setAttribute("msg", "Confirm password does not match!");
            request.getRequestDispatcher("page-change-pass-staff.jsp").forward(request, response);
            return;
        }

        if (new AccountDAO().getAccountByEmail(email)!=null) {
            request.setAttribute("msg", "Email duplicate!");
            request.getRequestDispatcher("page-change-pass-staff.jsp").forward(request, response);
            return;
        }


        String otp = RandomPasswordGenerator.generateRandomString();
        if(Mail.sendEmail(email, otp)){
            // Create the new Account
            HttpSession session = request.getSession();
            session.setAttribute("account", new Account(6,email,name,genderID,password,birth,LocalDateTime.now(),2));
            session.setAttribute("contact", new ContactInformation(address, phoneNumber));
            session.setAttribute("otp", otp);
            session.setAttribute("datetime", LocalDateTime.now().plusMinutes(5));
            request.getRequestDispatcher("register-authen.jsp").forward(request, response);
        }
        else{
            request.setAttribute("msg","Some error when send otp");
            request.getRequestDispatcher("page-register.jsp").forward(request, response);
        }
    }
}
