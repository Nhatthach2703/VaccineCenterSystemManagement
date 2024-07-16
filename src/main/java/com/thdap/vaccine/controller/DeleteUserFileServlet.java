/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.InjectionInfoDAO;
import com.thdap.vaccine.dao.NotificationsDAO;
import com.thdap.vaccine.dao.UserFileDAO;
import com.thdap.vaccine.model.InjectionInfo;
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
@WebServlet(name = "DeleteUserFileServlet", urlPatterns = {"/DeleteUserFileServlet"})
public class DeleteUserFileServlet extends HttpServlet {

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
            out.println("<title>Servlet DeleteUserFileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteUserFileServlet at " + request.getContextPath() + "</h1>");
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
        String userFileIDParam = request.getParameter("userFileID");
        String userIDParam = request.getParameter("userID");
        UserFileDAO userFileDAO = new UserFileDAO();
        InjectionInfoDAO injectionInfoDAO = new InjectionInfoDAO();
        NotificationsDAO notificationsDAO = new NotificationsDAO();
        
        if (userFileIDParam != null && !userFileIDParam.isEmpty() && userIDParam != null && !userIDParam.isEmpty()) {
            try {
                int userFileID = Integer.parseInt(userFileIDParam);
                int userID = Integer.parseInt(userIDParam);
                
                List<InjectionInfo> injectionInfos = injectionInfoDAO.getInjectionInfosByUserFileID(userFileID);

                boolean allNotificationsDeleted = true;

                for (InjectionInfo injectionInfo : injectionInfos) {
                    boolean notificationDeleted = notificationsDAO.deleteNotificationByInjectionInfoID(injectionInfo.getInjectionInfoID());
                    if (!notificationDeleted) {
                        allNotificationsDeleted = false;
                    }
                }

                boolean injectionInfoDeleted = injectionInfoDAO.deleteInjectionInfoByUserFileID(userFileID);

                boolean userFileDeleted = userFileDAO.deleteUserFile(userFileID);

                if (userFileDeleted && injectionInfoDeleted && allNotificationsDeleted) {
//                    request.setAttribute("errorMessage", "Hồ sơ bệnh án và các thông tin liên quan đã được xóa thành công.");
                } else {
//                    request.setAttribute("errorMessage", "Xóa hồ sơ bệnh án thất bại. Vui lòng thử lại.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Tham số không hợp lệ. Vui lòng thử lại.");
            }
        } else {
            request.setAttribute("errorMessage", "Tham số không hợp lệ. Vui lòng thử lại.");
        }

        response.sendRedirect("listUsers?searchTerm=&searchType=fullname");
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
