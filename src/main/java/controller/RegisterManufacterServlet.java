package controller;

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

        ManufacterDAO manufacterDAO = new ManufacterDAO();

        // Step 2: Check if the manufacturer name already exists
        if (manufacterDAO.isManufacturerNameExists(name)) {
            // Step 3: If the name exists, show an error message and return to the form
            request.setAttribute("errorMessage", "Manufacturer with this name already exists.");
            request.getRequestDispatcher("add-manufacter.jsp").forward(request, response);
        } else {
            // Step 4: Create a new Manufacturer object and add it to the database
            Manufacturer manufacturer = new Manufacturer();
            manufacturer.setName(name);
            manufacturer.setIntroduce(introduce);

            Integer manufacturerID = manufacterDAO.addManufacturer(manufacturer);

            // Step 5: Handle response based on whether manufacturerID is null
            if (manufacturerID != null) {
                // If added successfully, set success message
//                request.setAttribute("successMessage", "Manufacturer added successfully.");
//                request.getRequestDispatcher("add-manufacter.jsp").forward(request, response);
                response.sendRedirect("manulist");
            } else {
                // If adding failed, set error message
                request.setAttribute("errorMessage", "Failed to add the manufacturer.");
                request.getRequestDispatcher("add-manufacter.jsp").forward(request, response);
            }

        }
    }
}


