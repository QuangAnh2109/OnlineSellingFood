package controller;

import java.io.IOException;
import java.io.PrintWriter;

import dal.ProductImgDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateProductImgStaffServlet", value = "/UpdateProductImgStaffServlet")
public class UpdateProductImgStaffServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int imgID = Integer.parseInt(request.getParameter("imgid"));
        int productID = Integer.parseInt(request.getParameter("productid"));
        if(new ProductImgDAO().setDefaultProductImg(productID,imgID)){
            request.setAttribute("msg","Update default image successful");
        }
        else request.setAttribute("msg","Fail to update default image");
        request.getRequestDispatcher(request.getHeader("referer")).forward(request,response);
    }
}