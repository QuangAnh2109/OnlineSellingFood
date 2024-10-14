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
    private final String changePass = "page-change-pass.jsp";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email"), otp = request.getParameter("otp");
        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByEmail(email);
        if(new OtpDAO().checkOtp(account.getAccountID(),otp)){
            account.setStatusID(2);
            request.getSession().setAttribute("account",account);
            response.sendRedirect(changePass);
        }
        else{
            request.setAttribute("msg","OTP is not correct");
            request.getRequestDispatcher("forgotpassword.jsp?email="+email).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO accountDAO = new AccountDAO();
        Account account = (Account) request.getSession().getAttribute("account");
        if(account.getStatusID()==2){
            String newPassword = request.getParameter("newPassword");
            String confirmPassword = request.getParameter("confirmPassword");
            //Validate password
            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("msg", "Confirm password does not match!");
                request.getRequestDispatcher(changePass).forward(request, response);
            }
            else{
                if (accountDAO.getAccountByEmailPassword(account.getEmail(), newPassword)!=null) {
                    request.setAttribute("msg","New password duplicate old password!");
                    request.getRequestDispatcher(changePass).forward(request, response);
                } else {
                    accountDAO.updateAccountPassword(account.getAccountID(), newPassword);
                    account.setStatusID(1);
                    response.sendRedirect("home-page.jsp");
                }
            }
        }
    }
}