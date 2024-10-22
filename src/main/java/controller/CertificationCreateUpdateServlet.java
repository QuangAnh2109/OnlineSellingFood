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
        String certificateIssuerID = request.getParameter("certificateIssuerID");

        // Xử lý upload ảnh
        Part filePart = request.getPart("img");
        String fileName = getFileName(filePart);
        String imgLink = null;
        int imgID = -1;  // imgID mặc định là -1 nếu không thêm được ảnh

        if (fileName != null && !fileName.isEmpty()) {
            InputStream fileContent = filePart.getInputStream();
            byte[] imageBytes = fileContent.readAllBytes();

            // Kiểm tra thư mục Img tồn tại
            File uploadDir = new File(IMG_FOLDER);
            if (!uploadDir.exists()) {
                boolean dirCreated = uploadDir.mkdir();
                System.out.println("Thư mục Img được tạo: " + dirCreated);
            }

//            // Lưu file vào thư mục Img với đường dẫn nhất quán sử dụng /
//            String filePath = IMG_FOLDER + "/" + fileName;
//            try (FileOutputStream fos = new FileOutputStream(filePath)) {
//                fos.write(imageBytes);
//                System.out.println("File đã được lưu tại: " + filePath);
//            } catch (IOException e) {
//                System.err.println("Lỗi khi lưu file: " + e.getMessage());
//                response.getWriter().println("Lỗi khi lưu file: " + e.getMessage());
//                return;
//            }

            // Lưu thông tin ảnh vào database và lấy imgID
            imgLink = fileName;
            Img img = new Img();
            img.setImglink(imgLink);
            imgID = imgDAO.addImg1(img);
        }

        if (certificationID != null && !certificationID.isEmpty()) {
            // Cập nhật chứng chỉ
            if (name != null && !name.isEmpty() && detail != null && !detail.isEmpty()) {
                boolean isUpdated = certificationDAO.updateCertification(
                        Integer.parseInt(certificationID),
                        name,
                        detail,
                        imgID != -1 ? imgID : null,
                        Integer.parseInt(certificateIssuerID)
                );
                if (isUpdated) {
                    response.sendRedirect("certificationList");
                } else {
                    System.out.println("update failed");
                }
            }
        } else {
            // Tạo mới chứng chỉ
            if (name != null && !name.isEmpty() && detail != null && !detail.isEmpty()) {
                // Chỉ thêm ảnh nếu imgID hợp lệ, nếu không thì truyền null
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
                    System.out.println("create fail");
                }
            }
        }

    }

}
