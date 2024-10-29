package controller;

import java.io.IOException;
import java.io.PrintWriter;

import common.ImgFile;
import dal.ProductImgDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AddProductImgStaffServlet", value = "/AddProductImgStaffServlet")
public class AddProductImgStaffServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("img"));
        Integer imgID = ImgFile.importImg(request.getPart("img"),productID+"-product-");
        ProductImgDAO productImgDAO = new ProductImgDAO();
        if(imgID!=null && productImgDAO.addProductImg(productID,imgID)){
            request.setAttribute("msg","Add image successful");
        }
        else{
            request.setAttribute("msg","Fail to add product img");
        }
        request.getRequestDispatcher(request.getHeader("referer")).forward(request,response);
    }
}