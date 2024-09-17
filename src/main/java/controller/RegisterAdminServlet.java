package controller;

import dal.AccountDAO;
import model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@WebServlet(name = "RegisterAdminServlet", urlPatterns = {"/register-admin"})
public class RegisterAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/nest-backend/page-account-register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<String> errorMessages = new ArrayList<>();

        // Lấy dữ liệu từ form
        String roleID = request.getParameter("roleID");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String contactInformationID = request.getParameter("contactInformationID");
        String birthYear = request.getParameter("birthYear");

        // Tạo dãy ký tự ngẫu nhiên cho password và time
        String password = generateRandomPassword();
        String time = java.time.LocalDateTime.now().toString(); // Sử dụng thời gian hiện tại làm time

        // Tạo đối tượng Account
        Account account = new Account();
        try {
            account.setRoleID(roleID);
            account.setFirstName(firstName);
            account.setLastName(lastName);
            account.setEmail(email);
            account.setBirthYear(birthYear);
            account.setContactInformationID(contactInformationID);
            account.setPassword(password);
            account.setTime(time);
            account.setStatusID("3"); // statusID là 3

            // Sử dụng DAO để thêm tài khoản vào cơ sở dữ liệu
            AccountDAO dao = new AccountDAO();
            int result = dao.addAccount(account);

            if (result > 0) {
                // Đăng ký thành công
                response.sendRedirect("success.jsp"); // Redirect đến trang thành công
            } else {
                // Đăng ký không thành công
                errorMessages.add("An unknown error occurred during registration.");
                request.setAttribute("errorMessages", errorMessages);
                request.getRequestDispatcher("/error.jsp").forward(request, response); // Forward đến trang lỗi
            }

        } catch (Exception e) {
            errorMessages.add("An error occurred: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessages", errorMessages);
            request.getRequestDispatcher("/error.jsp").forward(request, response); // Forward đến trang lỗi
        }
    }

    // Phương thức để tạo mật khẩu ngẫu nhiên
    private String generateRandomPassword() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[10];
        random.nextBytes(bytes);
        return Base64.getEncoder().encodeToString(bytes);
    }
}
