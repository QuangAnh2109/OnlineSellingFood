package controller;

import dal.DiscountDAO;
import dal.ProductDAO;
import dto.ProductDiscountResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "DiscountModifyServlet", urlPatterns = {"/discount"})
public class DiscountModifyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse respone) throws ServletException, IOException {
        DiscountDAO dao = new DiscountDAO();
        ProductDAO pdao = new ProductDAO();
        String searchName=request.getParameter("searchName");
        if(searchName==null)searchName="";

        String indexPage=request.getParameter("index");
        if(indexPage==null){
            indexPage="1";
        }

        int index=Integer.parseInt(indexPage);
        List<ProductDiscountResponse> pdr=dao.getProductDiscount(index,searchName);

        int count=pdao.getTotalProduct(searchName);
        int endPage=count/5;
        if(count%5!=0){
            endPage++;
        }
        request.setAttribute("endPage", endPage);
        request.setAttribute("index", index);
        request.setAttribute("searchName", searchName);
        request.setAttribute("productDiscount", pdr);
        request.getRequestDispatcher("create-discount.jsp").forward(request, respone);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int productID = Integer.parseInt(request.getParameter("productID"));
            int discountPercent = Integer.parseInt(request.getParameter("discountPercent"));

            // Định dạng datetime theo tiêu chuẩn ISO 8601 (format của input datetime-local)
            //DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

            // Lấy và chuyển đổi startDate và endDate thành LocalDateTime
            String startDateString = request.getParameter("startDate");
            LocalDateTime startDate = LocalDateTime.parse(startDateString, formatter);
            //response.getWriter().println(startDate);
            String endDateString = request.getParameter("endDate");
            LocalDateTime endDate = LocalDateTime.parse(endDateString, formatter);

            DiscountDAO dao = new DiscountDAO();
            dao.modifyDiscount(discountPercent, productID, startDate, endDate);
            response.sendRedirect("discount");
        } catch (NumberFormatException e) {
            throw new RuntimeException(e);
        }

    }

}
