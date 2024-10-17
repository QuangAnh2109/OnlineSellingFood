package controller;

import java.io.IOException;
import dal.CertificateDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Certification;

@WebServlet(name = "CertificationCreateUpdateServlet", value = "/certificationCU")
public class CertificationCreateUpdateServlet extends HttpServlet {
    private CertificateDAO certificationDAO = new CertificateDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String certificationID = request.getParameter("certificationID");
        if (certificationID != null) {
            Certification certification = certificationDAO.getCertificationById(Integer.parseInt(certificationID));
            request.setAttribute("certificationID", certification.getCertificationID());
            request.setAttribute("name", certification.getName());
            request.setAttribute("detail", certification.getDetail());
            request.setAttribute("imgID", certification.getImgID());
            request.setAttribute("certificateIssuerID", certification.getCertificateIssuerID());
        }
        request.getRequestDispatcher("page-certification.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String certificationID = request.getParameter("certificationID");
        String name = request.getParameter("name");
        String detail = request.getParameter("detail");
        String imgID = request.getParameter("imgID");
        String certificateIssuerID = request.getParameter("certificateIssuerID");

        if (certificationID != null && !certificationID.isEmpty()) {
            if (name != null && !name.isEmpty() && detail != null && !detail.isEmpty()) {
                boolean isUpdated = certificationDAO.updateCertification(Integer.parseInt(certificationID), name, detail, Integer.parseInt(imgID), Integer.parseInt(certificateIssuerID));
                if (isUpdated) {
                    response.sendRedirect("certificationList");
                } else {
                    System.out.println("update failed");
                }
            }
        } else {
            if (name != null && !name.isEmpty() && detail != null && !detail.isEmpty()) {
                boolean isCreated = certificationDAO.createCertification(name, detail, Integer.parseInt(certificateIssuerID),Integer.parseInt(imgID));
                if (isCreated) {
                    response.sendRedirect("certificationList");
                } else {
                    System.out.println("create fail");
                }
            }
        }
    }
}
