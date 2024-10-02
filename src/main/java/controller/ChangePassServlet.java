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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LogoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LogoutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> errorMessages = new ArrayList<>();
        String op = request.getParameter("oldPassword");
        String np = request.getParameter("newPassword");
        String cp = request.getParameter("confirmPassword");
        AccountDAO dao = new AccountDAO();
        Account account = (Account) request.getSession().getAttribute("account");
        Account a = null;
        a = dao.getAccountByEmailPassword(account.getEmail(), op);
        if (a == null) {
            errorMessages.add("Old password is incorect!!");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } else {
            if (np.length() < 8) {
                errorMessages.add("Password must be more than 8 characters.");
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
            else if (!np.equals(cp)) {
                errorMessages.add("New password must equal confirm password!");
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } else {
                try {
                    if (Encrypt.toHexString(Encrypt.getSHA(op)).equals(Encrypt.toHexString(Encrypt.getSHA(np)))) {
                        errorMessages.add("New password duplicate old password!");
                        request.setAttribute("errorMessages", errorMessages);
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    } else {
                        dao.updateAccountPasswordForUser(account.getAccountID(), np);
                        response.sendRedirect("login");
                    }
                } catch (NoSuchAlgorithmException ex) {
                    System.out.println(ex.getMessage());
                }

            }
        }
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    processRequest(request, response);
}


}
