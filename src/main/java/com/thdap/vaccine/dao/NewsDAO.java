/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.News;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Xuan Vinh
 */
public class NewsDAO {
    private ContextDAO contextDAO;

    public NewsDAO() {
        contextDAO = new ContextDAO();
    }
    
    public List<News> getAllNews() {
        List<News> newsList = new ArrayList<>();
        String sql = "SELECT * FROM News";
        try (Connection conn = contextDAO.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                newsList.add(new News(rs.getInt("newID"), rs.getString("title"), rs.getString("image"), rs.getString("content"), rs.getInt("doctorID")));
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
//    }
}
