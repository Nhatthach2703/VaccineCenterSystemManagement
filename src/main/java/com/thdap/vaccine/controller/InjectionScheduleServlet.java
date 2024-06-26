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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Xuan Vinh
 */
@WebServlet(name = "InjectionScheduleServlet", urlPatterns = {"/InjectionScheduleServlet"})
public class InjectionScheduleServlet extends HttpServlet {

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
            out.println("<title>Servlet InjectionScheduleServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InjectionScheduleServlet at " + request.getContextPath() + "</h1>");
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
        String filterDate = request.getParameter("filterDate");
        String filterWorkLocation = request.getParameter("filterWorkLocation");

        // Set default là ngày hôm nay
        if (filterDate == null || filterDate.isEmpty()) {
            filterDate = LocalDate.now().toString();
        }

        // Kiểm tra nếu filterDate là ngày trong quá khứ
        LocalDate selectedDate = LocalDate.parse(filterDate);
        if (selectedDate.isBefore(LocalDate.now())) {
            request.setAttribute("errorMessage", "Không thể xem lịch tiêm phòng cho ngày trong quá khứ.");
            request.getRequestDispatcher("addInjectionSchedule.jsp").forward(request, response);
            return;
        }

        // Lấy các danh sách dữ liệu cần thiết từ DAO
        WorkScheduleDAO workScheduleDAO = new WorkScheduleDAO();
        List<WorkSchedule> workSchedules = workScheduleDAO.getAllWorkSchedules();
        UserShiftDAO userShiftDAO = new UserShiftDAO();
        List<UserShift> userShifts = userShiftDAO.getAllUserShifts();
        RoomDAO roomDAO = new RoomDAO();
        List<Room> rooms = roomDAO.getAllRooms();
        DoctorDAO doctorDAO = new DoctorDAO();
        List<Doctor> doctors = doctorDAO.getAllDoctors();
        WorkLocationDAO workLocationDAO = new WorkLocationDAO();
        List<WorkLocation> workLocations = workLocationDAO.getAllWorkLocations();
        InjectionScheduleDAO injectionScheduleDAO = new InjectionScheduleDAO();
        List<InjectionSchedule> injectionSchedules = null;

        try {
            if (filterDate != null && !filterDate.isEmpty() && filterWorkLocation != null && !filterWorkLocation.isEmpty()) {
                injectionSchedules = injectionScheduleDAO.getInjectionSchedulesByDateAndLocation(filterDate, filterWorkLocation);
            } else if (filterDate != null && !filterDate.isEmpty()) {
                injectionSchedules = injectionScheduleDAO.getInjectionSchedulesByDate(filterDate);
            } else if (filterWorkLocation != null && !filterWorkLocation.isEmpty()) {
                injectionSchedules = injectionScheduleDAO.getInjectionSchedulesByLocation(filterWorkLocation);
            } else {
                injectionSchedules = injectionScheduleDAO.getAllInjectionSchedules();
            }

            if (injectionSchedules == null || injectionSchedules.isEmpty()) {
                request.setAttribute("filterDate", filterDate);
                request.setAttribute("filterWorkLocation", filterWorkLocation);
                request.setAttribute("workLocations", workLocations);
                request.setAttribute("errorMessage", "Không có lịch tiêm phòng nào phù hợp theo các tiêu chí bạn chọn!");
                request.getRequestDispatcher("addInjectionSchedule.jsp").forward(request, response);
                return;
            }

            // Đặt các danh sách vào request để truyền cho JSP
            request.setAttribute("filterDate", filterDate);
            request.setAttribute("filterWorkLocation", filterWorkLocation);
            request.setAttribute("injectionSchedules", injectionSchedules);
            request.setAttribute("workSchedules", workSchedules);
            request.setAttribute("userShifts", userShifts);
            request.setAttribute("rooms", rooms);
            request.setAttribute("doctors", doctors);
            request.setAttribute("workLocations", workLocations);
            request.getRequestDispatcher("addInjectionSchedule.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
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
