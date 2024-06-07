/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.ServiceReviewDAO;
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
@WebServlet(name="CreateServiceReviewServlet", urlPatterns={"/CreateServiceReviewServlet"})
public class CreateServiceReviewServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet CreateServiceReviewServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateServiceReviewServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     ServiceReviewDAO serviceReviewDAO = new ServiceReviewDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        if (user == null) {
            // Người dùng chưa đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        try {          
            request.getRequestDispatcher("CreateServiceReview.jsp").forward(request, response);
              } catch (Exception e) {
            throw new ServletException("Error accessing database.", e);
        }
        }
     

    /** 
     * Handles the HTTP <code>POST</code> method.
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
        int userID = Integer.parseInt(request.getParameter("userID"));
        String content = request.getParameter("content");
        int rate = Integer.parseInt(request.getParameter("rating"));

        // Thêm đánh giá vào cơ sở dữ liệu
        try {
            serviceReviewDAO.insertServiceReview(userID, content, rate);
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý lỗi nếu cần
        }

        // Chuyển hướng người dùng trở lại trang review.jsp sau khi thêm xong
        response.sendRedirect("ServiceReviewServlet");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
