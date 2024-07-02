/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.thdap.vaccine.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.thdap.vaccine.dao.ConsultationScheduleDAO;
import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.InjectionScheduleDAO;
import com.thdap.vaccine.dao.RoomDAO;
import com.thdap.vaccine.dao.ShiftDAO;
import com.thdap.vaccine.dao.UserDAO;
import com.thdap.vaccine.dao.UserShiftDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.dao.WorkScheduleDAO;
import com.thdap.vaccine.model.ConsultationSchedule;
import com.thdap.vaccine.model.Doctor;
import com.thdap.vaccine.model.InjectionSchedule;
import com.thdap.vaccine.model.Room;
import com.thdap.vaccine.model.Shift;
import com.thdap.vaccine.model.User;
import com.thdap.vaccine.model.UserShift;
import com.thdap.vaccine.model.WorkLocation;
import com.thdap.vaccine.model.WorkSchedule;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name="viewWorkSchedulesDoctorServlet", urlPatterns={"/viewWorkSchedulesDoctorServlet"})
public class viewWorkSchedulesDoctorServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
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
 WorkScheduleDAO workScheduleDAO = new WorkScheduleDAO();
    List<WorkSchedule> workSchedules = workScheduleDAO.getAllWorkSchedules();
    DoctorDAO doctorDAO = new DoctorDAO();
    List<Doctor> doctors = doctorDAO.getAllDoctors_1();
    RoomDAO roomDAO = new RoomDAO();
    List<Room> rooms = roomDAO.getAllRooms();
    ShiftDAO shiftDAO = new ShiftDAO();
    List<Shift> shifts = shiftDAO.getAllShifts();
    WorkLocationDAO workLocationDAO = new WorkLocationDAO();
    List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();
    UserShiftDAO userShiftDAO = new UserShiftDAO();
    List<UserShift> userShifts = userShiftDAO.getAllUserShifts();
    InjectionScheduleDAO injectionScheduleDAO = new InjectionScheduleDAO();
    List<InjectionSchedule> injectionSchedules = injectionScheduleDAO.getAllInjectionSchedules();
    ConsultationScheduleDAO consultationScheduleDAO = new ConsultationScheduleDAO();
    List<ConsultationSchedule> consultationSchedules = consultationScheduleDAO.getAllConsultationSchedules();
    UserDAO userDAO = new UserDAO();
    List<User> users = userDAO.getAllUsers();

    ObjectMapper objectMapper = new ObjectMapper();
    objectMapper.registerModule(new JavaTimeModule());

    // Convert objects to JSON
    String work_Schedules = objectMapper.writeValueAsString(workSchedules);
    String doctor = objectMapper.writeValueAsString(doctors);
    String room = objectMapper.writeValueAsString(rooms);
    String shift = objectMapper.writeValueAsString(shifts);
    String workLocation = objectMapper.writeValueAsString(workLocations);
    String userShift  = objectMapper.writeValueAsString(userShifts);
    String injection_Schedules = objectMapper.writeValueAsString(injectionSchedules);
    String consultation_Schedules = objectMapper.writeValueAsString(consultationSchedules);
    String user = objectMapper.writeValueAsString(users);

    // Set attributes
    request.setAttribute("workSchedules", work_Schedules);
    request.setAttribute("doctors", doctors);
    request.setAttribute("rooms", rooms);
    request.setAttribute("shifts", shift);
    request.setAttribute("room", room);
    request.setAttribute("workLocation", workLocation);
    request.setAttribute("userShift", userShift);
    request.setAttribute("injectionSchedules", injection_Schedules);
    request.setAttribute("consultationSchedules", consultation_Schedules);
    request.setAttribute("user", user);

    RequestDispatcher dispatcher = request.getRequestDispatcher("viewWorkSchedulesDoctor.jsp");
    dispatcher.forward(request, response);
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
