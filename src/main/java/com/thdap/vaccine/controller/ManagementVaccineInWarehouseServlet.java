/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.TypeOfVaccineDAO;
import com.thdap.vaccine.dao.VaccineDAO;
import com.thdap.vaccine.dao.VaccineWarehouseDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.model.TypeOfVaccine;
import com.thdap.vaccine.model.Vaccine;
import com.thdap.vaccine.model.VaccineWarehouse;
import com.thdap.vaccine.model.WorkLocation;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Xuan Vinh
 */
@WebServlet(name = "ManagementVaccineInWarehouseServlet", urlPatterns = {"/ManagementVaccineInWarehouseServlet"})
public class ManagementVaccineInWarehouseServlet extends HttpServlet {

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
            out.println("<title>Servlet ManagementVaccineInWarehouseServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagementVaccineInWarehouseServlet at " + request.getContextPath() + "</h1>");
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
        VaccineWarehouseDAO vaccineWarehouseDAO = new VaccineWarehouseDAO();
        VaccineDAO vaccineDAO = new VaccineDAO();
        WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        TypeOfVaccineDAO typeOfVaccineDAO = new TypeOfVaccineDAO();
                
        String workLocationId = request.getParameter("workLocationId");
        
        List<VaccineWarehouse> warehouses = vaccineWarehouseDAO.getAll();
        List<Vaccine> vaccines = vaccineDAO.getAllVaccines();
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();
        List<TypeOfVaccine> typeOfVaccines = typeOfVaccineDAO.getAllTypesOfVaccine();

        request.setAttribute("warehouses", warehouses);
        request.setAttribute("vaccines", vaccines);
        request.setAttribute("workLocations", workLocations);
        request.setAttribute("typeOfVaccines", typeOfVaccines);
        
        if (workLocationId == null || workLocationId.isEmpty()){
            response.sendRedirect("ManagementVaccineInWarehouseServlet?workLocationId=1");
        }else{
            request.getRequestDispatcher("managementVaccineInWarehouse.jsp").forward(request, response);
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
        doGet(request, response);
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
