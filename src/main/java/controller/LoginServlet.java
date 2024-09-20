package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Cookie;
import model.Account;
import dal.AccountDAO;
import jakarta.servlet.http.HttpSession;
import dal.ContactInformationDAO;
import model.ContactInformation;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("page-login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> errorMessages = new ArrayList<>();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember=request.getParameter("rem");

        Cookie cu=new Cookie("cuser",email);
        Cookie cp=new Cookie("cpass",password);
        Cookie cr=new Cookie("crem",remember);

        if(remember!=null){
            cu.setMaxAge(60*60*24*7);
            cp.setMaxAge(60*60*24*7);
            cr.setMaxAge(60*60*24*7);
        }else{
            cu.setMaxAge(0);
            cp.setMaxAge(0);
            cr.setMaxAge(0);
        }
        response.addCookie(cu);
        response.addCookie(cp);
        response.addCookie(cr);

        AccountDAO dao=new AccountDAO();
        ContactInformationDAO cdao=new ContactInformationDAO();
        Account a= null;
        try {
            a = dao.getAccountByEmailPassword(email, password);
        } catch (NoSuchAlgorithmException e) {
            System.out.println(e.getMessage());
        }

        if(a==null){
            errorMessages.add("Username or Password invalid!!");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }else{
            ContactInformation ci = cdao.getContactInformationByContactID(a.getContactInformationID());
            HttpSession session = request.getSession();
            session.setAttribute("account", a);
            session.setAttribute("contactInformation", ci);
            response.sendRedirect("home-page.jsp");
        }
    }
}