package controller;

import dal.ImgDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Img;
import org.eclipse.tags.shaded.org.apache.bcel.generic.FieldGenOrMethodGen;


import java.io.File;
import java.io.IOException;




@MultipartConfig
@WebServlet(name = "AddImgServlet", value = "/AddImgServlet")
public class AddImgServlet extends HttpServlet {


    // Thư mục lưu file
    private static final String UPLOAD_DIRECTORY = "uploads";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ImgDAO idao = new ImgDAO();
        String img = request.getParameter("img");
        idao.addImage(img);
        request.getRequestDispatcher("PageProductList.jsp").forward(request, response);


    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ImgDAO idao = new ImgDAO();
        String img = request.getParameter("img");
        Img imgg = new Img();
        imgg.setImglink(img);
        idao.addImg(imgg);

    request.getRequestDispatcher("PageProductList.jsp").forward(request, response);




    }
}
