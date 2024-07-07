package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.OrderVaccineInfoDAO;
import com.thdap.vaccine.dao.UserDAO;
import com.thdap.vaccine.dao.VaccineDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.model.OrderVaccineInfo;
import com.thdap.vaccine.model.User;
import com.thdap.vaccine.model.Vaccine;
import com.thdap.vaccine.model.WorkLocation;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listOrderInfo")
public class ListOrderInfoServlet extends HttpServlet {

    private OrderVaccineInfoDAO orderVaccineInfoDAO;
    private UserDAO userDAO;
    private WorkLocationDAO worklocationDAO;
    private VaccineDAO vaccineDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        orderVaccineInfoDAO = new OrderVaccineInfoDAO();
        userDAO = new UserDAO();
        worklocationDAO = new WorkLocationDAO();
        vaccineDAO = new VaccineDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<OrderVaccineInfo> orders = orderVaccineInfoDAO.getAllOrderVaccineInfo();
        List<User> users = userDAO.getAllUsers(); // Lấy danh sách người dùng từ UserDAO
        List<WorkLocation> workLocations = worklocationDAO.getAllWorkLocations();
        List<Vaccine> vaccines = vaccineDAO.getAllVaccines();
        // Đặt danh sách orders và users vào request để sử dụng trong JSP
        request.setAttribute("orders", orders);
        request.setAttribute("users", users);
        request.setAttribute("workLocations", workLocations);
        request.setAttribute("vaccines", vaccines);
        request.getRequestDispatcher("/listOrderInfo.jsp").forward(request, response);
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String action = request.getParameter("action");

    if (action != null && action.equals("updateConfirmStatus")) {
        int orderInfoID = Integer.parseInt(request.getParameter("orderInfoID"));
        boolean confirmStatus = Boolean.parseBoolean(request.getParameter("confirmStatus"));

        // Check if paymentStatus is PAID
        OrderVaccineInfo order = orderVaccineInfoDAO.getOrderInfoByID(orderInfoID);
        if (order != null && order.getPaymentStatus().equals("PAID")) {
            boolean success = orderVaccineInfoDAO.updateConfirmStatusByID(orderInfoID, confirmStatus);

            if (success) {
                // Set a new attribute to indicate confirmation status
                order.setConfirmStatus(confirmStatus);
                request.setAttribute("order", order); // Update order in request

                // Get user, work location, and vaccine information
                User user = userDAO.findUserByID(order.getUserID());
                WorkLocation workLocation = worklocationDAO.getWorkLocationById(order.getWorkLocationID());
                Vaccine vaccine = vaccineDAO.getVaccineById(order.getVaccineID());

                // Send confirmation email to user
                if (user != null && workLocation != null && vaccine != null) {
                    String to = user.getEmail(); // Get user's email address
                    String userName = user.getFullName(); // Get user's full name
                    SendMail.sendOrderConfirmationEmail(to, userName, order, workLocation, vaccine); // Send order confirmation email
                    System.out.println("Sent order confirmation email to: " + to);
                }

                response.sendRedirect(request.getContextPath() + "/listOrderInfo");
                return; // Important to return after sendRedirect
            }
        }
    }

    // Handle error or other cases here
    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Không thể cập nhật trạng thái xác nhận.");
}

}
