/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.OrderVaccineInfoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Xuan Vinh
 */
@WebServlet(name = "ReturnPaymentServlet", urlPatterns = {"/ReturnPaymentServlet"})
public class ReturnPaymentServlet extends HttpServlet {

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
            out.println("<title>Servlet ReturnPaymentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReturnPaymentServlet at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer orderInfoID = (Integer)session.getAttribute("orderInfoID");
        String orderInfoIDStr = orderInfoID.toString();
                
        // Get parameters from URL
        String code = request.getParameter("code");
        String id = request.getParameter("id");
        String cancel = request.getParameter("cancel");
        String status = request.getParameter("status");
        String orderCode = request.getParameter("orderCode");
        String paymentLinkId = (String) session.getAttribute("paymentLinkId");
        // Print parameter values for debugging
        System.out.println("code: " + code);
        System.out.println("id: " + id);
        System.out.println("cancel: " + cancel);
        System.out.println("status: " + status);
        System.out.println("orderCode: " + orderCode);

        // Print session details
        System.out.println("Session - orderInfoID: " + orderInfoID);
        System.out.println("Session - pay mentLinkId: " + paymentLinkId);

        // Check if all parameters match // && paymentLinkId.equals(id) 
        if ("00".equals(code) && "false".equals(cancel) && "PAID".equals(status) && orderInfoIDStr.equals(orderCode)) {
            OrderVaccineInfoDAO orderDao = new OrderVaccineInfoDAO();
            orderDao.updatePaymentStatusByID(orderInfoID, "PAID");
        }
        
        Cookie[] cookies = request.getCookies();

        // Check if the cookie array is not null
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("checkoutUrl".equals(cookie.getName())) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    break;
                }
            }
        }
        
        //Remove all reservation related session
        session.removeAttribute("orderInfoID");
        session.removeAttribute("checkoutUrl");
        session.removeAttribute("paymentLinkId");
        //Redirect to cancel successful page!
        response.sendRedirect("paymentSuccess.jsp");
        return;
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
