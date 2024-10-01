package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import dal.AccountDAO;
import dal.ContactInformationDAO;
import dal.CustomerDAO;
import dal.OtpDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.ContactInformation;
import model.Customer;
import model.Staff;

@WebServlet(name = "CheckAuthenRegister", value = "/CheckAuthenRegister")
public class CheckAuthenRegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("home-page.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String otpSession = (String)session.getAttribute("otp"), otp = request.getParameter("otp");
        LocalDateTime dateTime = (LocalDateTime) session.getAttribute("datetime");
        if(otp.equals(otpSession) && !LocalDateTime.now().isAfter(dateTime)){
            ContactInformationDAO contactInfoDAO = new ContactInformationDAO();
            // Find contact information in the database
            ContactInformation contactSession = (ContactInformation)session.getAttribute("contact"), contact = contactInfoDAO.getContactInformationByAddressAndPhone(contactSession.getAddress(), contactSession.getPhoneNumber());
            //if contact don't have in database, add new contact to database
            if (contact == null) {
                contact = new ContactInformation(contactSession.getAddress(), contactSession.getPhoneNumber());
                contact.setContactInformationID(contactInfoDAO.addContact(contact));
            }
            AccountDAO accDAO = new AccountDAO();
            Account account = (Account) session.getAttribute("account");
            account.setContactInformationID(contact.getContactInformationID());
            account.setStatusID(1);
            Integer accountID = accDAO.addAccount(account);
            if (accountID != null) {
                new CustomerDAO().addCustomer(new Customer(accountID, 0, 0));
                response.sendRedirect("home-page.jsp");
            } else {
                // Rollback the contact information in case of failure
                contactInfoDAO.deleteContact(contact.getContactInformationID());
                request.setAttribute("msg", "Email is dulicate");
                request.getRequestDispatcher("register").forward(request, response);
            }
        }
        else{
            request.setAttribute("msg", "Wrong otp or expired otp");
            request.getRequestDispatcher("authen-account.jsp").forward(request,response);
        }

    }
}