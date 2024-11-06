
import dal.NewsDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.News;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewDetailServlet", value = "/new-detail")
public class NewDetailServlet extends HttpServlet {
    private NewsDAO newsDAO = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the news ID from the request
        int newsId = Integer.parseInt(request.getParameter("newsId"));

        // Get the news details using the NewsDAO
        News news = newsDAO.getById(newsId);

        // Set the news object as a request attribute
        request.setAttribute("news", news);

        // Forward to the JSP page for display
        request.getRequestDispatcher("New-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // No POST logic required for this servlet
    }
}
