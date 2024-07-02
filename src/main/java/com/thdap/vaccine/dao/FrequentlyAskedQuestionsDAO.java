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
        String sql = "SELECT * FROM FrequentlyAskedQuestions\n" +
"ORDER BY questionID DESC;";

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
    
    public void addFAQ(FrequentlyAskedQuestions newFAQ) {
    String sql = "INSERT INTO FrequentlyAskedQuestions (shortenedQuestion, question, answer, image) VALUES (?, ?, ?, ?)";
    
    try (Connection conn = contextDAO.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setString(1, newFAQ.getShortenedQuestion());
        stmt.setString(2, newFAQ.getQuestion());
        stmt.setString(3, newFAQ.getAnswer());
        stmt.setString(4, newFAQ.getImage());
        
        int rowsInserted = stmt.executeUpdate();
        if (rowsInserted > 0) {
            System.out.println("A new FAQ was inserted successfully!");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    
}
    
    public void updateFAQ(FrequentlyAskedQuestions faq) {
        String sql = "UPDATE FrequentlyAskedQuestions SET shortenedQuestion = ?, question = ?, answer = ?, image = ? WHERE questionID = ?";
        
        try (Connection conn = contextDAO.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, faq.getShortenedQuestion());
            stmt.setString(2, faq.getQuestion());
            stmt.setString(3, faq.getAnswer());
            stmt.setString(4, faq.getImage());
            stmt.setInt(5, faq.getQuestionID());
            
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("FAQ updated successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteFAQ(int id) {
        String sql = "DELETE FROM FrequentlyAskedQuestions WHERE questionID = ?";
        
        try (Connection conn = contextDAO.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            
            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("FAQ deleted successfully!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
