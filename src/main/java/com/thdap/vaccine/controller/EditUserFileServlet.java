/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.InjectionInfoDAO;
import com.thdap.vaccine.dao.NotificationsDAO;
import com.thdap.vaccine.dao.UserFileDAO;
import com.thdap.vaccine.dao.VaccineDAO;
import com.thdap.vaccine.model.InjectionInfo;
import com.thdap.vaccine.model.Notifications;
import com.thdap.vaccine.model.UserFile;
import com.thdap.vaccine.model.Vaccine;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "EditUserFileServlet", urlPatterns = {"/EditUserFileServlet"})
public class EditUserFileServlet extends HttpServlet {

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
            out.println("<title>Servlet EditUserFileServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditUserFileServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int userFileID = Integer.parseInt(request.getParameter("userFileID"));

        UserFileDAO userFileDAO = new UserFileDAO();
        InjectionInfoDAO injectionInfoDAO = new InjectionInfoDAO();
        VaccineDAO vaccineDAO = new VaccineDAO();

        UserFile userFile = userFileDAO.findUserFileByID(userFileID);
        List<InjectionInfo> injectionInfos = injectionInfoDAO.getInjectionInfosByUserFileID(userFileID);
        List<Vaccine> vaccines = vaccineDAO.getAllVaccines();
        
        if (userFile == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        request.setAttribute("userFile", userFile);
        request.setAttribute("vaccines", vaccines);
        request.setAttribute("injectionInfos", injectionInfos);
        request.getRequestDispatcher("editUserFile.jsp").forward(request, response); // Forward to edit page
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     private NotificationsDAO notificationsDAO = new NotificationsDAO();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        VaccineDAO vaccineDAO = new VaccineDAO();
        List<Vaccine> vaccines = vaccineDAO.getAllVaccines();
        UserFileDAO userFileDAO = new UserFileDAO();
        InjectionInfoDAO injectionInfoDAO = new InjectionInfoDAO();
        
        int userFileID = Integer.parseInt(request.getParameter("userFileID"));
        int userID = Integer.parseInt(request.getParameter("userID"));
        String healthInsuranceCardNumber = request.getParameter("healthInsuranceCardNumber");
        String bloodType = request.getParameter("bloodType");
        String medicalHistory = request.getParameter("medicalHistory");
        String historyOfDrugAllergies = request.getParameter("historyOfDrugAllergies");
        
        UserFile userFile = new UserFile();
        userFile.setUserFileID(userFileID);
        userFile.setHealthInsuranceCardNumber(healthInsuranceCardNumber);
        userFile.setBloodType(bloodType);
        userFile.setMedicalHistory(medicalHistory);
        userFile.setHistoryOfDrugAllergies(historyOfDrugAllergies);
        
        UserFile existingUserFile = userFileDAO.getUserFileByHealthInsuranceCardNumber(healthInsuranceCardNumber);
        if (existingUserFile != null && existingUserFile.getUserID() != userID) {
            request.setAttribute("userFile", userFile);
            request.setAttribute("vaccines", vaccines);
            request.setAttribute("errorMessage", "Thẻ bảo hiểm xã hội đã tồn tại cho một người dùng khác, vui lòng nhập lại!");
            request.getRequestDispatcher("editUserFile.jsp").forward(request, response);
            return;
        }

        boolean isUserFileUpdated = userFileDAO.updateUserFile(userFile);
        
        // Retrieve and update multiple InjectionInfo entries
        String newVaccineID = request.getParameter("newVaccineID");
        String newInjectionDateStr = request.getParameter("newInjectionDate");
        String newPatientStatus = request.getParameter("newPatientStatus");
        String newDateOfNextInjectionStr = request.getParameter("newDateOfNextInjection");

        if (newVaccineID != null && newInjectionDateStr != null && newPatientStatus != null) {
            try {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date newInjectionDate = sdf.parse(newInjectionDateStr);
                Date newDateOfNextInjection = null;
                
                if (newDateOfNextInjectionStr != null && !newDateOfNextInjectionStr.isEmpty()) {
                    newDateOfNextInjection = sdf.parse(newDateOfNextInjectionStr);
                }
                
                // Check if DateOfNextInjection is not before InjectionDate
//                if (newDateOfNextInjection.before(newInjectionDate)) {
//                    List<InjectionInfo> injectionInfos = injectionInfoDAO.getInjectionInfosByUserFileID(userFileID);
//                    request.setAttribute("userFile", userFile);
//                    request.setAttribute("vaccines", vaccines);
//                    request.setAttribute("injectionInfos", injectionInfos); // Pass existing InjectionInfos to JSP
//                    request.setAttribute("errorMessage", "Ngày tiêm  tiếp theo không thể sớm hơn ngày tiêm hiện tại!");
//                    request.setAttribute("newVaccineID", newVaccineID);
//                    request.setAttribute("newInjectionDate", newInjectionDateStr);
//                    request.setAttribute("newPatientStatus", newPatientStatus);
//                    request.setAttribute("newDateOfNextInjection", newDateOfNextInjectionStr);
//                    request.getRequestDispatcher("editUserFile.jsp").forward(request, response);
//                    return;
//                }

                java.sql.Date sqlNewInjectionDate = new java.sql.Date(newInjectionDate.getTime());
                java.sql.Date sqlNewDateOfNextInjection = null;
                if (newDateOfNextInjection != null) {
                    sqlNewDateOfNextInjection = new java.sql.Date(newDateOfNextInjection.getTime());
                }
                
                int newVaccineIDInt = Integer.parseInt(newVaccineID);

                InjectionInfo newInjectionInfo = new InjectionInfo(userFileID, sqlNewInjectionDate, newVaccineIDInt, newPatientStatus, sqlNewDateOfNextInjection);
                boolean isAdded = injectionInfoDAO.addInjectionInfo(newInjectionInfo);
                
                if (!isAdded) {                                   
                    List<InjectionInfo> injectionInfos = injectionInfoDAO.getInjectionInfosByUserFileID(userFileID);
                    request.setAttribute("errorMessage", "Thêm thông tin tiêm chủng thất bại!");
                    request.setAttribute("userFile", userFile);
                    request.setAttribute("injectionInfos", injectionInfos);
                    
                    request.setAttribute("newVaccineID", newVaccineID);
                    request.setAttribute("newInjectionDate", newInjectionDateStr);
                    request.setAttribute("newPatientStatus", newPatientStatus);
                    request.setAttribute("newDateOfNextInjection", newDateOfNextInjectionStr);
                    
                    request.getRequestDispatcher("editUserFile.jsp").forward(request, response);
                    return;
                }else{
                    //Viết thêm add data vào bảng notification 
                    int injectionInfoID = injectionInfoDAO.getInjectionID(userFileID, sqlNewInjectionDate, newVaccineIDInt, newPatientStatus, sqlNewDateOfNextInjection);

                    // Add notification for the new injection
                    Notifications notification = new Notifications(injectionInfoID, "New injection scheduled", false);
                    notificationsDAO.addNotification(notification);
                }
                
            } catch (ParseException | NumberFormatException e) {
                e.printStackTrace();
            }
        }
        
        // Handle update results
        if (isUserFileUpdated) {
            response.sendRedirect("ViewUserFileDetailServlet?userID=" + userID);
        } else {
            List<InjectionInfo> injectionInfos = injectionInfoDAO.getInjectionInfosByUserFileID(userFileID);
            request.setAttribute("errorMessage", "Cập Nhật hồ sơ bệnh nhân thất bại!");
            request.setAttribute("userFile", userFile);
            request.setAttribute("injectionInfos", injectionInfos); 
            request.setAttribute("newVaccineID", newVaccineID);
            request.setAttribute("newInjectionDate", newInjectionDateStr);
            request.setAttribute("newPatientStatus", newPatientStatus);
            request.setAttribute("newDateOfNextInjection", newDateOfNextInjectionStr);
            request.getRequestDispatcher("editUserFile.jsp").forward(request, response);
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
