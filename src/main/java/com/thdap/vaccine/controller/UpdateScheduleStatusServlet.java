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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Xuan Vinh
 */
@WebServlet(name = "UpdateScheduleStatusServlet", urlPatterns = {"/UpdateScheduleStatusServlet"})
public class UpdateScheduleStatusServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateScheduleStatusServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateScheduleStatusServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        InjectionScheduleDAO injectionScheduleDAO = new InjectionScheduleDAO();
        ConsultationScheduleDAO consultationScheduleDAO = new ConsultationScheduleDAO();
        int scheduleID = Integer.parseInt(request.getParameter("scheduleID"));
        String workType = request.getParameter("workType");
        UserDAO userDAO = new UserDAO();
        boolean success = false;
        String message = "";

        try {
            if ("Tiêm".equalsIgnoreCase(workType)) {
                InjectionSchedule injectionSchedule = injectionScheduleDAO.getInjectionScheduleByID(scheduleID);
                if (injectionSchedule != null) {
                    injectionSchedule.setStatus(true);
                    success = injectionScheduleDAO.updateInjectionScheduleStatus(injectionSchedule);
                    if (success) {
                        User user = userDAO.findUserByID(injectionSchedule.getUserID());
                        if (user != null) {
                            SendMail.sendReviewInjectionEmail(user.getEmail(), user.getUserID());
                            
                        }
                    }
                }
            } else if ("Tư vấn".equalsIgnoreCase(workType)) {
                ConsultationSchedule consultationSchedule = consultationScheduleDAO.getConsultationScheduleByID(scheduleID);
                if (consultationSchedule != null) {
                    consultationSchedule.setStatus(true);
                    success = consultationScheduleDAO.updateConsultationScheduleStatus(consultationSchedule);
                    if (success) {
                     
                        User user = userDAO.findUserByID(consultationSchedule.getUserID());
                        if (user != null) {
                            SendMail.sendReviewConsultationEmail(user.getEmail(), user.getUserID());
                            
                        }
                    }
                }
           
            }
            if (success) {
                message = "Cập nhật thành công!";
                // Viết hàm gửi Email để đánh giá!
            } else {
                message = "Cập nhật thất bại!";
            }
        } catch (Exception e) {
            message = "Có lỗi xảy ra trong quá trình xử lý: " + e.getMessage();
            success = false;
        }

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
        List<InjectionSchedule> injectionSchedules = injectionScheduleDAO.getAllInjectionSchedules();
        List<ConsultationSchedule> consultationSchedules = consultationScheduleDAO.getAllConsultationSchedules();
        
        List<User> users = userDAO.getAllUsers();

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());

        // Convert objects to JSON
        String work_Schedules = objectMapper.writeValueAsString(workSchedules);
        String doctor = objectMapper.writeValueAsString(doctors);
        String room = objectMapper.writeValueAsString(rooms);
        String shift = objectMapper.writeValueAsString(shifts);
        String workLocation = objectMapper.writeValueAsString(workLocations);
        String userShift = objectMapper.writeValueAsString(userShifts);
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

//        request.setAttribute("success", success);
//        request.setAttribute("message", message);
        request.getRequestDispatcher("viewWorkSchedulesDoctor.jsp").forward(request, response);

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
