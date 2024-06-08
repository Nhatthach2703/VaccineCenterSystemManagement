/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.FrequentlyAskedQuestionsDAO;
import com.thdap.vaccine.model.Doctor;
import com.thdap.vaccine.model.FrequentlyAskedQuestions;
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
@WebServlet(name="ViewFaQsSevlet", urlPatterns={"/ViewFaQsSevlet"})
public class ViewFaQsSevlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private FrequentlyAskedQuestionsDAO faqDAO = new FrequentlyAskedQuestionsDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //get data from dao
        FrequentlyAskedQuestionsDAO newsDAO = new FrequentlyAskedQuestionsDAO();
        List<com.thdap.vaccine.model.FrequentlyAskedQuestions> newsList = newsDAO.getAllFAQs();
        // set data to jsp
        request.setAttribute("viewNews", newsList);
        request.getRequestDispatcher("FaQsDetail.jsp").forward(request, response);
        
    } 

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
        
        FrequentlyAskedQuestionsDAO faqDAO = new FrequentlyAskedQuestionsDAO();
        String idStr = request.getParameter("questionID");
        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            FrequentlyAskedQuestions faq = faqDAO.getFaqById(id);
            if (faq != null) {
                
                request.setAttribute("faqs", faq);
                request.getRequestDispatcher("/FaQsDetail.jsp").forward(request, response); // Ensure this path is correct
            } else {
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }
        
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
        processRequest(request, response);
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
