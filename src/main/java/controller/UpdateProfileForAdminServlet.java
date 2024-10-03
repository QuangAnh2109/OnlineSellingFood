package controller;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;

import dal.AccountDAO;
import dal.ContactInformationDAO;
import dal.RoleDAO;
import dal.StaffDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.ContactInformation;
import model.Role;
import model.Staff;

@WebServlet(name = "UpdateProfileForAdminServletServlet", urlPatterns = {"/updateProfileForAdmin"})
public class UpdateProfileForAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("staffList");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountID_raw=request.getParameter("accountID");
        String rID_raw = request.getParameter("roleID");
        String fName = request.getParameter("firstName");
        String lName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String birthYear_raw = request.getParameter("birthYear");
        String salary_raw = request.getParameter("salary");
        String whID_raw = request.getParameter("warehouseID");
        String statusID_raw=request.getParameter("statusID");



        int accountID,roleID,birthYear,salary,warehouseID,statusID;
        try {
             accountID=Integer.parseInt(accountID_raw);
             roleID=Integer.parseInt(rID_raw);
             birthYear=Integer.parseInt(birthYear_raw);
             salary=Integer.parseInt(salary_raw);
             warehouseID=Integer.parseInt(whID_raw);
             statusID=Integer.parseInt(statusID_raw);


            AccountDAO accountDAO = new AccountDAO();
            Account account = accountDAO.getAccountByAccountID(accountID);
            Account account1=new Account(accountID,roleID,birthYear,account.getContactInformationID(),statusID,email,fName,lName,account.getPassword(),account.getTime());

            ContactInformationDAO contactInformationDAO = new ContactInformationDAO();
            ContactInformation contactInformation=new ContactInformation(account.getContactInformationID(),address,phone);

            StaffDAO staffDAO = new StaffDAO();
            Staff staff=new Staff(accountID,salary,warehouseID);

            staffDAO.updateProfileForStaff(account1,contactInformation,staff);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        doGet(request, response);



    }
}