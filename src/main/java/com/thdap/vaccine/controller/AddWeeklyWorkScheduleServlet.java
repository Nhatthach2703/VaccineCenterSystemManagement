/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

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
import java.io.PrintWriter;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
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
@WebServlet(name = "AddWeeklyWorkScheduleServlet", urlPatterns = {"/AddWeeklyWorkScheduleServlet"})
public class AddWeeklyWorkScheduleServlet extends HttpServlet {

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
            out.println("<title>Servlet AddWorkScheduleByWeekServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddWorkScheduleByWeekServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();

        RoomDAO roomDAO = new RoomDAO();
        List<Room> rooms = roomDAO.getAllRooms();

        ShiftDAO shiftDAO = new ShiftDAO();
        List<Shift> shifts = shiftDAO.getAllShifts();

        DoctorDAO doctorDAO = new DoctorDAO();
        List<Doctor> doctors = doctorDAO.getAllDoctors();

        request.setAttribute("rooms", rooms);
        request.setAttribute("shifts", shifts);
        request.setAttribute("doctors", doctors);
        request.setAttribute("workLocations", workLocations);

        RequestDispatcher dispatcher = request.getRequestDispatcher("addWeeklyWorkSchedule.jsp");
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
        int weekNumber = Integer.parseInt(request.getParameter("weekNumber"));
        LocalDate startDate = LocalDate.now().with(DayOfWeek.MONDAY).plusWeeks(weekNumber);
        LocalDate endDate = startDate.plusDays(4); // Include Friday in the week
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        int shiftID = Integer.parseInt(request.getParameter("shiftID"));
        int doctorID = Integer.parseInt(request.getParameter("doctorID"));
//        int numberOfPatients = Integer.parseInt(request.getParameter("numberOfPatients"));
        int numberOfPatients = 0;

        RoomDAO roomDAO = new RoomDAO();
        Room room = roomDAO.getRoomById(roomID);
        int workLocationID = room.getWorkLocationID();

        // Create a list of days from Monday to Friday
        List<LocalDate> daysOfWeek = new ArrayList<>();
        for (LocalDate date = startDate; !date.isAfter(endDate); date = date.plusDays(1)) {
            if (date.getDayOfWeek().getValue() >= DayOfWeek.MONDAY.getValue() && date.getDayOfWeek().getValue() <= DayOfWeek.FRIDAY.getValue()) {
                daysOfWeek.add(date);
            }
        }

        // Create Work Schedule for each day in the week and add to the database
        WorkScheduleDAO workScheduleDAO = new WorkScheduleDAO();
        for (LocalDate date : daysOfWeek) {
            WorkSchedule workSchedule = new WorkSchedule(roomID, shiftID, doctorID, workLocationID, date, numberOfPatients);
            workScheduleDAO.addWorkSchedule(workSchedule);
        }

        response.sendRedirect("ViewWorkSchedulesServlet");
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
