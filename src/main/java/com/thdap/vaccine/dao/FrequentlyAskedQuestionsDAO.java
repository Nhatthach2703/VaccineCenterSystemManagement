/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.FrequentlyAskedQuestions;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Xuan Vinh
 */
public class FrequentlyAskedQuestionsDAO {
    private ContextDAO contextDAO;

    public FrequentlyAskedQuestionsDAO() {
        contextDAO = new ContextDAO();
    }
    
    public List<FrequentlyAskedQuestions> getAllFAQs() {
        List<FrequentlyAskedQuestions> faqs = new ArrayList<>();
        String sql = "SELECT * FROM FrequentlyAskedQuestions";

        try (Connection connection = contextDAO.getConnection(); PreparedStatement statement = connection.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int questionID = resultSet.getInt("questionID");
                String shortenedQuestion = resultSet.getString("shortenedQuestion");
                String question = resultSet.getString("question");
                String answer = resultSet.getString("answer");
                String image = resultSet.getString("image");
                FrequentlyAskedQuestions faq = new FrequentlyAskedQuestions(questionID, shortenedQuestion, question, answer,image);
                faqs.add(faq);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return faqs;
    }
    public FrequentlyAskedQuestions getFaqById(int id) {
    FrequentlyAskedQuestions faq = null;
    String query = "SELECT * FROM FrequentlyAskedQuestions WHERE questionID = ?";
    
    try (Connection conn = contextDAO.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {
        
        stmt.setInt(1, id);
        
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                faq = new FrequentlyAskedQuestions();
                faq.setQuestionID(rs.getInt("questionID"));
                faq.setShortenedQuestion(rs.getString("shortenedQuestion"));
                faq.setQuestion(rs.getString("question"));
                faq.setAnswer(rs.getString("answer"));
                faq.setImage(rs.getString("image"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return faq;
}
    
    
    public static void main(String[] args) {
        FrequentlyAskedQuestionsDAO faqDAO = new FrequentlyAskedQuestionsDAO();
        List<FrequentlyAskedQuestions> faqList = faqDAO.getAllFAQs();
        for (FrequentlyAskedQuestions faq : faqList) {
            System.out.println(faq);
        }
        FrequentlyAskedQuestions faqList1 = faqDAO.getFaqById(1);
        System.out.println(faqList1);
    }
}
