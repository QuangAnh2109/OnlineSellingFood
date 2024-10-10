
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import model.Manufacturer;
import dal.ManufacterDAO;

@WebServlet(name = "RegisterManufacterServlet", value = "/registerManu")
public class RegisterManufacterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Step 1: Forward to the form page
        request.getRequestDispatcher("add-manufacter.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Step 1: Retrieve form data
        String name = request.getParameter("name");
        String introduce = request.getParameter("introduce");

        // Step 2: Create a new Manufacturer object
        Manufacturer manufacturer = new Manufacturer();
        manufacturer.setName(name);
        manufacturer.setIntroduce(introduce);

        // Step 3: Use ManufacterDAO to add the manufacturer to the database
        ManufacterDAO manufacterDAO = new ManufacterDAO();
        Integer manufacturerID = manufacterDAO.addManufacturer(manufacturer);

        // Step 4: Handle response based on whether manufacturerID is null
        if (manufacturerID != null) {
            // Redirect to the manufacturer list or a success page
            response.sendRedirect("manulist"); // Assuming you have a manufacter-list page
        } else {
            // Redirect back to the form with an error message
            request.setAttribute("errorMessage", "Failed to add the manufacturer.");
            request.getRequestDispatcher("add-manufacter.jsp").forward(request, response);
        }
    }
}


