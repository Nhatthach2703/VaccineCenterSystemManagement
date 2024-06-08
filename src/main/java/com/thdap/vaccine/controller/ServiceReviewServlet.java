/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.AccountDAO;
import com.thdap.vaccine.dao.ServiceReviewDAO;
import com.thdap.vaccine.dao.UserDAO;
import com.thdap.vaccine.model.Account;
import com.thdap.vaccine.model.ServiceReview;
import com.thdap.vaccine.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ServiceReviewServlet", urlPatterns = {"/ServiceReviewServlet"})
public class ServiceReviewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServiceReviewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServiceReviewServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ServiceReviewDAO serviceReviewDAO = new ServiceReviewDAO();
    UserDAO userDAO = new UserDAO();
    AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        List<User> users = userDAO.getAllUsers();
        request.setAttribute("users", users);
        List<Account> accounts = accountDAO.getAllAccounts();
        request.setAttribute("accounts", accounts);
        
        List<ServiceReview> serviceReviews = serviceReviewDAO.getAllServiceReviews();
        request.setAttribute("serviceReviews", serviceReviews);

        try {
            request.getRequestDispatcher("ServiceReview.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error accessing database.", e);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            // Người dùng chưa đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Kiểm tra đầu vào
        String content = request.getParameter("content");
        String ratingStr = request.getParameter("rating");
        if (content == null || content.isEmpty() || ratingStr == null || ratingStr.isEmpty()) {
            // Thông báo lỗi và quay lại trang đánh giá nếu đầu vào không hợp lệ
            request.setAttribute("errorMessage", "Vui lòng nhập đầy đủ thông tin đánh giá.");
            request.getRequestDispatcher("ServiceReview.jsp").forward(request, response);
            return;
        }

        int userID = user.getUserID();  // Lấy userID từ phiên làm việc
        int rate = Integer.parseInt(ratingStr);

        // Thêm đánh giá vào cơ sở dữ liệu
        try {
            serviceReviewDAO.insertServiceReview(userID, content, rate);
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý lỗi nếu cần
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi thêm đánh giá. Vui lòng thử lại.");
            request.getRequestDispatcher("ServiceReview.jsp").forward(request, response);
            return;
        }

        // Chuyển hướng người dùng trở lại trang đánh giá sau khi thêm xong
        response.sendRedirect("ServiceReviewServlet");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
