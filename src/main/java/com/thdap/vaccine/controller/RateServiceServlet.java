/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.ServiceReviewDAO;
import com.thdap.vaccine.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "RateServiceServlet", urlPatterns = {"/RateServiceServlet"})
public class RateServiceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ServiceReviewDAO serviceReviewDAO;

    public RateServiceServlet() {
        super();
        this.serviceReviewDAO = new ServiceReviewDAO();
    }

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
            out.println("<title>Servlet RateServiceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RateServiceServlet at " + request.getContextPath() + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userIDParam = request.getParameter("userID");
        String typeParam = request.getParameter("type");

        if (userIDParam != null && typeParam != null) {
            request.setAttribute("userID", userIDParam);
            request.setAttribute("type", typeParam);
        }

        request.getRequestDispatcher("RateService.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *
     */
   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String userIDStr = request.getParameter("userID");
    String content = request.getParameter("content");
    String ratingStr = request.getParameter("rating");
    String type = request.getParameter("type");

    // Log the received parameters
    System.out.println("userID: " + userIDStr);
    System.out.println("content: " + content);
    System.out.println("rating: " + ratingStr);
    System.out.println("type: " + type);

    if (userIDStr == null || userIDStr.isEmpty() || content == null || content.isEmpty()
            || ratingStr == null || ratingStr.isEmpty() || type == null || type.isEmpty()) {
        request.setAttribute("errorMessage", "Vui lòng nhập đầy đủ thông tin đánh giá.");
        request.getRequestDispatcher("RateService.jsp").forward(request, response);
        return;
    }

    try {
        int userID = Integer.parseInt(userIDStr);
        int rating = Integer.parseInt(ratingStr);
        Date date = new Date(); // Assuming you want the current date

        // Log before checking existing review
        System.out.println("Checking existing review: userID=" + userID + ", date=" + date + ", type=" + type);

        // Check if review already exists
        if (serviceReviewDAO.reviewExists(userID, date, type)) {
            request.setAttribute("errorMessage", "Bạn đã đánh giá dịch vụ, vui lòng không đánh giá lại.");
            request.getRequestDispatcher("RateService.jsp").forward(request, response);
            return;
        }

        // Log before inserting
        System.out.println("Inserting review: userID=" + userID + ", content=" + content + ", rating=" + rating + ", date=" + date + ", type=" + type);

        // Insert the review into the database
        serviceReviewDAO.insertServiceReview(userID, content, rating, date, type);

        // Redirect to success page
        response.sendRedirect("index.jsp");
    } catch (NumberFormatException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Có lỗi xảy ra khi thêm đánh giá. Vui lòng thử lại.");
        request.getRequestDispatcher("RateService.jsp").forward(request, response);
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Có lỗi xảy ra khi thêm đánh giá. Vui lòng thử lại.");
        request.getRequestDispatcher("RateService.jsp").forward(request, response);
    }
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
