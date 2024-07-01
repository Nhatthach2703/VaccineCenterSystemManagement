/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.InjectionScheduleDAO;
import com.thdap.vaccine.dao.RoomDAO;
import com.thdap.vaccine.dao.UserShiftDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.dao.WorkScheduleDAO;
import com.thdap.vaccine.model.Doctor;
import com.thdap.vaccine.model.InjectionSchedule;
import com.thdap.vaccine.model.Room;
import com.thdap.vaccine.model.UserShift;
import com.thdap.vaccine.model.WorkLocation;
import com.thdap.vaccine.model.WorkSchedule;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Comparator;
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
@WebServlet(name = "ViewInjectionSchedulesServlet", urlPatterns = {"/ViewInjectionSchedulesServlet"})
public class ViewInjectionSchedulesServlet extends HttpServlet {

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
            out.println("<title>Servlet ViewInjectionSchedulesServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewInjectionSchedulesServlet at " + request.getContextPath() + "</h1>");
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
        int userID = Integer.parseInt(request.getParameter("userID"));
        WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();
        WorkScheduleDAO workScheduleDAO = new WorkScheduleDAO();
        List<WorkSchedule> workSchedules = workScheduleDAO.getAllWorkSchedules();
        UserShiftDAO userShiftDAO = new UserShiftDAO();
        List<UserShift> userShifts = userShiftDAO.getAllUserShifts();
        RoomDAO roomDAO = new RoomDAO();
        List<Room> rooms = roomDAO.getAllRooms();
        DoctorDAO doctorDAO = new DoctorDAO();
        List<Doctor> doctors = doctorDAO.getAllDoctors();
        InjectionScheduleDAO injectionScheduleDAO = new InjectionScheduleDAO();
        List<InjectionSchedule> injectionSchedules = injectionScheduleDAO.getInjectionSchedulesByUserID(userID);

        // Sort injectionSchedules theo ngày giảm dần
        Collections.sort(injectionSchedules, new Comparator<InjectionSchedule>() {
            @Override
            public int compare(InjectionSchedule is1, InjectionSchedule is2) {
                // Get dates of WorkSchedules corresponding to is1 and is2
                WorkSchedule ws1 = workScheduleDAO.getWorkScheduleByID(is1.getWorkScheduleID());
                WorkSchedule ws2 = workScheduleDAO.getWorkScheduleByID(is2.getWorkScheduleID());

                // Sort descending based on dates
                return ws2.getDate().compareTo(ws1.getDate());
            }
        });

        request.setAttribute("workLocations", workLocations);
        request.setAttribute("workSchedules", workSchedules);
        request.setAttribute("userShifts", userShifts);
        request.setAttribute("rooms", rooms);
        request.setAttribute("doctors", doctors);
        request.setAttribute("injectionSchedules", injectionSchedules);
        request.getRequestDispatcher("viewInjectionSchedules.jsp").forward(request, response);
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
