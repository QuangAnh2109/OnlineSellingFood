import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import dal.NewsDAO;
import model.News;
import java.util.List;

@WebServlet(name = "ListNewsServlet", value = "/listNews")
public class ListNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewsDAO newsDAO = new NewsDAO();
        List<News> newsList = newsDAO.getAll();
        request.setAttribute("newsList", newsList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("new-list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handling search functionality
        String searchQuery = request.getParameter("search");
        NewsDAO newsDAO = new NewsDAO();
        List<News> newsList;

        if (searchQuery != null && !searchQuery.isEmpty()) {
            newsList = newsDAO.searchByTitle(searchQuery);
        } else {
            newsList = newsDAO.getAll();
        }

        request.setAttribute("newsList", newsList);
        request.setAttribute("searchQuery", searchQuery);  // Preserve search term in form
        RequestDispatcher dispatcher = request.getRequestDispatcher("new-list.jsp");
        dispatcher.forward(request, response);
    }
}
