package controller;

import java.io.*;

import dal.AccountDAO;
import dal.ContactInformationDAO;
import dal.CustomerDAO;
import dal.StaffDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.ContactInformation;
import model.Customer;
import model.Staff;

@WebServlet(name = "UpdateProfileCustomerForAdminServletServlet", urlPatterns = {"/updateProfileCustomerForAdmin"})
public class UpdateProfileCustomerForAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("customerList");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountID_raw=request.getParameter("accountId");
        String statusID_raw=request.getParameter("statusID");
        String point_raw=request.getParameter("point");
        String level_raw=request.getParameter("level");



        int accountID,statusID,point,level;
        try {
            accountID=Integer.parseInt(accountID_raw);
            statusID=Integer.parseInt(statusID_raw);
            point=Integer.parseInt(point_raw);
            level=Integer.parseInt(level_raw);


            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountByAccountID(accountID);
            Account account1=new Account(accountID,account.getRoleID(),account.getBirthYear(),account.getContactInformationID(),statusID,account.getEmail(),account.getFirstName(),account.getLastName(),account.getPassword(),account.getTime());


            CustomerDAO customerDAO = new CustomerDAO();
            Customer customer = customerDAO.getCustomerByAccountID(accountID);
            Customer customer1=new Customer(customer.getCustomerID(),customer.getAccountID(),point,level);


            customerDAO.updateProfileCustomerForAdmin(account1,customer1);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        doGet(request, response);



    }
}