package controller;


import dal.FeedbackProductDAO;
import dto.FeedbackResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "ViewFeedbackServlet", urlPatterns = {"/viewfeedback"})
public class ViewFeedbackServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse respone) throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        FeedbackProductDAO feedbackProductDAO = new FeedbackProductDAO();
        List<FeedbackResponse> list = feedbackProductDAO.getAllFeedbackProduct(productID);
        request.setAttribute("list", list);
        request.getRequestDispatcher("view-feedback.jsp").forward(request, respone);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int productID = Integer.parseInt(request.getParameter("productID"));
        int customerID = Integer.parseInt(request.getParameter("customerID"));
        FeedbackProductDAO feedbackProductDAO = new FeedbackProductDAO();
        feedbackProductDAO.deleteFeedbackProduct(productID, customerID);
        doGet(request, response);

    }

}
