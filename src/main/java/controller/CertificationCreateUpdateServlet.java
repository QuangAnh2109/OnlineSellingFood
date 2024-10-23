package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import dal.CertificateDAO;
import dal.ImgDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Certification;
import model.Img;

@WebServlet(name = "CertificationCreateUpdateServlet", value = "/certificationCU")
@MultipartConfig
public class CertificationCreateUpdateServlet extends HttpServlet {

    private CertificateDAO certificationDAO = new CertificateDAO();
    private ImgDAO imgDAO = new ImgDAO();

    // Thư mục lưu file
    private static final String IMG_FOLDER = "C:\\Users\\admin\\OneDrive\\Documents\\GitHub\\OnlineSellingFood\\src\\main\\webapp\\Img";

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String token : contentDisposition.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 2, token.length() - 1);
            }
        }
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String certificationID = request.getParameter("certificationID");
        String name = request.getParameter("name");
        String detail = request.getParameter("detail");
        String certificateIssuerID = request.getParameter("certificateIssuerID");

        int imgID = -1;
        Certification existingCertification = null;
        String oldImgLink = null;

        if (certificationID != null && !certificationID.isEmpty()) {
            // Lấy thông tin chứng chỉ cũ để xóa sau đó tạo lại
            existingCertification = certificationDAO.getCertificationById(Integer.parseInt(certificationID));
            if (existingCertification != null) {
                imgID = existingCertification.getImgID();
                oldImgLink = imgDAO.getImgLinkByID(imgID);
            }
        }
        System.out.println("Existing imgID: " + imgID);

        // Xử lý ảnh mới nếu có
        Part filePart = request.getPart("img");
        String fileName = getFileName(filePart);
        String imgLink = null;

        if (fileName != null && !fileName.isEmpty()) {

            InputStream fileContent = filePart.getInputStream();
            byte[] imageBytes = fileContent.readAllBytes();
            // Kiểm tra thư mục Img tồn tại
            File uploadDir = new File(IMG_FOLDER);
            if (!uploadDir.exists()) {
                boolean dirCreated = uploadDir.mkdir();
                System.out.println("Thư mục Img được tạo: " + dirCreated);
            }

            // Lưu file mới vào thư mục Img
            String filePath = IMG_FOLDER + "\\" + fileName;
            try (FileOutputStream fos = new FileOutputStream(filePath)) {
                fos.write(imageBytes);
                System.out.println("File mới đã được lưu tại: " + filePath);
            }

            // Lưu thông tin ảnh mới vào database và lấy imgID mới
            imgLink = fileName;
            Img img = new Img();
            img.setImglink(imgLink);
            imgID = imgDAO.addImg1(img);

        }

        // Nếu chứng chỉ cũ tồn tại, xóa chứng chỉ cũ
        if (existingCertification != null) {
            int imgId = existingCertification.getImgID();
            boolean isDeletedCertification = certificationDAO.deleteCertification(imgId);
            if (isDeletedCertification) {
                System.out.println(isDeletedCertification);
            } else {
                System.out.println(isDeletedCertification);
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Cannot delete existing certification.");
                return;
            }
        }
        // Tạo chứng chỉ mới với thông tin được cập nhật
        if (name != null && !name.isEmpty() && detail != null && !detail.isEmpty()) {
            Integer imgIDToUse = imgID != -1 ? imgID : null;

            boolean isCreated = certificationDAO.createCertification1(
                    name,
                    detail,
                    certificateIssuerID,
                    imgIDToUse
            );
            if (isCreated) {
                response.sendRedirect("certificationList");
            } else {
                System.out.println("create failed");
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Cannot create new certification.");
            }
        } else {
            System.out.println("Thông tin không hợp lệ để tạo chứng chỉ mới.");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid certification information.");
        }
    }

}
