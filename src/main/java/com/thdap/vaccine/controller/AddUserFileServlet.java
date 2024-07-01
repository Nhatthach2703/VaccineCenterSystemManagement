/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.UserFileDAO;
import com.thdap.vaccine.model.UserFile;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Xuan Vinh
 */
@WebServlet(name = "AddUserFileServlet", urlPatterns = {"/AddUserFileServlet"})
public class AddUserFileServlet extends HttpServlet {

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
            out.println("<title>Servlet AddUserFileServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserFileServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        UserFileDAO userFileDAO = new UserFileDAO();
        String userIDStr = request.getParameter("userID");
        String healthInsuranceCardNumber = request.getParameter("healthInsuranceCardNumber");
        String bloodType = request.getParameter("bloodType");
        String medicalHistory = request.getParameter("medicalHistory");
        String historyOfDrugAllergies = request.getParameter("historyOfDrugAllergies");

        // Validating the userID input
        int userID = 0;
        try {
            userID = Integer.parseInt(userIDStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid userID");
            request.getRequestDispatcher("addUserFile.jsp").forward(request, response);
            return;
        }

        if (userFileDAO.isHealthInsuranceCardNumberExists(healthInsuranceCardNumber)) {
            request.setAttribute("userID", userID);
            request.setAttribute("healthInsuranceCardNumber", healthInsuranceCardNumber);
            request.setAttribute("bloodType", bloodType);
            request.setAttribute("medicalHistory", medicalHistory);
            request.setAttribute("historyOfDrugAllergies", historyOfDrugAllergies);
            request.setAttribute("errorMessage", "Thẻ bảo hiểm xã hội đã tồn tại, vui lòng nhập lại!");
            request.getRequestDispatcher("addUserFile.jsp").forward(request, response);
            return;
        }

        UserFile userFile = new UserFile();
        userFile.setUserID(userID);
        userFile.setHealthInsuranceCardNumber(healthInsuranceCardNumber);
        userFile.setBloodType(bloodType);
        userFile.setMedicalHistory(medicalHistory);
        userFile.setHistoryOfDrugAllergies(historyOfDrugAllergies);

        boolean isInserted = userFileDAO.addUserFile(userFile);

        if (isInserted) {
            response.sendRedirect("ViewUserFilesServlet");
        } else {
            request.setAttribute("errorMessage", "Thêm hồ sơ bệnh nhân thất bại");
            request.getRequestDispatcher("addUserFile.jsp").forward(request, response);
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
