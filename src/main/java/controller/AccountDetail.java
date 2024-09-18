package controller;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "AccountDetailServlet", value = "/accountdetail")
public class AccountDetail extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       request.getRequestDispatcher("account_detail.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
        String firstName= req.getParameter("fName");
        String lastName= req.getParameter("lName");
        String accountId= req.getParameter("accountId");
        String email= req.getParameter("email");
        String address= req.getParameter("address");
        String phone= req.getParameter("phoneNumber");
        String birtYear= req.getParameter("birtYear");

    }

    public void destroy() {
    }
}