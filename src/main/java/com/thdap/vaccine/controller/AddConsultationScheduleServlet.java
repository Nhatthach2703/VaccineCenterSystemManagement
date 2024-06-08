/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.ConsultationScheduleDAO;
import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.RoomDAO;
import com.thdap.vaccine.dao.ShiftDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.model.Doctor;
import com.thdap.vaccine.model.Room;
import com.thdap.vaccine.model.Shift;
import com.thdap.vaccine.model.User;
import com.thdap.vaccine.model.WorkLocation;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Xuan Vinh
 */
@WebServlet(name = "AddConsultationScheduleServlet", urlPatterns = {"/AddConsultationScheduleServlet"})
public class AddConsultationScheduleServlet extends HttpServlet {

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
            out.println("<title>Servlet AddConsultationScheduleServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddConsultationScheduleServlet at " + request.getContextPath() + "</h1>");
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
        WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();

        ShiftDAO shiftDAO = new ShiftDAO();
        List<Shift> shifts = shiftDAO.getAllShifts();

        request.setAttribute("shifts", shifts);
        request.setAttribute("workLocations", workLocations);

        RequestDispatcher dispatcher = request.getRequestDispatcher("addConsultationSchedule.jsp");
        dispatcher.forward(request, response);
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
        int userID = Integer.parseInt(request.getParameter("userID"));
        int workLocationID = Integer.parseInt(request.getParameter("workLocationID"));
        int shiftID = Integer.parseInt(request.getParameter("shiftID"));
        Date date = Date.valueOf(request.getParameter("date"));
        
        
        
        ConsultationScheduleDAO consultationScheduleDAO = new ConsultationScheduleDAO();
        boolean isInserted = consultationScheduleDAO.insertConsultationSchedule(userID, workLocationID, shiftID, date);

        if (isInserted) {
            User user = (User) request.getSession().getAttribute("user");
            ShiftDAO shiftDAO = new ShiftDAO();
            Shift shift = (Shift) shiftDAO.getShiftById(shiftID);
            WorkLocationDAO workLocationDAO = new  WorkLocationDAO();
            WorkLocation workLocation = (WorkLocation) workLocationDAO.getWorkLocationById(workLocationID);
//            response.sendRedirect("ViewConsultationSchedulesServlet");
            SendMail.sendConsultationScheduleEmail(user.getEmail(), date, shift.getStartTime(), shift.getEndTime(), workLocation.getName(), workLocation.getAddress());
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("message", "Đặt lịch tư vấn thất bại");
            request.getRequestDispatcher("addConsultationSchedule.jsp").forward(request, response);
        }

//        response.sendRedirect("ViewConsultationSchedulesServlet");
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
