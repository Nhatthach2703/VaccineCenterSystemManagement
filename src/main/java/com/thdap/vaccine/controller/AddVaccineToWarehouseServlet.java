/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.VaccineDAO;
import com.thdap.vaccine.dao.VaccineWarehouseDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.model.Vaccine;
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
@WebServlet(name = "AddVaccineToWarehouseServlet", urlPatterns = {"/AddVaccineToWarehouseServlet"})
public class AddVaccineToWarehouseServlet extends HttpServlet {

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
            out.println("<title>Servlet AddVaccineToWarehouseServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddVaccineToWarehouseServlet at " + request.getContextPath() + "</h1>");
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
        VaccineDAO vaccineDAO = new VaccineDAO();
        List<Vaccine> vaccines = vaccineDAO.getVaccineDontHaveToOrder();
        WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();
        
        request.setAttribute("vaccines", vaccines);
        request.setAttribute("workLocations", workLocations);
        request.getRequestDispatcher("addVaccineToWarehouse.jsp").forward(request, response);
    
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
        int vaccineID  = Integer.parseInt(request.getParameter("vaccineID"));
        int workLocationID = Integer.parseInt(request.getParameter("workLocationID"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        VaccineDAO vaccineDAO = new VaccineDAO();
        List<Vaccine> vaccines = vaccineDAO.getVaccineDontHaveToOrder();
        Vaccine vaccine = vaccineDAO.getVaccineById(vaccineID);
        WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();
        WorkLocation workLocation = workLocationDAO.getWorkLocationById(workLocationID);
        
        VaccineWarehouseDAO vaccineWarehouseDAO = new VaccineWarehouseDAO();
        
        boolean vaccineExists = vaccineWarehouseDAO.vaccineExistsInWarehouse(vaccineID, workLocationID);
        
        if (vaccineExists) {
            request.setAttribute("vaccineID", vaccineID);
            request.setAttribute("workLocationID", workLocationID);
            request.setAttribute("quantity", quantity);
            request.setAttribute("vaccines", vaccines);
            request.setAttribute("workLocations", workLocations);
            request.setAttribute("errorMessage", "Vaccine " + vaccine.getName() + " đã tồn tại trong kho của " + workLocation.getName()+"!");
            request.getRequestDispatcher("addVaccineToWarehouse.jsp").forward(request, response);
        } else {
            boolean isSuccess = vaccineWarehouseDAO.addVaccineToWarehouse(vaccineID, workLocationID, quantity);
            if (isSuccess) {
                response.sendRedirect("ManagementVaccineInWarehouseServlet?workLocationId="+workLocationID);
            } else {
                request.setAttribute("vaccineID", vaccineID);
                request.setAttribute("workLocationID", workLocationID);
                request.setAttribute("quantity", quantity);
                request.setAttribute("vaccines", vaccines);
                request.setAttribute("workLocations", workLocations);
                request.setAttribute("errorMessage", "Thêm vaccine vào kho thất bại!");
                request.getRequestDispatcher("addVaccineToWarehouse.jsp").forward(request, response);
            }
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
