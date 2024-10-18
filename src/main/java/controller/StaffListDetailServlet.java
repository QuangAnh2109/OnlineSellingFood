package controller;

import java.io.*;
import java.util.List;

import dal.AccountContactDAO;
import dal.StaffDAO;
import dal.WarehouseDAO;
import dto.StaffDetailRespone;
import dto.StaffListResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AccountContact;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "StaffListDetailServletServlet", urlPatterns = {"/staffListDetail"})
public class StaffListDetailServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StaffDAO sd = new StaffDAO();
        String accountID_raw=request.getParameter("accountID");
        int accountID = Integer.parseInt(accountID_raw);
        StaffDetailRespone sdr=sd.getStaffDetail(accountID);
        request.setAttribute("warehouses",new WarehouseDAO().getAllWarehouseActivity());
        request.setAttribute("staffListDetail", sdr);
        request.setAttribute("accountID", accountID);
        request.setAttribute("contactID", new AccountContactDAO().getAccountContact(accountID));
        request.getRequestDispatcher("staff-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}