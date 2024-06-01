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

                FrequentlyAskedQuestions faq = new FrequentlyAskedQuestions(questionID, shortenedQuestion, question, answer);
                faqs.add(faq);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return faqs;
    }
    
    
//    public static void main(String[] args) {
//        FrequentlyAskedQuestionsDAO faqDAO = new FrequentlyAskedQuestionsDAO();
//        List<FrequentlyAskedQuestions> faqList = faqDAO.getAllFAQs();
//        for (FrequentlyAskedQuestions faq : faqList) {
//            System.out.println(faq);
//        }
//    }
}
