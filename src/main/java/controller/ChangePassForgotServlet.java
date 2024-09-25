package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import common.Encrypt;
import dal.AccountDAO;
import dal.OtpDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

@WebServlet(name = "ChangePassForgotServlet", value = "/ChangePassForgotServlet")
public class ChangePassForgotServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("home-page.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> errorMessages = new ArrayList<>();
        Integer accountID = Integer.parseInt(request.getParameter("account"));
        String newPass = request.getParameter("newPassword"), confirmPass = request.getParameter("confirmPassword");
        if (!confirmPass.equals(newPass)) {
            errorMessages.add("New password must equal confirm password!");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        if(accountID==null){
            errorMessages.add("Cann't get account");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }
        new AccountDAO().updateAccountPassword(accountID, newPass);
        response.sendRedirect("login");
    }
}