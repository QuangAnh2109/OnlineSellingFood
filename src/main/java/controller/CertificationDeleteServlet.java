package controller;

import dal.CertificateDAO;
import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Certification;

@WebServlet(name = "CertificationDeleteServlet", value = "/certificationDelete")
public class CertificationDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String certificationIdParam = request.getParameter("certificationID");
        CertificateDAO certificationDAO = new CertificateDAO();
        System.out.println(certificationIdParam);
        if (certificationIdParam != null) {
            boolean isUsed = certificationDAO.isCertificationUsed(Integer.parseInt(certificationIdParam));
            if (isUsed) {
                request.getSession().setAttribute("msg", "Certification này đang được sử dụng và không thể cập nhật hoặc xóa.");
                List<Certification> certificationList = certificationDAO.getAllCertifications();
                request.setAttribute("certificationList", certificationList);
                request.getRequestDispatcher("page-certification.jsp").forward(request, response);
                return;
            }
        }
        response.sendRedirect("certificationList");
    }
}

