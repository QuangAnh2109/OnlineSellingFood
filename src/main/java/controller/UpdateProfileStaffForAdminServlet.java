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
        response.sendRedirect("staffList");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountID_raw=request.getParameter("accountID");
        String rID_raw = request.getParameter("roleID");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String birth_raw = request.getParameter("birth");
        String salary_raw = request.getParameter("salary");
        String whID_raw = request.getParameter("warehouseID");
        String statusID_raw=request.getParameter("statusID");
        String genderID_raw = request.getParameter("gender");



        int accountID,roleID,salary,warehouseID,statusID,genderID;
        LocalDateTime birth;

        accountID=Integer.parseInt(accountID_raw);
        roleID=Integer.parseInt(rID_raw);
        birth= LocalDate.parse(birth_raw, DateTimeFormatter.ISO_LOCAL_DATE).atStartOfDay();
        salary=Integer.parseInt(salary_raw);
        warehouseID=Integer.parseInt(whID_raw);
        statusID=Integer.parseInt(statusID_raw);
        genderID = Integer.parseInt(genderID_raw);
        AccountDAO accountDAO = new AccountDAO();
        Account account = accountDAO.getAccountByAccountID(accountID);
        account.setRoleID(roleID);
        account.setName(name);
        account.setGenderID(genderID);
        account.setEmail(email);
        account.setBirth(birth);
        account.setStatusID(statusID);

        StaffDAO staffDAO = new StaffDAO();
        Staff staff= staffDAO.getStaffByAccountID(accountID);
        staff.setSalary(salary);
        staff.setWarehouseID(warehouseID);

        new AccountDAO().updateAccountInformation(account);
        ContactInformationDAO contactInfoDAO = new ContactInformationDAO();
        ContactInformation contact = contactInfoDAO.getContactInformationByAddressAndPhone(address, phone);
        //if contact don't have in database, add new contact to database
        if (contact == null) {
            contact = new ContactInformation(address, phone);
            contact.setContactInformationID(contactInfoDAO.addContact(contact));
            AccountContactDAO accountContactDAO = new AccountContactDAO();
            int contactID = accountContactDAO.getAccountContact(accountID).getContactInformationID();
            if(contactID!=contact.getContactInformationID()) accountContactDAO.updateAccountContact(contact.getContactInformationID(),accountID);
        }
        staffDAO.updateStaffInformation(staff);
        doGet(request, response);
    }
}