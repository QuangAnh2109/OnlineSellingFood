
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import dal.NewsDAO;
import dal.ImgDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.News;
import model.Img;


@WebServlet(name = "NewsCreateUpdateServlet", value = "/newsCU")
@MultipartConfig
public class NewsCreateUpdateServlet extends HttpServlet {

    private NewsDAO newsDAO = new NewsDAO();
    private ImgDAO imgDAO = new ImgDAO();
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
        String status = request.getParameter("status"); // "active" or "nonactive"

        Boolean isActive = "active".equals(status);

        // Initialize imgID with a default invalid ID value
        int imgID = -1;

        // File upload logic
        Part filePart = request.getPart("img");
        String fileName = getFileName(filePart);
        if (fileName != null && !fileName.isEmpty()) {
            InputStream fileContent = filePart.getInputStream();
            byte[] imageBytes = fileContent.readAllBytes();
            File uploadDir = new File(IMG_FOLDER);
            if (!uploadDir.exists()) {
                boolean dirCreated = uploadDir.mkdir();
                System.out.println("Img folder created: " + dirCreated);
            }

            String filePath = IMG_FOLDER + "\\" + fileName;
            try (FileOutputStream fos = new FileOutputStream(filePath)) {
                fos.write(imageBytes);
                System.out.println("New file saved at: " + filePath);
            }

            News existingNews = null;
            if (newsID != null && !newsID.isEmpty()) {
                try {
                    existingNews = newsDAO.getById(Integer.parseInt(newsID));
                } catch (NumberFormatException e) {
                    System.out.println("Invalid newsID format: " + newsID);
                }
            }

            if (title != null && !title.isEmpty() && content != null && !content.isEmpty()) {
                Integer imgIDToUse = imgID != -1 ? imgID : (existingNews != null ? existingNews.getImgID() : null);
                Date currentTime = new Date();

                boolean isCreated = newsDAO.createOrUpdateNews(
                        Integer.parseInt(staffID), title, imgIDToUse, currentTime, content, isActive
                );
                if (isCreated) {
                    request.getSession().setAttribute("msg", "News article has been successfully created/updated.");
                    response.sendRedirect("addNew");
                } else {
                    request.getSession().setAttribute("msg", "Failed to create or update news.");
                    response.sendRedirect("addNew");
                }
            } else {
                request.getSession().setAttribute("msg", "Invalid news information.");
                response.sendRedirect("addNew");
            }
        }
    }

}
