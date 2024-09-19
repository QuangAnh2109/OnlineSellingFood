package controller;

import dal.AccountDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/LoginController")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("page-login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        AccountDAO adao = new AccountDAO();
        Account a = adao.getAccountByEmailPassword(email,password);
        if(a==null){
            request.setAttribute("mess", "Wrong email or password");
            request.getRequestDispatcher("page-login.jsp").forward(request,response);
        }else{
            response.sendRedirect("home");
        }
    }
}
