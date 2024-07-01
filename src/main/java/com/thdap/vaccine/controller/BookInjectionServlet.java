/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.InjectionScheduleDAO;
import com.thdap.vaccine.dao.UserShiftDAO;
import com.thdap.vaccine.dao.WorkLocationDAO;
import com.thdap.vaccine.dao.WorkScheduleDAO;
import com.thdap.vaccine.model.InjectionSchedule;
import com.thdap.vaccine.model.User;
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

/**
 *
 * @author Xuan Vinh
 */
@WebServlet(name = "BookInjectionServlet", urlPatterns = {"/BookInjectionServlet"})
public class BookInjectionServlet extends HttpServlet {

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
            out.println("<title>Servlet BookInjectionServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookInjectionServlet at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        int injectionScheduleID = Integer.parseInt(request.getParameter("injectionScheduleID"));
        int userID = Integer.parseInt(request.getParameter("userID"));

        InjectionScheduleDAO injectionScheduleDAO = new InjectionScheduleDAO();
        InjectionSchedule schedule = new InjectionSchedule();
        schedule.setScheduleID(injectionScheduleID);
        schedule.setUserID(userID);

        boolean isBooked = injectionScheduleDAO.bookInjection(schedule);

        if (isBooked) {
            User user = (User) request.getSession().getAttribute("user");
            WorkScheduleDAO workScheduleDAO = new WorkScheduleDAO();
            WorkSchedule workSchedule = new WorkSchedule();
            InjectionSchedule injectionSchedule = new InjectionSchedule();
            injectionSchedule = injectionScheduleDAO.getInjectionScheduleByID(injectionScheduleID);
            workSchedule = workScheduleDAO.getWorkScheduleByID(injectionSchedule.getWorkScheduleID());
            UserShiftDAO userShiftDAO = new UserShiftDAO();
            UserShift userShift = new UserShift();
            userShift = userShiftDAO.getUserShiftByUserShiftID(injectionSchedule.getUserShiftID());
            WorkLocationDAO workLocationDAO = new WorkLocationDAO();
            WorkLocation workLocation = (WorkLocation) workLocationDAO.getWorkLocationById(workSchedule.getWorkLocationID());
            SendMail.sendInjectionScheduleEmail(user.getFullName(), user.getEmail(), workSchedule.getDate(), userShift.getStartTime(), userShift.getEndTime(), workLocation.getName(), workLocation.getAddress());

            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Đặt lịch tiêm phòng thất bại");
            request.getRequestDispatcher("addInjectionSchedule.jsp").forward(request, response);
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
