/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.AccountDAO;
import com.thdap.vaccine.model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Base64;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
@WebServlet(name = "NewPassServlet", urlPatterns = {"/NewPassServlet"})
public class NewPassServlet extends HttpServlet {

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
            out.println("<title>Servlet NewPassServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewPassServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
//        processRequest(request, response);
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        //Base64.Encoder encoder = Base64.getEncoder();

        
        AccountDAO accountDAO = new AccountDAO();

        //String encodePass = encoder.encodeToString(newPassword.getBytes());
        String email = (String) session.getAttribute("email");
        Account account = new Account();
        account = accountDAO.getAccountEmail(email);
        
        if (newPassword == null || confPassword == null || !newPassword.equals(confPassword)) {
            request.setAttribute("tbsubmit", "Mật khẩu không giống nhau!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("newPassword.jsp");
            dispatcher.forward(request, response);
            return;
        }
        
        if(newPassword.equals(account.getPassword()) || confPassword.equals(account.getPassword())){
            request.setAttribute("tbsubmit", "Mật khẩu mới không đưuọc giống mật khẩu cũ!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("newPassword.jsp");
            dispatcher.forward(request, response);
            return;
        }
        
        boolean isUpdated = accountDAO.updatePassword(email, confPassword);

        RequestDispatcher dispatcher;
        if (isUpdated) {
            request.setAttribute("status", "resetSuccess");
            dispatcher = request.getRequestDispatcher("login.jsp");
        } else {
            request.setAttribute("status", "Đặt lại không thành công");
            dispatcher = request.getRequestDispatcher("newPassword.jsp");
        }
        dispatcher.forward(request, response);
    
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
