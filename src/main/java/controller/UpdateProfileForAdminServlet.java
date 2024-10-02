package controller;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import dal.AccountDAO;
import dal.ContactInformationDAO;
import dal.RoleDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.ContactInformation;
import model.Role;

@WebServlet(name = "UpdateProfileForAdminServletServlet", urlPatterns = {"/updateProfileForAdmin"})
public class UpdateProfileForAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("staffList");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accounrID_raw=request.getParameter("accounrID");
        String rID = request.getParameter("roleID");
        String fName = request.getParameter("firstName");
        String lName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String birthYear = request.getParameter("birthYear");
        String salary = request.getParameter("salary");
        String whID = request.getParameter("warehouseID");


        AccountDAO accountDAO = new AccountDAO();

        ContactInformationDAO contactDAO = new ContactInformationDAO();


        //find contact information in database
        ContactInformation contact = contactDAO.getContactInformationByAddressAndPhone(address, phone);

        RoleDAO roleDAO = new RoleDAO();
        int accountID, roleID;
        if (contact == null) {
            contact = new ContactInformation(address, phone);
        }
        try {
            roleID = Integer.parseInt(rID);
            accountID = Integer.parseInt(accounrID_raw);
            Account a=accountDAO.getAccountByAccountID(accountID);
            ResultSet rs = contactDAO.addContact(contact);
            rs.next();
            contact.setContactInformationID(rs.getInt(1));
            int status = a.getStatusID();
            if (!email.equals(a.getEmail())) status = 2;
            Account account1 = new Account(roleID, Integer.parseInt(birthYear), contact.getContactInformationID(), status, email, fName, lName, a.getAccountID());
            accountDAO.updateAccountInformation(account1);

            request.getSession().removeAttribute("account");
            request.getSession().removeAttribute("contactInformation");
            request.getSession().setAttribute("account", account1);
            request.getSession().setAttribute("contactInformation", contact);

            doGet(request, response);
        } catch (SQLException e) {
                e.printStackTrace();
                request.getRequestDispatcher("error.jsp").forward(request, response);
        }

        //if contact don't have in database, add new contact to database




    }
}