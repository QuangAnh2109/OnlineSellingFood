package controller;

import dal.UnitDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Unit;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CreateUnitServlet", urlPatterns = {"/createunit"})
public class CreateUnitServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("unitname");
        System.out.println(name);
        int baseUnitId = Integer.parseInt(request.getParameter("baseunitid"));
        System.out.println(baseUnitId);
        int conversionRate = Integer.parseInt(request.getParameter("conversionrate"));
        System.out.println(conversionRate);
        String msg = "Create new unit faild";
        if(new UnitDAO().addUnit(name, baseUnitId, conversionRate)!=null){
            msg = "Create new unit successful";
        }
        response.sendRedirect("unitlist?msg="+msg);
    }
}