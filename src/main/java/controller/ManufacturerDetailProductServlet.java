import dal.ManufacterDAO;
import dal.ProductDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Manufacturer;
import model.Product;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManufacturerDetailProductServlet", value = "/manufacturer-detail")
public class ManufacturerDetailProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int manufacturerId = Integer.parseInt(request.getParameter("id"));

            ManufacterDAO manufacturerDAO = new ManufacterDAO();
            ProductDAO productDAO = new ProductDAO();

            // Get manufacturer details
            Manufacturer manufacturer = manufacturerDAO.getManufacturerByID(manufacturerId);
            if (manufacturer == null) {
                response.sendRedirect("404.jsp"); // Or your error page
                return;
            }

            // Get all products by this manufacturer
            List<Product> products = productDAO.getProductsByManufacturer(manufacturerId);

            // Set attributes for JSP
            request.setAttribute("manufacturer", manufacturer);
            request.setAttribute("products", products);
            request.setAttribute("totalProducts", products.size());

            // Forward to JSP page
            request.getRequestDispatcher("page-manu-detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("404.jsp"); // Or your error page
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}