
import dal.ImgDAO;
import dal.NewsDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Img;
import model.News;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@WebServlet(name = "NewsCreateUpdateServlet", value = "/newsCU")
@MultipartConfig
public class NewsCreateUpdateServlet extends HttpServlet {

    private NewsDAO newsDAO = new NewsDAO();
    private ImgDAO imgDAO = new ImgDAO();

    // Thư mục lưu file
    private static final String IMG_FOLDER = "D:\\SWP_SUM24\\Img";

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
        String newsID = request.getParameter("newsID");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String staffID = request.getParameter("staffID");

        int imgID = -1;

        // Xử lý upload ảnh
        Part filePart = request.getPart("img");
        String fileName = getFileName(filePart);
        if (fileName != null && !fileName.isEmpty()) {
            InputStream fileContent = filePart.getInputStream();
            byte[] imageBytes = fileContent.readAllBytes();
            File uploadDir = new File(IMG_FOLDER);
            if (!uploadDir.exists()) {
                if (uploadDir.mkdirs()) { // Use mkdirs() to create nested directories
                    System.out.println("Img folder created successfully.");
                } else {
                    System.out.println("Failed to create Img folder.");
                }
            }
            String filePath = IMG_FOLDER + "\\" + fileName;
            try (FileOutputStream fos = new FileOutputStream(filePath)) {
                fos.write(imageBytes);
                System.out.println("New file saved at: " + filePath);
            }
        }

        if (title != null && !title.isEmpty() && content != null && !content.isEmpty()) {
            Integer imgIDToUse = imgID != -1 ? imgID : null;

            boolean isCreated = newsDAO.createNews1(staffID, title, imgID, content);
            if (isCreated) {
                request.getSession().setAttribute("msg", "News đã được tạo thành công.");
            } else {
                request.getSession().setAttribute("msg", "Không thể tạo news mới.");
            }
        } else {
            request.getSession().setAttribute("msg", "Thông tin news không hợp lệ.");
        }
        response.sendRedirect("addNew");
    }

}
