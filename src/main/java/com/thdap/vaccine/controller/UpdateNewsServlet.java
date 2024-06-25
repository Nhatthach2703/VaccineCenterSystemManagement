package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.NewsDAO;
import com.thdap.vaccine.model.News;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/update-news")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
                 maxFileSize = 1024 * 1024 * 10,      // 10 MB
                 maxRequestSize = 1024 * 1024 * 15)   // 15 MB
public class UpdateNewsServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        NewsDAO newsDAO = new NewsDAO();
        News news = newsDAO.getNewbyIdNew(id);
        request.setAttribute("news", news);
        request.getRequestDispatcher("/updateNews.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int doctorID = Integer.parseInt(request.getParameter("doctorID"));
        String date = request.getParameter("date");

        String fileName = null;
        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            File file = new File(uploadDir, fileName);
            filePart.write(file.getAbsolutePath());
        }

        News updatedNews = new News();
        updatedNews.setNewID(id);
        updatedNews.setTitle(title);
        updatedNews.setContent(content);
        updatedNews.setDoctorID(doctorID);
        updatedNews.setDate(java.sql.Date.valueOf(date));
        if (fileName != null) {
            updatedNews.setImage(fileName);
        } else {
            NewsDAO newsDAO = new NewsDAO();
            News existingNews = newsDAO.getNewbyIdNew(id);
            if (existingNews != null) {
                updatedNews.setImage(existingNews.getImage());
            }
        }

        NewsDAO newsDAO = new NewsDAO();
        newsDAO.updateNews(updatedNews);

        response.sendRedirect("listNews");
    }
}
