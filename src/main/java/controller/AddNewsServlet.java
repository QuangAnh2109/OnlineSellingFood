import dal.ImgDAO;
import dal.NewsDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.News;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddNewsServlet", value = "/addNew")
public class AddNewsServlet extends HttpServlet {
    private NewsDAO newsDAO;
    private ImgDAO imgDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        newsDAO = new NewsDAO();
        imgDAO = new ImgDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy danh sách tin tức
            NewsDAO newdao =new NewsDAO();
            List<News> newsList = newsDAO.getAll();
            request.setAttribute("newsList", newsList);

            // Chuyển tiếp đến trang JSP
            request.getRequestDispatcher("add-new.jsp").forward(request, response);

        } catch (Exception e) {
            // Xử lý lỗi nếu có
            e.printStackTrace();
            request.getSession().setAttribute("msg", "Có lỗi xảy ra khi tải danh sách tin tức");
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng POST request về doGet vì việc xử lý thêm/sửa đã được xử lý trong NewsCreateUpdateServlet
        response.sendRedirect("add-new.jsp");
    }
}