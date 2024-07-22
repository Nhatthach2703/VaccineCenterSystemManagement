/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.WorkScheduleDAO;
import com.thdap.vaccine.model.Doctor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
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
@WebServlet(name = "doctorIndexServlet", urlPatterns = {"/doctorIndexServlet"})
public class doctorIndexServlet extends HttpServlet {

    private WorkScheduleDAO workScheduleDAO;
    private DoctorDAO doctorDAO;

    public doctorIndexServlet() {
        this.workScheduleDAO = new WorkScheduleDAO();
        this.doctorDAO = new DoctorDAO();

    }

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
            out.println("<title>Servlet doctorIndexServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet doctorIndexServlet at " + request.getContextPath() + "</h1>");
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
    try {
        HttpSession session = request.getSession();
        Doctor doctor = (Doctor) session.getAttribute("doctor");
        Integer loggedInDoctorID = doctor.getDoctorID();

        if (loggedInDoctorID == null) {
            throw new ServletException("Doctor ID not found in session.");
        }

        List<Doctor> doctors = doctorDAO.getAllDoctors();

        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        if (startDateStr == null || endDateStr == null) {
            Calendar calendar = Calendar.getInstance();
            calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
            Date startDate = new Date(calendar.getTimeInMillis());
            startDateStr = startDate.toString();

            calendar.add(Calendar.DAY_OF_WEEK, 6);
            Date endDate = new Date(calendar.getTimeInMillis());
            endDateStr = endDate.toString();
        }

        Date startDate = Date.valueOf(startDateStr);
        Date endDate = Date.valueOf(endDateStr);

        int totalVaccinations = workScheduleDAO.getTotalVaccinationsByDoctorAndDateRangeForDoctor(loggedInDoctorID, startDate, endDate);
        int totalConsultations = workScheduleDAO.getTotalConsultationsByDoctorAndDateRangeForDoctor(loggedInDoctorID, startDate, endDate);

        request.setAttribute("totalVaccinations", totalVaccinations);
        request.setAttribute("totalConsultations", totalConsultations);
        request.setAttribute("startDate", startDateStr);
        request.setAttribute("endDate", endDateStr);

        request.getRequestDispatcher("DoctorIndex.jsp").forward(request, response);
    } catch (Exception e) {
        throw new ServletException("Error processing request", e);
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
