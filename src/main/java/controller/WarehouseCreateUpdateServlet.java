package controller;

import dal.ContactInformationDAO;
import dal.WarehouseDAO;
import dal.WarehouseStatusDAO;
import model.ContactInformation;
import model.Warehouse;
import model.WarehouseStatus;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "WarehouseCreateUpdateServlet", value = "/warehouseCU")
public class WarehouseCreateUpdateServlet extends HttpServlet {
    private WarehouseDAO warehouseDAO = new WarehouseDAO();
    private ContactInformationDAO contactInformationDAO = new ContactInformationDAO();
    private WarehouseStatusDAO warehouseStatusDAO = new WarehouseStatusDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String warehouseID = request.getParameter("warehouseID");
        List<WarehouseStatus> statusList = warehouseStatusDAO.getAllStatus();
        request.setAttribute("statusList", statusList);

        if (warehouseID != null) {
            Warehouse warehouse = warehouseDAO.getWarehouse(Integer.parseInt(warehouseID));
            ContactInformation contactInfo = contactInformationDAO.getContactInformationByContactID(warehouse.getContactInformationID());

            request.setAttribute("warehouseID", warehouse.getWarehouseID());
            request.setAttribute("name", warehouse.getName());
            request.setAttribute("statusID", warehouse.getStatusID());
            request.setAttribute("contactID", contactInfo.getContactInformationID());
            request.setAttribute("address", contactInfo.getAddress());
            request.setAttribute("phoneNumber", contactInfo.getPhoneNumber());
        }
        request.getRequestDispatcher("page-origin-warehouse.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String warehouseID = request.getParameter("warehouseID");
        String name = request.getParameter("name");
        String statusID = request.getParameter("statusID");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phone");

        // Kiểm tra thông tin liên lạc có tồn tại không
        ContactInformation existingContactInfo = contactInformationDAO.getContactInformationByAddressAndPhone(address, phoneNumber);

        if (warehouseID != null && !warehouseID.isEmpty()) {
            // Cập nhật warehouse
            int contactID;
            if (existingContactInfo != null) {
                // Nếu thông tin liên lạc đã tồn tại, lấy ContactInformationID
                contactID = existingContactInfo.getContactInformationID();
            } else {
                // Nếu không tồn tại, thêm mới thông tin liên lạc
                ContactInformation newContactInfo = new ContactInformation(address, phoneNumber);
                contactID = contactInformationDAO.addContact(newContactInfo);
            }

            // Cập nhật warehouse với ContactInformationID
            Warehouse warehouse = new Warehouse(Integer.parseInt(warehouseID), contactID, Integer.parseInt(statusID), name);
            boolean isUpdated = warehouseDAO.updateWarehouse(warehouse);

            if (isUpdated) {
                response.sendRedirect("warehouseList");
            } else {
                // Nếu cập nhật warehouse thất bại
                System.out.println("Update warehouse failed");
            }
        } else {
            // Tạo mới warehouse
            Integer contactID;
            if (existingContactInfo != null) {
                // Nếu thông tin liên lạc đã tồn tại, lấy ContactInformationID
                contactID = existingContactInfo.getContactInformationID();
            } else {
                // Nếu không tồn tại, thêm mới thông tin liên lạc
                ContactInformation contactInfo = new ContactInformation(address, phoneNumber);
                contactID = contactInformationDAO.addContact(contactInfo);
            }

            // Tạo mới warehouse
            Warehouse warehouse = new Warehouse(contactID, Integer.parseInt(statusID), name);
            Integer newWarehouseID = warehouseDAO.addWarehouse(warehouse);

            if (newWarehouseID != null) {
                response.sendRedirect("warehouseList");
            } else {
                // Nếu thêm warehouse thất bại
                System.out.println("Create warehouse failed");
            }
        }
    }
}
