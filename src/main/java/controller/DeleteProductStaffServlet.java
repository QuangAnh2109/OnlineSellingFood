package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import dal.DBContext;
import dal.ImgDAO;
import dal.ProductDAO;
import dal.ProductImgDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Img;
import model.ProductImg;

@WebServlet(name = "DeleteProductStaffServlet", value = "/DeleteProductStaffServlet")
public class DeleteProductStaffServlet extends HttpServlet {
    private final Logger logger = Logger.getLogger(getServletName());
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productid"));
        String msg = "";
        try {
            DBContext.connection.setAutoCommit(false);
            List<ProductImg> productImgs = new ProductImgDAO().deleteProductImg(productID);
            ImgDAO imgDAO = new ImgDAO();
            for(ProductImg productImg:productImgs){
                imgDAO.deleteImg(productImg.getImgID());
            }
            if(new ProductDAO().deleteProduct(productID)){
                DBContext.connection.commit();
                msg = "Delete product successful";
            }
            else{
                DBContext.connection.rollback();
                msg = "Fail to delete product";
            }
            DBContext.connection.setAutoCommit(true);
        } catch (SQLException e) {
            logger.info(e.getMessage());
        }
        request.setAttribute("msg",msg);
        request.getRequestDispatcher(request.getHeader("referer")).forward(request,response);
    }
}