package com.thdap.vaccine.controller;

import com.thdap.vaccine.dao.FrequentlyAskedQuestionsDAO;
import com.thdap.vaccine.model.FrequentlyAskedQuestions;
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

@WebServlet("/create-faq")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
                 maxFileSize = 1024 * 1024 * 10,      // 10 MB
                 maxRequestSize = 1024 * 1024 * 15)   // 15 MB
public class CreateFAQsServlet extends HttpServlet {
    
    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward the request to the JSP page to display the form
        request.getRequestDispatcher("/addFAQ.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Set character encoding to UTF-8
        request.setCharacterEncoding("UTF-8");

        // Retrieve form data
        String shortenedQuestion = request.getParameter("shortenedQuestion");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        
        // Handle file upload
        Part filePart = request.getPart("image");
        String fileName = null;
        if (filePart != null) {
            fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            if (!fileName.isEmpty()) { // Check if a file was uploaded
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                File file = new File(uploadDir, fileName);
                filePart.write(file.getAbsolutePath());
            }
        }

        // Create new FAQ object
        FrequentlyAskedQuestions newFAQ = new FrequentlyAskedQuestions();
        newFAQ.setShortenedQuestion(shortenedQuestion);
        newFAQ.setQuestion(question);
        newFAQ.setAnswer(answer);
        if (fileName != null && !fileName.isEmpty()) {
            newFAQ.setImage(fileName);
        }

        // Insert the new FAQ into the database
        FrequentlyAskedQuestionsDAO faqDAO = new FrequentlyAskedQuestionsDAO();
        faqDAO.addFAQ(newFAQ);

        // Redirect or forward to a success page
        response.sendRedirect("listFAQs");
    }
}
