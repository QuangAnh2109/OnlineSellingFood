package controller;

import dal.NewsDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "NewsDeleteServlet", urlPatterns = {"/newsDelete"})
public class NewsDeleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int newsID = Integer.parseInt(request.getParameter("newsID"));
        NewsDAO newsDAO = new NewsDAO();
        boolean result = newsDAO.delete(newsID);

        if (result) {
            request.getSession().setAttribute("msg", "Xóa tin tức thành công.");
        } else {
            request.getSession().setAttribute("msg", "Có lỗi xảy ra khi xóa tin tức.");
        }

        response.sendRedirect("add-new.jsp"); // Chuyển hướng về trang danh sách tin tức
    }
}
