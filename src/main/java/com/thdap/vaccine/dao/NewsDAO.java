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
        String sql = "SELECT * FROM News ORDER BY date DESC";

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
    
    public void addNews(News news) {
        String sql = "INSERT INTO News (title, image, content, doctorID, date) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, news.getTitle());
            statement.setString(2, news.getImage());
            statement.setString(3, news.getContent());
            statement.setInt(4, news.getDoctorID());
            statement.setDate(5, news.getDate());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateNews(News news) {
    String sql = "UPDATE News SET title = ?, image = ?, content = ?, doctorID = ?, date = ? WHERE newID = ?";

    try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
        statement.setString(1, news.getTitle());
        statement.setString(2, news.getImage());
        statement.setString(3, news.getContent());
        statement.setInt(4, news.getDoctorID());
        statement.setDate(5, news.getDate());
        statement.setInt(6, news.getNewID());

        statement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

    
    public void deleteNews(int id) {
    String sql = "DELETE FROM News WHERE newID = ?";

    try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
        statement.setInt(1, id);
        statement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
// haanh add vào 7/7
    public List<News> getNewsByDoctorID(int doctorID) {
    List<News> newsList = new ArrayList<>();
    String sql = "SELECT * FROM News WHERE doctorID = ? ORDER BY date DESC";

    try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(sql)) {
        statement.setInt(1, doctorID);
        try (ResultSet resultSet = statement.executeQuery()) {
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
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return newsList;
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
