package controller;

import dal.CertificateDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CertificationDeleteServlet", value = "/certificationDelete")
public class CertificationDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String certificationIdParam = request.getParameter("certificationID");
        if (certificationIdParam != null) {
            int certificationID = Integer.parseInt(certificationIdParam);
            CertificateDAO certificationDAO = new CertificateDAO();
            certificationDAO.deleteCertification(certificationID);
        }
        response.sendRedirect("certificationList");
    }
}

