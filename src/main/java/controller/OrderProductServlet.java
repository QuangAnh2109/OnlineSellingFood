package controller;

import dal.*;
import dto.CartItem;
import dto.CheckoutContactDetailResponse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import model.Customer;
import model.Order;
import model.OrderProduct;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "OrderProductServlet", urlPatterns = {"/orderProduct"})
public class OrderProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse respone) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account a= (Account) session.getAttribute("account");
        CustomerDAO cdao = new CustomerDAO();
        OrderDAO odao = new OrderDAO();
        CartDAO cartDAO = new CartDAO();
        OrderProductDAO opdao = new OrderProductDAO();
        Customer c=cdao.getCustomerByAccountID(a.getAccountID());
        int customerID=c.getCustomerID();
        int paymentStatementID=1;
        CheckoutDAO checkoutDAO = new CheckoutDAO();
        CheckoutContactDetailResponse checkoutContactDetailResponse=checkoutDAO.getCheckoutContactDetail(a.getAccountID());
        int contactInformationID=checkoutContactDetailResponse.getContactInformationID();
        String voucherID_raw = request.getParameter("voucherID");
        Integer voucherID = null;
        if (voucherID_raw != null && !voucherID_raw.isEmpty()) {
            voucherID = Integer.parseInt(voucherID_raw);
        }else{
            voucherID=null;
        }

        String priceTotalStr = request.getParameter("priceTotal");

        int priceTotal = 0;
        if (priceTotalStr != null && !priceTotalStr.isEmpty()) {
            try {
                priceTotal = Integer.parseInt(priceTotalStr);

            } catch (NumberFormatException e) {
                return;
            }
        }

        LocalDateTime orderTime = null;
        orderTime = LocalDateTime.now();

        int statusID=1;
        Order order = new Order(customerID,paymentStatementID,contactInformationID,voucherID,priceTotal,orderTime,statusID);
       int orderID = odao.addOrder(order);
       if (orderID > 0) {
           List<CartItem> cartItems=cartDAO.getCartItemsByCustomerID(customerID);
               for (CartItem cartItem : cartItems) {
                   if(cartItem.getPrice()>0){
                       OrderProduct orderProduct=new OrderProduct(orderID,cartItem.getProductID(),cartItem.getPrice(),cartItem.getQuantity(),cartItem.getUnitID());
                       opdao.addOrderProduct(orderProduct);
                   }
               }

           cartDAO.deleteByCustomerId(customerID);
       }
        respone.sendRedirect("homepage");


    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
