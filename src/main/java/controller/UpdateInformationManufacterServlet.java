import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import dal.ManufacterDAO;
import model.Manufacturer;

@WebServlet(name = "UpdateInformationManufacterServlet", value = "/updateManuForAdmin")
public class UpdateInformationManufacterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String manufacturerID_raw = request.getParameter("ManufacturerID");
        int manufacturerID;

        try {
            manufacturerID = Integer.parseInt(manufacturerID_raw);

            ManufacterDAO manufacturerDAO = new ManufacterDAO();
            Manufacturer manufacturer = manufacturerDAO.getManufacturerByID(manufacturerID);

            // Pass manufacturer data to the JSP
            request.setAttribute("manuListDetail", manufacturer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("manufacter-detail.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp"); // Handle error scenarios
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String manufacturerID_raw = request.getParameter("ManufacturerID");
        String name = request.getParameter("name");
        String introduce = request.getParameter("introduce");

        try {
            int manufacturerID = Integer.parseInt(manufacturerID_raw);

            ManufacterDAO manufacturerDAO = new ManufacterDAO();
            Manufacturer manufacturer = manufacturerDAO.getManufacturerByID(manufacturerID);

            // Update manufacturer data
            manufacturer.setName(name);
            manufacturer.setIntroduce(introduce);

            // Call DAO to update in the database
            boolean updateSuccess = manufacturerDAO.updateManufacturer(manufacturer);

            if (updateSuccess) {
                // Set success message in session and redirect to manulist
                HttpSession session = request.getSession();
                session.setAttribute("successMessage", "Manufacturer information updated successfully.");
                response.sendRedirect(request.getContextPath() + "/manulist");
            } else {
                // Set error message and forward back to the update form
                request.setAttribute("errorMessage", "Update failed. The manufacturer name may already exist.");
                request.setAttribute("manuListDetail", manufacturer);
                request.getRequestDispatcher("manufacter-detail.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating the manufacturer information.");
            request.getRequestDispatcher("manufacter-detail.jsp").forward(request, response);
        }
    }
}