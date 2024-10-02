package controller;

import common.Encrypt;
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
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ChangePassStaffServlet", urlPatterns = {"/changepassstaff"})
public class ChangePassStaffServlet extends HttpServlet {
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
        request.getRequestDispatcher("page-change-pass-staff.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> errorMessages = new ArrayList<>();
        String np = request.getParameter("newPassword");
        String cp = request.getParameter("confirmPassword");
        AccountDAO dao = new AccountDAO();
        Account account = (Account) request.getSession().getAttribute("account");


        if (!np.equals(cp)) {
            request.setAttribute("msg", "Confirm password does not match!");
            request.getRequestDispatcher("page-change-pass-staff.jsp").forward(request, response);
        } else {
            if (dao.getAccountByEmailPassword(account.getEmail(), np)!=null) {
                request.setAttribute("msg", "New password duplicate old password!");
                request.getRequestDispatcher("page-change-pass-staff.jsp").forward(request, response);
            } else {
                dao.updateAccountPassword(account.getAccountID(), np);
                account.setStatusID(1);
                dao.updateAccountInformation(account);
                response.sendRedirect("home-page-staff.jsp");
            }
        }


    }


}
