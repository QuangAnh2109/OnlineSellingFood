
import dal.ManufacterDAO;
import dal.StaffDAO;
import dto.StaffListResponse;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Manufacturer;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManufacterListServlet", value = "/manulist")
public class ManufacterListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManufacterDAO md = new ManufacterDAO();
        List<Manufacturer> lmf = md.getAllManufacturers();
        String searchQuery = request.getParameter("search");
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            lmf = md.searchManufacturersByName(searchQuery); // Search by name
        } else {
            lmf = md.getAllManufacturers(); // Get all manufacturers if search is empty
        }
        request.setAttribute("manuList", lmf);
        request.getRequestDispatcher("manufacter-list.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            // Handle deletion
            int manufacturerID = Integer.parseInt(request.getParameter("ManufacturerID"));
            ManufacterDAO md = new ManufacterDAO();
            boolean success = md.deleteManufacturer(manufacturerID);

            if (success) {
                response.sendRedirect("manulist");
            } else {
                request.setAttribute("error", "Failed to delete manufacturer.");
                request.getRequestDispatcher("manufacter-list.jsp").forward(request, response);
            }
        } else {
            // Handle other actions (like adding or updating manufacturers)
            String name = request.getParameter("name");
            String introduce = request.getParameter("introduce");

            Manufacturer manufacturer = new Manufacturer();
            manufacturer.setName(name);
            manufacturer.setIntroduce(introduce);

            ManufacterDAO md = new ManufacterDAO();
            Integer manufacturerID = md.addManufacturer(manufacturer);

            if (manufacturerID != null) {
                response.sendRedirect("manulist");
            } else {
                request.setAttribute("error", "Failed to add manufacturer.");
                request.getRequestDispatcher("manufacter-list.jsp").forward(request, response);
            }
        }
    }
}
