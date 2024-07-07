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
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ListServiceReviewServlet", urlPatterns = {"/ListServiceReviewServlet"})
public class ListServiceReviewServlet extends HttpServlet {

    ServiceReviewDAO serviceReviewDAO = new ServiceReviewDAO();
    UserDAO userDAO = new UserDAO();
    AccountDAO accountDAO = new AccountDAO();
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
            out.println("<title>Servlet ListServiceReviewServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListServiceReviewServlet at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String ratingStr = request.getParameter("rating");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String type = request.getParameter("type");

        int rating = 0;
        if (ratingStr != null && !ratingStr.isEmpty()) {
            rating = Integer.parseInt(ratingStr);
        }

        Date startDate = null;
        Date endDate = null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (startDateStr != null && !startDateStr.isEmpty()) {
            try {
                startDate = new Date(dateFormat.parse(startDateStr).getTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        if (endDateStr != null && !endDateStr.isEmpty()) {
            try {
                endDate = new Date(dateFormat.parse(endDateStr).getTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        String errorMessage = null;
        if (startDate != null && endDate != null && startDate.after(endDate)) {
            errorMessage = "End date must be greater than start date.";
        }

        List<ServiceReview> serviceReviews = null;
        if (errorMessage == null) {
            serviceReviews = serviceReviewDAO.getFilteredServiceReviews(rating, startDate, endDate, type);
        }
        List<User> users = userDAO.getAllUsers();
        request.setAttribute("users", users);
        List<Account> accounts = accountDAO.getAllAccounts();
        request.setAttribute("accounts", accounts);
        request.setAttribute("serviceReviews", serviceReviews);
        request.setAttribute("errorMessage", errorMessage);
        if (serviceReviews != null) {
            request.setAttribute("reviewCount", serviceReviews.size());
        }
  try {
            request.getRequestDispatcher("ListServiceReview.jsp").forward(request, response);
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
        processRequest(request, response);
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
