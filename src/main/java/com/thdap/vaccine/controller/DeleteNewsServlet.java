package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.NewsDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-news")
public class DeleteNewsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        NewsDAO newsDAO = new NewsDAO();
        newsDAO.deleteNews(id);
        response.sendRedirect("listNews");
    }
}
