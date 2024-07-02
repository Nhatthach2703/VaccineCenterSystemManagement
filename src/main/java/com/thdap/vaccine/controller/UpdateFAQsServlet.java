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

@WebServlet("/update-faq")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
                 maxFileSize = 1024 * 1024 * 10,      // 10 MB
                 maxRequestSize = 1024 * 1024 * 15)   // 15 MB
public class UpdateFAQsServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        FrequentlyAskedQuestionsDAO faqDAO = new FrequentlyAskedQuestionsDAO();
        FrequentlyAskedQuestions faq = faqDAO.getFaqById(id);
        request.setAttribute("faq", faq);
        request.getRequestDispatcher("/updateFAQ.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // Đảm bảo sử dụng UTF-8 cho các ký tự tiếng Việt
        
        int id = Integer.parseInt(request.getParameter("id"));
        String shortenedQuestion = request.getParameter("shortenedQuestion");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        
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

        FrequentlyAskedQuestions updatedFAQ = new FrequentlyAskedQuestions();
        updatedFAQ.setQuestionID(id);
        updatedFAQ.setShortenedQuestion(shortenedQuestion);
        updatedFAQ.setQuestion(question);
        updatedFAQ.setAnswer(answer);
        if (fileName != null) {
            updatedFAQ.setImage(fileName);
        } else {
            // Nếu không cập nhật ảnh, giữ nguyên ảnh hiện tại
            FrequentlyAskedQuestionsDAO faqDAO = new FrequentlyAskedQuestionsDAO();
            FrequentlyAskedQuestions existingFAQ = faqDAO.getFaqById(id);
            if (existingFAQ != null) {
                updatedFAQ.setImage(existingFAQ.getImage());
            }
        }

        FrequentlyAskedQuestionsDAO faqDAO = new FrequentlyAskedQuestionsDAO();
        faqDAO.updateFAQ(updatedFAQ);

        response.sendRedirect("listFAQs");
    }
}
