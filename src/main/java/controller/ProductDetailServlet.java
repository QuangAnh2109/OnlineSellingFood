package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import dal.ProductDAO; // Make sure you have a DAO for Product

@WebServlet("/ProductDetail")
public class ProductDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productID = request.getParameter("productID");

        // Assuming you have a ProductDAO to fetch product details
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductById(Integer.parseInt(productID)); // Replace with your actual method to get product

        if (product != null) {
            request.setAttribute("product", product);
        } else {
            // Handle the case where the product is not found (optional)
            request.setAttribute("errorMessage", "Product not found.");
        }

        // Forward to JSP
        request.getRequestDispatcher("shop-product-full.jsp").forward(request, response);
    }
}

