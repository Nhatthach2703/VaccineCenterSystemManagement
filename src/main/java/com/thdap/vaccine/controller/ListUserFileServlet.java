/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;


import com.thdap.vaccine.dao.UserDAO;
import com.thdap.vaccine.dao.UserFileDAO;
import com.thdap.vaccine.model.User;
import com.thdap.vaccine.model.UserFile;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ListUserFileServlet", urlPatterns = {"/listUsers"})
public class ListUserFileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private UserDAO userDAO;
    private UserFileDAO userFileDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO(); // Initialize UserDAO
        userFileDAO = new UserFileDAO(); // Initialize UserFileDAO
     
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListUserFileServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListUserFileServlet at " + request.getContextPath() + "</h1>");
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
        String searchType = request.getParameter("searchType");
        String searchTerm = request.getParameter("searchTerm");

        List<User> users = new ArrayList<>();

        // Perform search based on searchType and searchTerm
        if (searchType != null && searchTerm != null) {
            switch (searchType) {
                case "fullname":
                    users = userDAO.searchUsersByName(searchTerm);
                    break;
                case "phoneNumber":
                    users = userDAO.searchUsersByPhoneNumber(searchTerm);
                    break;
                case "healthInsuranceCardNumber":
                    List<UserFile> userFiles = userFileDAO.searchUserFilesByHealthInsuranceCard(searchTerm);
                    for (UserFile userFile : userFiles) {
                        User user = userDAO.findUserByID(userFile.getUserID());
                        if (user != null) {
                            users.add(user);
                        }
                    }
                    break;
                default:
                    // Handle invalid search type
                    break;
            }
        }

        if (users.isEmpty()) {
            request.setAttribute("errorMessage", "Không có kết quả mà bạn muốn tìm.");
        }

        request.setAttribute("users", users);
        request.setAttribute("userFileDAO", userFileDAO); // Add this line to pass UserFileDAO to JSP
        request.getRequestDispatcher("/ListUserFile.jsp").forward(request, response);
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
