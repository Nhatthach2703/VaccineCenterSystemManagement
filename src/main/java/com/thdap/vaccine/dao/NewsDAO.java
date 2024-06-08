/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.News;
import com.thdap.vaccine.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class NewsDAO {

    private ContextDAO contextDAO;
    private String query;

    public NewsDAO() {
        contextDAO = new ContextDAO();
    }

     public List<News> getAllNews() {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM News";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(sql); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                News news = new News();
                news.setNewID(resultSet.getInt("newID"));
                news.setTitle(resultSet.getString("title"));
                news.setImage(resultSet.getString("image"));
                news.setContent(resultSet.getString("content"));
                news.setDoctorID(resultSet.getInt("doctorID"));
                news.setDate(resultSet.getDate("date"));
                newsList.add(news);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return newsList;
    }

    public News getNewbyIdNew(int id) {
        News news = null;
        String query = "SELECT * FROM News WHERE newID = ?";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    news = new News();
                    news.setNewID(rs.getInt("newID"));
                    news.setTitle(rs.getString("title"));
                    news.setImage(rs.getString("image"));
                    news.setContent(rs.getString("content"));
                    news.setDoctorID(rs.getInt("doctorID"));
                    news.setDate(rs.getDate("date"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return news;
    }

//    public static void main(String[] args) {
//        NewsDAO newsDAO = new NewsDAO();
//        List<News> newsList = newsDAO.getAllNews();
//        for (News news : newsList) {
//            System.out.println(news);
//        }
//        News news = newsDAO.getNewbyIdNew(1);
//        System.out.println(news);
//    }
}
