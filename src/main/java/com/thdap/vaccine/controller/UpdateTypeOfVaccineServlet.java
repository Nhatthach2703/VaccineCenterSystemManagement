/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.TypeOfVaccineDAO;
import com.thdap.vaccine.model.TypeOfVaccine;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "UpdateTypeOfVaccineServlet", urlPatterns = {"/UpdateTypeOfVaccineServlet"})
public class UpdateTypeOfVaccineServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String idString = request.getParameter("typeID");
        String errorMessage = (String) request.getSession().getAttribute("errorMessage");

        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            // Remove the error message from the session
            request.getSession().removeAttribute("errorMessage");
        }

        try {
            int id = Integer.parseInt(idString);
            TypeOfVaccine v = typeOfVaccineDAO.getTypeOfVaccine(id);
            request.setAttribute("typeOfVaccine", v);
            request.getRequestDispatcher("UpdateTypeOfVaccine.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Log the error and set an error message
            Logger.getLogger(UpdateTypeOfVaccineServlet.class.getName()).log(Level.SEVERE, null, e);
            request.setAttribute("errorMessage", "Invalid type ID format.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (SQLException ex) {
            // Log the error and set an error message
            Logger.getLogger(UpdateTypeOfVaccineServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "Database error: " + ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception ex) {
            // Log any other unexpected errors and set an error message
            Logger.getLogger(UpdateTypeOfVaccineServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMessage", "An unexpected error occurred: " + ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
    TypeOfVaccineDAO typeOfVaccineDAO = new TypeOfVaccineDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");  // Ensure request encoding is set to UTF-8

        String typeIDStr = request.getParameter("typeID");
        String name = request.getParameter("name");

        if (typeIDStr == null || name == null || typeIDStr.isEmpty() || name.isEmpty()) {
            request.getSession().setAttribute("errorMessage", "TypeID and Name are required fields.");
            response.sendRedirect("UpdateTypeOfVaccineServlet?typeID=" + typeIDStr);
            return;
        }

        try {
            if (typeOfVaccineDAO.isTypeOfVaccineExists(name)) {
                request.getSession().setAttribute("errorMessage", "Tên vaccine đã tồn tại");
                response.sendRedirect("UpdateTypeOfVaccineServlet?typeID=" + typeIDStr);
                return;
            }

            int typeID = Integer.parseInt(typeIDStr);
            typeOfVaccineDAO.updateTypeOfVaccine(typeID, name);
            request.getSession().setAttribute("successMessage", "Vaccine type updated successfully.");
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("errorMessage", "Invalid TypeID format.");
            response.sendRedirect("UpdateTypeOfVaccineServlet?typeID=" + typeIDStr);
            return;
        } catch (SQLException ex) {
            Logger.getLogger(UpdateTypeOfVaccineServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.getSession().setAttribute("errorMessage", "Database error: " + ex.getMessage());
            response.sendRedirect("UpdateTypeOfVaccineServlet?typeID=" + typeIDStr);
            return;
        } catch (Exception e) {
            Logger.getLogger(UpdateTypeOfVaccineServlet.class.getName()).log(Level.SEVERE, null, e);
            request.getSession().setAttribute("errorMessage", "An error occurred while updating the vaccine type.");
            response.sendRedirect("UpdateTypeOfVaccineServlet?typeID=" + typeIDStr);
            return;
        }

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
