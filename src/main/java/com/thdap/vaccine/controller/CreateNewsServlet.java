package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.NewsDAO;
import com.thdap.vaccine.model.News;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/create-news")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
                 maxFileSize = 1024 * 1024 * 10,      // 10 MB
                 maxRequestSize = 1024 * 1024 * 15)   // 15 MB
public class CreateNewsServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/createNews.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int doctorID = Integer.parseInt(request.getParameter("doctorID"));
        Date date = Date.valueOf(request.getParameter("date"));

        Part filePart = request.getPart("image");
        String fileName = null;
        if (filePart != null) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            if (!fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                File file = new File(uploadDir, fileName);
                filePart.write(file.getAbsolutePath());
            }
        }

        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        news.setDoctorID(doctorID);
        news.setDate(date);
        if (fileName != null && !fileName.isEmpty()) {
            news.setImage(fileName);
        }

        NewsDAO newsDAO = new NewsDAO();
        newsDAO.addNews(news);

        response.sendRedirect("successNews.jsp");
    }
}
