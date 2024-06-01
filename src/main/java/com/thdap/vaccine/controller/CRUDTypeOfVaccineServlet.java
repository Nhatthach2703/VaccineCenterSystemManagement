/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.TypeOfVaccineDAO;
import com.thdap.vaccine.dao.VaccineDAO;
import com.thdap.vaccine.model.TypeOfVaccine;
import com.thdap.vaccine.model.Vaccine;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "CRUDTypeOfVaccineServlet", urlPatterns = {"/CRUDTypeOfVaccineServlet"})
public class CRUDTypeOfVaccineServlet extends HttpServlet {

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
    TypeOfVaccineDAO typeOfVaccineDAO = new TypeOfVaccineDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {

                case "insert":
                    insertTypeOfVaccine(request, response);
                    break;
                case "delete":
                    deleteTypeOfVaccine(request, response);
                    break;
                case "list":
                    List<TypeOfVaccine> listTypes = typeOfVaccineDAO.getAllTypesOfVaccine();
                    request.setAttribute("listTypesOfVaccine", listTypes);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("CRUDTypeOfVaccine.jsp");
                    dispatcher.forward(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
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

    }

//    private void listTypesOfVaccine(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            List<TypeOfVaccine> listTypes = typeOfVaccineDAO.getAllTypesOfVaccine();
//            request.setAttribute("listTypesOfVaccine", listTypes);
//            RequestDispatcher dispatcher = request.getRequestDispatcher("CRUDTypeOfVaccine.jsp");
//            dispatcher.forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace(); // Xử lý ngoại lệ
//            // Hoặc có thể chuyển hướng đến một trang lỗi khác
//        }
//    }
    private void insertTypeOfVaccine(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        if (name == null || name.trim().isEmpty()) {
            // Set the error message as a request attribute
            request.setAttribute("errorMessage", "Vui lòng nhập thông tin");

            // Forward the request back to the form page with the error message
            response.sendRedirect("CRUDTypeOfVaccineServlet");// Replace with your actual form page
        } else {
            typeOfVaccineDAO.addTypeOfVaccine(name);
            response.sendRedirect("CRUDTypeOfVaccineServlet");
        }
    }

    private void deleteTypeOfVaccine(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int typeID = Integer.parseInt(request.getParameter("typeID"));
        typeOfVaccineDAO.deleteTypeOfVaccine(typeID);
        response.sendRedirect("CRUDTypeOfVaccineServlet");
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
