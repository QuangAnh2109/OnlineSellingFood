package controller;

import java.io.IOException;
import java.io.PrintWriter;

import dal.AccountDAO;
import dal.OtpDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

@WebServlet(name = "CheckAuthen", value = "/checkAuthen")
public class CheckAuthen extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("home-page.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accountID = Integer.parseInt(request.getParameter("accountID"));
        String otp = request.getParameter("otp");
        if(new OtpDAO().checkOtp(accountID, otp)){
            AccountDAO accDAO = new AccountDAO();
            Account acc = accDAO.getAccountByAccountID(accountID);
            acc.setStatusID(1);
            accDAO.updateAccountInformation(acc);
        }
        response.sendRedirect("home-page.jsp");
    }
}