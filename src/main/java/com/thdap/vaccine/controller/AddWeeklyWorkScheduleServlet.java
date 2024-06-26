/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.ConsultationScheduleDAO;
import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.InjectionScheduleDAO;
import com.thdap.vaccine.dao.RoomDAO;
import com.thdap.vaccine.dao.ShiftDAO;
import com.thdap.vaccine.dao.UserShiftDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.dao.WorkScheduleDAO;
import com.thdap.vaccine.model.ConsultationSchedule;
import com.thdap.vaccine.model.Doctor;
import com.thdap.vaccine.model.InjectionSchedule;
import com.thdap.vaccine.model.Room;
import com.thdap.vaccine.model.Shift;
import com.thdap.vaccine.model.UserShift;
import com.thdap.vaccine.model.WorkLocation;
import com.thdap.vaccine.model.WorkSchedule;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
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
        RoomDAO roomDAO = new RoomDAO();
        List<Room> rooms = roomDAO.getAllRooms();

        ShiftDAO shiftDAO = new ShiftDAO();
        List<Shift> shifts = shiftDAO.getAllShifts();

        DoctorDAO doctorDAO = new DoctorDAO();
        List<Doctor> doctors = doctorDAO.getAllDoctors();

        WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();

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
        String startDateStr = request.getParameter("startDate");
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        int shiftID = Integer.parseInt(request.getParameter("shiftID"));
        int doctorID = Integer.parseInt(request.getParameter("doctorID"));
        String workType = request.getParameter("workType");

        LocalDate startDate = LocalDate.parse(startDateStr);
        LocalDate endDateOfWeek = startDate.with(TemporalAdjusters.nextOrSame(DayOfWeek.FRIDAY)); // End on Friday
        
        if (workType.equals("1")) {
            workType = "Tiêm";
        } else {
            workType = "Tư vấn";
        }
        
        WorkScheduleDAO workScheduleDAO = new WorkScheduleDAO();
        
        for (LocalDate date = startDate; date.isBefore(endDateOfWeek.plusDays(1)); date = date.plusDays(1)) {
            // Skip Saturday and Sunday
            if (date.getDayOfWeek() == DayOfWeek.SATURDAY || date.getDayOfWeek() == DayOfWeek.SUNDAY) {
                continue;
            }

            Date sqlDate = Date.valueOf(date);
            // Kiểm tra thêm lịch làm việc có bị trùng không
            if (workScheduleDAO.workScheduleExists(roomID, shiftID, doctorID, sqlDate, workType)) {
                request.setAttribute("errorMessage", "Lịch làm việc cho bác sĩ đã tồn tại vào ngày " + sqlDate + ".");
                doGet(request, response);
                return;
            }
            // Kiểm tra thêm nếu bác sĩ đó có bị xếp trùng shift khác room hay không
            if (workScheduleDAO.isDoctorAssignedToAnotherRoom(doctorID, shiftID, sqlDate)) {
                request.setAttribute("errorMessage", "Bác sĩ đã được xếp vào Phòng khác trong ca này khác trong ngày " + sqlDate + ".");
                doGet(request, response);
                return;
            }
            // Kiểm tra xem phòng đó có bác sĩ khác làm việc trong shift đó hay không
            if (workScheduleDAO.isRoomOccupiedByAnotherDoctor(roomID, shiftID, sqlDate)) {
                request.setAttribute("errorMessage", "Phòng đã có bác sĩ khác làm việc trong ca này vào ngày " + sqlDate + ".");
                doGet(request, response);
                return;
            }
            // Kiểm tra ngày làm việc đó có phải quá khứ không
            if (sqlDate.before(new java.util.Date())) {
                request.setAttribute("errorMessage", "Không thể tạo lịch làm việc trong quá khứ vào ngày " + sqlDate + ".");
                doGet(request, response);
                return;
            }
        }
        
        for (LocalDate date = startDate; date.isBefore(endDateOfWeek.plusDays(1)); date = date.plusDays(1)) {
            // Skip Saturday and Sunday
            if (date.getDayOfWeek() == DayOfWeek.SATURDAY || date.getDayOfWeek() == DayOfWeek.SUNDAY) {
                continue;
            }

            Date sqlDate = Date.valueOf(date);

            // Create and add work schedule
            RoomDAO roomDAO = new RoomDAO();
            Room room = roomDAO.getRoomById(roomID);
            int workLocationID = room.getWorkLocationID();
            
            WorkSchedule workSchedule = new WorkSchedule(roomID, shiftID, doctorID, workLocationID, sqlDate, workType);
            workScheduleDAO.addWorkSchedule(workSchedule);
            int workScheduleID = workScheduleDAO.getWorkScheduleID(roomID, shiftID, doctorID, workLocationID, sqlDate, workType);

            if (workType.equals("Tiêm")) {
                createInjectionSchedules(workScheduleID, shiftID);
            } else if (workType.equals("Tư vấn")) {
                createConsultationSchedules(workScheduleID, shiftID);
            }
        }
//        // Loop through each day of the week (Monday to Friday) and add work schedules
//        for (LocalDate date = startDate; date.isBefore(endDateOfWeek.plusDays(1)); date = date.plusDays(1)) {
//            // Skip Saturday and Sunday
//            if (date.getDayOfWeek() == DayOfWeek.SATURDAY || date.getDayOfWeek() == DayOfWeek.SUNDAY) {
//                continue;
//            }
//
//            Date sqlDate = Date.valueOf(date);
//            // Kiểm tra thêm lịch làm việc có bị trùng không
//            if (workScheduleDAO.workScheduleExists(roomID, shiftID, doctorID, sqlDate, workType)) {
//                request.setAttribute("errorMessage", "Lịch làm việc cho bác sĩ đã tồn tại vào ngày này.");
//                doGet(request, response);
//                return;
//            }
//            // Kiểm tra thêm nếu bác sĩ đó có bị xếp trùng shift khác room hay không
//            if (workScheduleDAO.isDoctorAssignedToAnotherRoom(doctorID, shiftID, sqlDate)) {
//                request.setAttribute("errorMessage", "Bác sĩ đã được xếp vào Phòng khác trong ca này khác trong ngày này.");
//                doGet(request, response);
//                return;
//            }
//            //Kiểm tra xem phòng đó có bác sĩ khác làm việc trong shift đó hay không
//            if (workScheduleDAO.isRoomOccupiedByAnotherDoctor(roomID, shiftID, sqlDate)) {
//                request.setAttribute("errorMessage", "Phòng đã có bác sĩ khác làm việc trong ca này.");
//                doGet(request, response);
//                return;
//            }
//            //Kiểm tra ngày làm việc đó có phải quá khứ ko 
//            if (sqlDate.before(new java.util.Date())) {
//                request.setAttribute("errorMessage", "Không thể tạo lịch làm việc trong quá khứ.");
//                doGet(request, response);
//                return;
//            }
//
//            RoomDAO roomDAO = new RoomDAO();
//            Room room = roomDAO.getRoomById(roomID);
//            int workLocationID = room.getWorkLocationID();
//            
//            // Create and add work schedule
//            WorkSchedule workSchedule = new WorkSchedule(roomID, shiftID, doctorID, workLocationID, sqlDate, workType);
//            workScheduleDAO.addWorkSchedule(workSchedule);
//            int workScheduleID = workScheduleDAO.getWorkScheduleID(roomID, shiftID, doctorID, workLocationID, sqlDate, workType);
//
//            if (workType.equals("Tiêm")) {
//                createInjectionSchedules(workScheduleID, shiftID);
//            } else if (workType.equals("Tư vấn")) { 
//                createConsultationSchedules(workScheduleID, shiftID);
//            }
//        }

        response.sendRedirect("ViewWorkSchedulesServlet");
    }

    private void createConsultationSchedules(int workScheduleID, int shiftID) {
        UserShiftDAO userShiftDAO = new UserShiftDAO();
        List<UserShift> userShifts = userShiftDAO.getUserShiftsByShiftID(shiftID);

        ConsultationScheduleDAO consultationScheduleDAO = new ConsultationScheduleDAO();
        for (UserShift userShift : userShifts) {
            ConsultationSchedule consultationSchedule = new ConsultationSchedule(workScheduleID, userShift.getUserShiftID(), false);
            consultationScheduleDAO.addConsultationSchedule(consultationSchedule);
        }
    }

    private void createInjectionSchedules(int workScheduleID, int shiftID) {
        UserShiftDAO userShiftDAO = new UserShiftDAO();
        List<UserShift> userShifts = userShiftDAO.getUserShiftsByShiftID(shiftID);

        InjectionScheduleDAO injectionScheduleDAO = new InjectionScheduleDAO();
        for (UserShift userShift : userShifts) {
            InjectionSchedule injectionSchedule = new InjectionSchedule(workScheduleID, userShift.getUserShiftID(), false);
            injectionScheduleDAO.addInjectionSchedule(injectionSchedule);
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
