package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import dal.CustomerDAO;
import dal.CustomerVoucherDAO;
import dal.DiscountDAO;
import dal.VoucherDAO;
import dto.VoucherResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import javax.mail.Session;

@WebServlet(name = "LoadVoucher", value = "/LoadVoucher")
public class LoadVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        Customer customer = new CustomerDAO().getCustomerByAccountID(account.getAccountID());
        VoucherDAO voucherDAO = new VoucherDAO();
        DiscountDAO discountDAO = new DiscountDAO();
        List<CustomerVoucher> customerVouchers = new CustomerVoucherDAO().getCustomerVoucher(customer.getCustomerID());
        List<VoucherResponse> vouchers = new ArrayList<>();
        Voucher voucher;
        Discount discount;
        for(CustomerVoucher customerVoucher : customerVouchers) {
            voucher = voucherDAO.getVoucherById(customerVoucher.getVoucherID());
            discount = discountDAO.getDiscountById(voucher.getDiscountID());
            System.out.println("Voucher inventory: " + voucher.getInventory());
            System.out.println("Discount end time: " + discount.getEndTime() + " " + discount.getEndTime().isAfter(LocalDateTime.now()));
            if(discount.getEndTime().isAfter(LocalDateTime.now()) && voucher.getInventory() > 0) {
                vouchers.add(new VoucherResponse(voucher.getVoucherID(),discount.getDiscountID(),discount.getDiscountPercent(),discount.getStartTime(),discount.getEndTime(),voucher.getQuantity(),voucher.getInventory()));
            }
        }
        System.out.println("Customer voucher: " + customerVouchers.size());
        System.out.println("Voucher: " + vouchers.size());
        request.setAttribute("vouchers", vouchers);
        request.getRequestDispatcher("page-account-voucher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rawVoucherID = request.getParameter("voucherID");
        int voucherID = Integer.parseInt(rawVoucherID);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        CustomerVoucherDAO customerVoucherDAO = new CustomerVoucherDAO();
        String msg = "";
        String error = "Mã giảm giá đã hết hoặc không tồn tại";
        Voucher voucher = new VoucherDAO().getVoucherById(voucherID);
        if(voucher!=null){
            Discount discount = new DiscountDAO().getDiscountById(voucher.getDiscountID());
            if(voucher.getQuantity() > 0 && discount.getEndTime().isAfter(LocalDateTime.now())) {
                if(customerVoucherDAO.addCustomerVoucher(new CustomerDAO().getCustomerIDByAccountID(account.getAccountID()), voucherID)) {
                    msg = "Thêm mã giảm giá thành công";
                } else {
                    msg = error;
                }
            }
            else msg = error;
        }
        else msg = error;
        request.getSession().setAttribute("msg", msg);
        response.sendRedirect("LoadVoucher");
    }
}