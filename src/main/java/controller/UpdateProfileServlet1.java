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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "UpdateProfileServlet1", urlPatterns = {"/profile1"})
public class UpdateProfileServlet1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("page-account.jsp");
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
        HttpSession session = request.getSession();
        ContactInformationDAO contactDAO = new ContactInformationDAO();
        Account account = (Account) session.getAttribute("account");

        //find contact information in database
        ContactInformation contact = contactDAO.getContactInformationByAddressAndPhone(address, phone);

        //if contact don't have in database, add new contact to database
        if (contact == null) {
            contact = new ContactInformation(address, phone);
            try {
                ResultSet rs = contactDAO.addContact(contact);
                rs.next();
                contact.setContactInformationID(rs.getInt(1));
            } catch (SQLException e) {
                e.printStackTrace();
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
        int status = account.getStatusID();
        if(!email.equals(account.getEmail())) status = 2;
        Account account1 = new Account(account.getRoleID(), Integer.parseInt(birthYear), contact.getContactInformationID(), status, email, fName, lName, account.getAccountID());
        accountDAO.updateAccountInformation(account1);
        contactDAO.deleteContact(((ContactInformation) session.getAttribute("contactInformation")).getContactInformationID());
        request.getSession().removeAttribute("account");
        request.getSession().removeAttribute("contactInformation");
        request.getSession().setAttribute("account", account1);
        request.getSession().setAttribute("contactInformation", contact);

        doGet(request, response);

    }
}