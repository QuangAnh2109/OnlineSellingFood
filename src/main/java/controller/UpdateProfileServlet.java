package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import dal.AccountDAO;
import dal.ContactInformationDAO;
import model.ContactInformation;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UpdateProfileServlet", urlPatterns = {"/profile"})
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccountDAO accountDAO = new AccountDAO();
        Account a = (Account) request.getSession().getAttribute("account");
        Account b=accountDAO.getAccountByAccountID(a.getAccountID());
        request.setAttribute("account", b);
        //request.getRequestDispatcher(request.getContextPath() + "/nest-frontend/page-account.jsp").forward(request, response);
        response.sendRedirect(request.getContextPath() + "/nest-frontend/page-account.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fName = request.getParameter("firstName");
        String lName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String birthYear = request.getParameter("birthYear");

        AccountDAO accountDAO = new AccountDAO();
        ContactInformationDAO contactDAO = new ContactInformationDAO();
        Account account = (Account) request.getSession().getAttribute("account");

        ContactInformation contactInformation = (ContactInformation) request.getSession().getAttribute("contactInformation");
        try {
            contactInformation.setAddress(address);
            contactInformation.setPhoneNumber(phone);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        Account account1 = new Account(account.getAccountID(),account.getRoleID(),Integer.parseInt(birthYear),account.getContactInformationID(),account.getStatusID(),account.getEmail(),fName,lName,account.getTime());
        contactDAO.updateContactInformation(contactInformation);
        accountDAO.updateAccountInformation(account1);
        request.getSession().removeAttribute("account");
        request.getSession().removeAttribute("contactInformation");
        request.getSession().setAttribute("account", account1);
        request.getSession().setAttribute("contactInformation", contactInformation);

        doGet(request, response);

    }
}