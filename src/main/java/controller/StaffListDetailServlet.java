package controller;

import java.io.*;
import java.util.List;

import dal.StaffDAO;
import dto.StaffDetailRespone;
import dto.StaffListResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "StaffListDetailServletServlet", urlPatterns = {"/staffListDetail"})
public class StaffListDetailServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StaffDAO sd = new StaffDAO();
        String accountID_raw=request.getParameter("accountID");
        try {
            int accountID = Integer.parseInt(accountID_raw);
            StaffDetailRespone sdr=sd.getStaffDetail(accountID);
            request.setAttribute("staffListDetail", sdr);
            request.setAttribute("accountID", accountID);
            request.getRequestDispatcher("staff-detail.jsp").forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}