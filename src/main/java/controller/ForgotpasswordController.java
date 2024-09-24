package controller;

import java.io.IOException;
import dal.AccountDAO;
import dal.OtpDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Account;
import model.Otp;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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

        // Kiểm tra email có tồn tại không
        Account account = daoAccount.getAccountIdByEmail(email);
        if (account == null) {
            System.out.println("Email không tồn tại, vui lòng kiểm tra lại!");
            request.setAttribute("msg", "Email không tồn tại, vui lòng kiểm tra lại!");
            request.getRequestDispatcher("Forgotpassword.jsp").forward(request, response);
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
        boolean emailSent = sendEmail(email, newPassword);
        if (emailSent) {
            request.setAttribute("msg", "Mật khẩu mới đã được gửi đến email của bạn.");
        } else {
            request.setAttribute("msg", "Không thể gửi email, vui lòng thử lại.");
        }

        request.getRequestDispatcher("Forgotpassword.jsp").forward(request, response);
    }

    // Phương thức gửi email
    private boolean sendEmail(String recipientEmail, String newPassword) {
        final String from = "anhnhhe163978@fpt.edu.vn"; // Địa chỉ email gửi
        final String password = "towrxxswfdpxldxg"; // Mật khẩu ứng dụng

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP host
        props.put("mail.smtp.port", "587"); // TLS port
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Tạo Authenticator
        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            // Tạo tin nhắn
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(from));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            msg.setSubject("OnlineSellingFood OTP");
            msg.setText("New OTP: " + newPassword);

            // Gửi email
            Transport.send(msg);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
}