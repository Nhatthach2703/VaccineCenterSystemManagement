/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.OrderVaccineInfoDAO;
import com.thdap.vaccine.dao.WorkScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="doctorIndexServlet", urlPatterns={"/doctorIndexServlet"})
public class doctorIndexServlet extends HttpServlet {
    private OrderVaccineInfoDAO orderVaccineInfoDAO;
    private WorkScheduleDAO workScheduleDAO;
    
     @Override
    public void init() throws ServletException {
        // Initialize DAOs
        orderVaccineInfoDAO = new OrderVaccineInfoDAO();
        workScheduleDAO = new WorkScheduleDAO();
    }
   
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
            out.println("<title>Servlet doctorIndexServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet doctorIndexServlet at " + request.getContextPath () + "</h1>");
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("DoctorIndex.jsp").forward(request, response);
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
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        LocalDate startDate = LocalDate.parse(startDateStr);
        LocalDate endDate = LocalDate.parse(endDateStr);

        // Assuming workLocationIDs are known
       
        // Call method to get total prices for each work location within the date range
        double totalPrice1 = orderVaccineInfoDAO.getTotalPriceByWorkLocationAndDateRange(1, startDate, endDate);
        double totalPrice2 = orderVaccineInfoDAO.getTotalPriceByWorkLocationAndDateRange(2, startDate, endDate);

        int totalVaccinations1 = workScheduleDAO.getTotalVaccinationsByWorkLocationAndDateRange(1,
                Date.valueOf(startDate), Date.valueOf(endDate));
        int totalVaccinations2 = workScheduleDAO.getTotalVaccinationsByWorkLocationAndDateRange(2,
                Date.valueOf(startDate), Date.valueOf(endDate));

        int totalConsultations1 = workScheduleDAO.getTotalConsultationsByWorkLocationAndDateRange(1,
                Date.valueOf(startDate), Date.valueOf(endDate));
        int totalConsultations2 = workScheduleDAO.getTotalConsultationsByWorkLocationAndDateRange(2,
                Date.valueOf(startDate), Date.valueOf(endDate));

        int confirmedOrders1 = orderVaccineInfoDAO.countConfirmedOrdersByWorkLocationAndDateRange(1, startDate, endDate );
        int confirmedOrders2 = orderVaccineInfoDAO.countConfirmedOrdersByWorkLocationAndDateRange(2, startDate, endDate);

        // Store results in request attributes to forward to JSP
        request.setAttribute("totalPrice1", totalPrice1);
        request.setAttribute("totalPrice2", totalPrice2);

        request.setAttribute("totalVaccinations1", totalVaccinations1);
        request.setAttribute("totalVaccinations2", totalVaccinations2);
        request.setAttribute("totalConsultations1", totalConsultations1);
        request.setAttribute("totalConsultations2", totalConsultations2);

        request.setAttribute("confirmedOrders1", confirmedOrders1);
        request.setAttribute("confirmedOrders2", confirmedOrders2);

        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);

        request.getRequestDispatcher("DoctorIndex.jsp").forward(request, response);
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
