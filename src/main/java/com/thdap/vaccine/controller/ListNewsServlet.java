package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.DoctorDAO;
import com.thdap.vaccine.dao.NewsDAO;
import com.thdap.vaccine.model.Doctor;
import com.thdap.vaccine.model.News;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ListNewsServlet", urlPatterns = {"/listNews"})
public class ListNewsServlet extends HttpServlet {

    private NewsDAO newsDao;
    private DoctorDAO doctorDAO;

    public ListNewsServlet() {
        this.newsDao = new NewsDAO();
        this.doctorDAO = new DoctorDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Integer loggedInDoctorID = (Integer) session.getAttribute("doctorID");

            if (loggedInDoctorID == null) {
                throw new ServletException("Doctor ID not found in session.");
            }

            List<Doctor> doctors = doctorDAO.getAllDoctors();
            List<News> newsList = newsDao.getNewsByDoctorID(loggedInDoctorID);

            request.setAttribute("doctors", doctors);
            request.setAttribute("newsList", newsList);
            request.getRequestDispatcher("CRUDNews.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving news list", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for listing news";
    }
}
