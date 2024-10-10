package controller;

import dal.CertificateIssuerDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CertificateIssuerDeleteServlet", value = "/certificateIssuerDelete")
public class CertificateIssuerDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String certificateIssuerIdParam = request.getParameter("certificateIssuerID");
        if (certificateIssuerIdParam != null) {
            int certificateIssuerID = Integer.parseInt(certificateIssuerIdParam);
            CertificateIssuerDAO certificateIssuerDAO = new CertificateIssuerDAO();
            certificateIssuerDAO.deleteCertificateIssuer(certificateIssuerID);
        }
        response.sendRedirect("certificateIssuerList");
    }
}
