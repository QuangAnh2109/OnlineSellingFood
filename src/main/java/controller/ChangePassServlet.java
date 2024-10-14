package controller;

import common.Encrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import dal.AccountDAO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ChangePassServlet", urlPatterns = {"/changepass"})
public class ChangePassServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageChangePass = request.getParameter("PageChangePass");
        String op = request.getParameter("oldPassword");
        String np = request.getParameter("newPassword");
        String cp = request.getParameter("confirmPassword");
        AccountDAO dao = new AccountDAO();
        Account account = (Account) request.getSession().getAttribute("account");
        Account a = null;
        a = dao.getAccountByEmailPassword(account.getEmail(), op);
        if (a == null) {
            request.setAttribute("msg", "Old password is incorect!!");
            request.getRequestDispatcher(pageChangePass).forward(request, response);
        } else {
            if (!np.equals(cp)) {
                request.setAttribute("msg", "New password must equal confirm password!");
                request.getRequestDispatcher(pageChangePass).forward(request, response);
            } else {
                try {
                    if (Encrypt.toHexString(Encrypt.getSHA(op)).equals(Encrypt.toHexString(Encrypt.getSHA(np)))) {
                        request.setAttribute("msg", "New password duplicate old password!");
                        request.getRequestDispatcher(pageChangePass).forward(request, response);
                    } else {
                        dao.updateAccountPassword(account.getAccountID(), np);
                        response.sendRedirect("logout");
                    }
                } catch (NoSuchAlgorithmException ex) {
                    System.out.println(ex.getMessage());
                }

            }
        }
    }
}
