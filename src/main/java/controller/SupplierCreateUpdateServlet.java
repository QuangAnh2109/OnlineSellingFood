package controller;

import dal.ContactInformationDAO;
import dal.SupplierDAO;
import model.ContactInformation;
import model.Supplier;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "SupplierCreateUpdateServlet", value = "/supplierCU")
public class SupplierCreateUpdateServlet extends HttpServlet {
    private SupplierDAO supplierDAO = new SupplierDAO();
    private ContactInformationDAO contactInformationDAO = new ContactInformationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String supplierID = request.getParameter("supplierID");

        if (supplierID != null) {
            // Lấy thông tin nhà cung cấp và thông tin liên hệ
            Supplier supplier = supplierDAO.getSupplier(Integer.parseInt(supplierID));
            ContactInformation contactInfo = contactInformationDAO.getContactInformationByContactID(supplier.getContactInformationID());

            // Thiết lập các thuộc tính cho JSP
            request.setAttribute("supplierID", supplier.getSupplierID());
            request.setAttribute("name", supplier.getName());
            request.setAttribute("note", supplier.getNote());
            request.setAttribute("contactID", contactInfo.getContactInformationID());
            request.setAttribute("address", contactInfo.getAddress());
            request.setAttribute("phoneNumber", contactInfo.getPhoneNumber());
        }

        // Chuyển hướng đến trang JSP
        request.getRequestDispatcher("page-origin-supplier.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String supplierID = request.getParameter("supplierID");
        String name = request.getParameter("name");
        String note = request.getParameter("note");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone");

        // Kiểm tra thông tin liên lạc có tồn tại không
        ContactInformation existingContactInfo = contactInformationDAO.getContactInformationByAddressAndPhone(address, phoneNumber);

        if (supplierID != null && !supplierID.isEmpty()) {
            // Cập nhật nhà cung cấp
            int contactID;
            if (existingContactInfo != null) {
                // Nếu thông tin liên lạc đã tồn tại, lấy ContactInformationID
                contactID = existingContactInfo.getContactInformationID();
            } else {
                // Nếu không tồn tại, thêm mới thông tin liên lạc
                ContactInformation newContactInfo = new ContactInformation(address, phoneNumber);
                contactID = contactInformationDAO.addContact(newContactInfo);
            }

            // Cập nhật nhà cung cấp với ContactInformationID
            Supplier supplier = new Supplier(Integer.parseInt(supplierID), contactID, name, note);
            boolean isUpdated = supplierDAO.updateSupplier(supplier);

            if (isUpdated) {
                response.sendRedirect("supplierList");
            } else {
                // Nếu cập nhật nhà cung cấp thất bại
                System.out.println("Update supplier failed");
            }
        } else {
            // Tạo mới nhà cung cấp
            if (existingContactInfo != null) {
                // Nếu thông tin liên lạc đã tồn tại, lấy ContactInformationID
                Integer newContactID = existingContactInfo.getContactInformationID();
                Supplier supplier = new Supplier(newContactID, name, note);
                Integer newSupplierID = supplierDAO.addSupplier(supplier);
                if (newSupplierID != null) {
                    response.sendRedirect("supplierList");
                } else {
                    // Nếu thêm nhà cung cấp thất bại
                    System.out.println("Create supplier failed");
                }
            } else {
                // Nếu không tồn tại, thêm mới thông tin liên lạc và nhà cung cấp
                ContactInformation contactInfo = new ContactInformation(address, phoneNumber);
                Integer newContactID = contactInformationDAO.addContact(contactInfo);
                if (newContactID != null) {
                    Supplier supplier = new Supplier(newContactID, name, note);
                    Integer newSupplierID = supplierDAO.addSupplier(supplier);
                    if (newSupplierID != null) {
                        response.sendRedirect("supplierList");
                    } else {
                        // Nếu thêm nhà cung cấp thất bại
                        System.out.println("Create supplier failed");
                    }
                } else {
                    // Nếu thêm thông tin liên lạc thất bại
                    System.out.println("Create contact information failed");
                }
            }
        }
    }

}
