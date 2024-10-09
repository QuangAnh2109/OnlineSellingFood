package controller;

import dal.ImgDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


import java.io.File;
import java.io.IOException;




@MultipartConfig
@WebServlet(name = "AddImgServlet", value = "/AddImgServlet")
public class AddImgServlet extends HttpServlet {


    // Thư mục lưu file
    private static final String UPLOAD_DIRECTORY = "uploads";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ImgDAO idao = new ImgDAO();

        // Kiểm tra yêu cầu null
        if (request == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Request is null");
            return;
        }

        // Đường dẫn lưu file
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String filePath = null;
        try {
            // Lấy tất cả các phần từ yêu cầu
            for (Part part : request.getParts()) {
                if (part.getName().equals("file")) { // Kiểm tra tên phần
                    String fileName = new File(part.getSubmittedFileName()).getName();
                    filePath = uploadPath + File.separator + fileName;
                    File storeFile = new File(filePath);
                    part.write(String.valueOf(storeFile)); // Lưu file

                    // Lưu đường dẫn vào cơ sở dữ liệu
                    idao.addImage(filePath);
                    request.setAttribute("message", "File đã upload thành công: " + filePath);
                }
            }
        } catch (Exception e) {
            request.setAttribute("message", "Có lỗi xảy ra: " + e.getMessage());
        }

        // Chuyển hướng đến trang PageProductList.jsp
        getServletContext().getRequestDispatcher("PageProductList.jsp").forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("PageProductList.jsp");
    }
}
