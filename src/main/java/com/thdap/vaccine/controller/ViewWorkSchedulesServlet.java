/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.RoomDAO;
import com.thdap.vaccine.dao.ShiftDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.dao.WorkScheduleDAO;
import com.thdap.vaccine.model.Doctor;
import com.thdap.vaccine.model.Room;
import com.thdap.vaccine.model.Shift;
import com.thdap.vaccine.model.WorkLocation;
import com.thdap.vaccine.model.WorkSchedule;
import java.io.IOException;
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
@WebServlet(name = "ViewWorkSchedulesServlet", urlPatterns = {"/ViewWorkSchedulesServlet"})
public class ViewWorkSchedulesServlet extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ViewWorkSchedulesServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ViewWorkSchedulesServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }

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

        WorkScheduleDAO workScheduleDAO = new WorkScheduleDAO();
        List<WorkSchedule> workSchedules = workScheduleDAO.getAllWorkSchedules();////
        DoctorDAO doctorDAO = new DoctorDAO();
        List<Doctor> doctors = doctorDAO.getAllDoctors_1();
        RoomDAO roomDAO = new RoomDAO();
        List<Room> rooms = roomDAO.getAllRooms();
        ShiftDAO shiftDAO = new ShiftDAO();
        List<Shift> shifts = shiftDAO.getAllShifts();
        WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());

// Sử dụng ObjectMapper để chuyển đổi đối tượng sang JSON
        String work_Schedules = objectMapper.writeValueAsString(workSchedules);
        String doctor = objectMapper.writeValueAsString(doctors);
        String room = objectMapper.writeValueAsString(rooms);
        String shift = objectMapper.writeValueAsString(shifts);
        String workLocation = objectMapper.writeValueAsString(workLocations);
        request.setAttribute("workSchedules", work_Schedules);//
        request.setAttribute("workSchedule", workSchedules);//
        request.setAttribute("doctors", doctors);
        request.setAttribute("rooms", rooms);
        request.setAttribute("shifts", shifts);
        request.setAttribute("workLocations", workLocations);
        request.setAttribute("doctor", doctor);
        request.setAttribute("room", room);
        request.setAttribute("shift", shift);
        request.setAttribute("workLocation", workLocation);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewWorkSchedules.jsp");
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
