package controller;

import java.io.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import dal.AccountContactDAO;
import dal.AccountDAO;
import dal.ContactInformationDAO;
import dal.StaffDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.AccountContact;
import model.ContactInformation;
import model.Staff;

@WebServlet(name = "UpdateProfileStaffForAdminServletServlet", urlPatterns = {"/updateProfileStaffForAdmin"})
public class UpdateProfileStaffForAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accountID = Integer.parseInt(request.getParameter("accountID"));
        int roleID=Integer.parseInt(request.getParameter("roleID"));
        String name=request.getParameter("name");
        int genderID=Integer.parseInt(request.getParameter("gender"));
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        String birth=request.getParameter("birth");
        int salary=Integer.parseInt(request.getParameter("salary"));
        int warehouseID=Integer.parseInt(request.getParameter("warehouseID"));
        int statusID=Integer.parseInt(request.getParameter("statusID"));

        LocalDateTime birthFormat;
        birthFormat= LocalDate.parse(birth, DateTimeFormatter.ISO_LOCAL_DATE).atStartOfDay();

        AccountDAO accountDAO = new AccountDAO();
        ContactInformationDAO contactInfoDAO = new ContactInformationDAO();
        StaffDAO staffDAO = new StaffDAO();
        AccountContactDAO accountContactDAO = new AccountContactDAO();

        Account account = new Account(accountID, email, roleID, name, genderID, birthFormat, statusID);
        accountDAO.updateAccountInformation(account);

        ContactInformation contactInformation=contactInfoDAO.getContactInformationByAccountID(accountID);
        if (contactInformation!=null){
            contactInformation.setAddress(address);
            contactInformation.setPhoneNumber(phone);
            contactInfoDAO.update(contactInformation);
        }
        Staff staff=new Staff(staffDAO.getStaffIDbyAccountID(accountID), accountID,salary,warehouseID);
        staffDAO.updateStaffInformation(staff);
        response.sendRedirect("staffList");


    }
}