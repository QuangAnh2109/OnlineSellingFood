
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
        List<Manufacturer> lmf=md.getAllManufacturers();
        request.setAttribute("manuList", lmf);
        request.getRequestDispatcher("manufacter-list.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
