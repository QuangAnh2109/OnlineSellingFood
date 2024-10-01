package controller;
import java.io.IOException;

import dal.AccountDAO;
import dal.OtpDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

@WebServlet(name = "ChangePassForgotServlet", value = "/ChangePassForgotServlet")
public class ChangePassForgotServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email"), otp = request.getParameter("otp");
        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByEmail(email);
        if(new OtpDAO().checkOtp(account.getAccountID(),otp)){
            account.setStatusID(2);
            request.getSession().setAttribute("account",account);
            response.sendRedirect("page-change-pass.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO accountDAO = new AccountDAO();
        Account account = (Account) request.getSession().getAttribute("account");
        if(account.getStatusID()==2){
            String newPassword = request.getParameter("newPassword"),confirmPassword = request.getParameter("confirmPassword");
            if(newPassword.equals(confirmPassword)){
                if (accountDAO.getAccountByEmailPassword(account.getEmail(), newPassword)!=null) {
                    request.setAttribute("errorMessages", "New password duplicate old password!");
                    request.getRequestDispatcher("page-change-pass.jsp").forward(request, response);
                } else {
                    accountDAO.updateAccountPassword(account.getAccountID(), newPassword);
                    account.setStatusID(1);
                    response.sendRedirect("home-page.jsp");
                }
            }
        }
    }
}