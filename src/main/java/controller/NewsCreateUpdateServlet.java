
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

        // Handle image upload
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

            Img img = new Img();
            img.setImglink(fileName);
            imgID = imgDAO.addImg1(img);
        }

        News existingNews = null;
        if (newsID != null && !newsID.isEmpty()) {
            existingNews = newsDAO.getById(Integer.parseInt(newsID));

            boolean isUsed = newsDAO.isNewsUsed(Integer.parseInt(newsID));
            if (isUsed) {
                request.getSession().setAttribute("msg", "News này đang được sử dụng và không thể cập nhật hoặc xóa.");
                List<News> newsList = newsDAO.getAll();
                request.setAttribute("newsList", newsList);
                request.getRequestDispatcher("add-new.jsp").forward(request, response);
                return;
            }

            if (existingNews != null) {
                // Xóa news cũ
                newsDAO.delete(existingNews.getNewsID());
                // Lấy ImgID từ news cũ
                int oldImgID = existingNews.getImgID();

                // Xóa ảnh cũ sau khi xóa news
                if (oldImgID != -1) {
                    Img oldImg = imgDAO.getImgById(oldImgID);
                    if (oldImg != null) {
                        String oldImgPath = IMG_FOLDER + "\\" + oldImg.getImglink();
                        File oldImgFile = new File(oldImgPath);
                        if (oldImgFile.exists()) {
                            boolean isDeleted = oldImgFile.delete();
                            System.out.println("Old image deleted: " + isDeleted);
                            // Xóa bản ghi ảnh trong database
                            if (isDeleted) {
                                imgDAO.deleteImg(oldImgID);
                            }
                        }
                    }
                }
            }
        }

        if (title != null && !title.isEmpty() && content != null && !content.isEmpty()) {
            Integer imgIDToUse = imgID != -1 ? imgID : existingNews != null ? existingNews.getImgID() : null;

            boolean isCreated = newsDAO.createNews1(title, content, staffID, imgIDToUse);
            if (isCreated) {
                request.getSession().setAttribute("msg", "News đã được tạo thành công.");
                response.sendRedirect("addNew");
            } else {
                System.out.println("Failed to create new news.");
                request.getSession().setAttribute("msg", "Không thể tạo news mới.");
                response.sendRedirect("addNew");  // Chuyển hướng về danh sách news
            }
        } else {
            System.out.println("Invalid news information.");
            request.getSession().setAttribute("msg", "Thông tin news không hợp lệ.");
            response.sendRedirect("addNew");  // Chuyển hướng về danh sách news
        }
    }

}
