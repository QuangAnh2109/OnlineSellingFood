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

@WebServlet(name = "ForgotpasswordController", urlPatterns = "/forgotpassword")
public class ForgotpasswordController extends HttpServlet {

    AccountDAO daoAccount = new AccountDAO();
    OtpDAO daoOtp = new OtpDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Forgotpassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email").trim();
        List<String> errorMessages = new ArrayList<>();
        // Kiểm tra email có tồn tại không
        Account account = daoAccount.getAccountByEmail(email);
        if (account == null) {

            errorMessages.add("Email is not Exits!");
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Tạo mật khẩu mới ngẫu nhiên
        String newPassword = RandomPasswordGenerator.generateRandomString();
        // Lấy thời gian hiện tại và đặt thời gian hết hạn (5 phút)
//        Calendar calendar = Calendar.getInstance();
//        calendar.add(Calendar.MINUTE, 5);
//        Date expiryDate = calendar.getTime();
//
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        String formattedExpiryDate = dateFormat.format(expiryDate);

        Otp otp =  new Otp(account.getAccountID(), newPassword, LocalDateTime.now().plusMinutes(5));
        // Kiểm tra OTP trong DB và lưu hoặc cập nhật OTP
        if (daoOtp.addOtp(otp)==null) {
            daoOtp.updateOtp(otp);
        }

        // Gửi email
        boolean emailSent = Mail.sendEmail(email, newPassword);
        if (emailSent) {
            request.setAttribute("msg", "Mật khẩu mới đã được gửi đến email của bạn.");
        } else {
            request.setAttribute("msg", "Không thể gửi email, vui lòng thử lại.");
        }

        request.getRequestDispatcher("Forgotpassword.jsp").forward(request, response);
    }


}