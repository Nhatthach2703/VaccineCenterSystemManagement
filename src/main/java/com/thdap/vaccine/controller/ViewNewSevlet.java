/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.NewsDAO;
import com.thdap.vaccine.model.Doctor;
import com.thdap.vaccine.model.News;
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
 * @author Tran HaF
 */
@WebServlet(name = "ViewNewSevlet", urlPatterns = {"/viewnewsevlet"})
public class ViewNewSevlet extends HttpServlet {

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
        //get data from dao
        NewsDAO newsDAO = new NewsDAO();
        List<com.thdap.vaccine.model.News> newsList = newsDAO.getAllNews();
        // set data to jsp
        request.setAttribute("viewNews", newsList);
        request.getRequestDispatcher("newsDetail.jsp").forward(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        NewsDAO newsDAO = new NewsDAO();
        String idStr = request.getParameter("idnew");
        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            News news = newsDAO.getNewbyIdNew(id);
            if (news != null) {
                DoctorDAO doctorDAO = new DoctorDAO();
                List<Doctor> doctors = doctorDAO.getAllDoctors();
                request.setAttribute("doctors", doctors);
                request.setAttribute("news", news);
                request.getRequestDispatcher("/newsDetail.jsp").forward(request, response); // Ensure this path is correct
            } else {
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
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
//        int idNew = Integer.parseInt(request.getParameter("idnew"));

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
