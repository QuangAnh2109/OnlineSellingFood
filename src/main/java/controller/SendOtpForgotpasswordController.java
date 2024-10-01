package controller;

import java.io.IOException;

import common.Mail;
import common.RandomPasswordGenerator;
import dal.AccountDAO;
import dal.OtpDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.Otp;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SendOtpForgotpasswordController", urlPatterns = "/forgotpassword")
public class SendOtpForgotpasswordController extends HttpServlet {

    AccountDAO daoAccount = new AccountDAO();
    OtpDAO daoOtp = new OtpDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email;
        try {
            email = request.getParameter("email").trim();
        }catch(NullPointerException e){
            System.out.println(e.getClass()+": "+e.getMessage());
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            return;
        }
        List<String> errorMessages = new ArrayList<>();
        // Kiểm tra email có tồn tại không
        Account account = daoAccount.getAccountByEmail(email);
        if (account == null) {
            errorMessages.add("Email is not Exits!");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Tạo otp
        String newOtp = RandomPasswordGenerator.generateRandomString();

        Otp otp =  new Otp(account.getAccountID(), newOtp, LocalDateTime.now().plusMinutes(5));
        // Kiểm tra OTP trong DB và lưu hoặc cập nhật OTP
        if (daoOtp.addOtp(otp)==null) {
            daoOtp.updateOtp(otp);
        }

        // Gửi email
        boolean emailSent = Mail.sendEmail(email, newOtp);
        if (emailSent) {
            request.setAttribute("msg", "Mã otp mới đã được gửi đến email của bạn.");
        } else {
            request.setAttribute("msg", "Không thể gửi email, vui lòng thử lại.");
        }

        request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


}