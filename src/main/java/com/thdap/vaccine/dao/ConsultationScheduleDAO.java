/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.ConsultationSchedule;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Xuan Vinh
 */
public class ConsultationScheduleDAO {
    private ContextDAO contextDAO;

    public ConsultationScheduleDAO() {
        contextDAO = new ContextDAO();
    }
    
    public List<ConsultationSchedule> getAllConsultationSchedules() {
        List<ConsultationSchedule> schedules = new ArrayList<>();
        String sql = "SELECT * FROM ConsultationSchedule";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                ConsultationSchedule schedule = new ConsultationSchedule(
                        rs.getInt("scheduleID"),
                        rs.getInt("userID"),
                        rs.getInt("workLocationID"),
                        rs.getInt("shiftID"),
                        rs.getDate("date")
                );
                schedules.add(schedule);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return schedules;
    }
    
    public boolean insertConsultationSchedule(int userID, int workLocationID, int shiftID, Date date) {
        String sql = "INSERT INTO ConsultationSchedule (userID, workLocationID, shiftID, date) VALUES (?, ?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userID);
            pstmt.setInt(2, workLocationID);
            pstmt.setInt(3, shiftID);
            pstmt.setDate(4, date);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }
    
    public List<ConsultationSchedule> getConsultationSchedulesByUserID(int userID) {
        List<ConsultationSchedule> schedules = new ArrayList<>();
        String sql = "SELECT * FROM ConsultationSchedule WHERE userID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, userID);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ConsultationSchedule schedule = new ConsultationSchedule(
                            rs.getInt("scheduleID"),
                            rs.getInt("userID"),
                            rs.getInt("workLocationID"),
                            rs.getInt("shiftID"),
                            rs.getDate("date")
                    );
                    schedules.add(schedule);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return schedules;
    }
    
//    public static void main(String[] args) {
//        ConsultationScheduleDAO consultationScheduleDAO = new ConsultationScheduleDAO();
//
//        List<ConsultationSchedule> consultationSchedules = consultationScheduleDAO.getAllConsultationSchedules();
//        for (ConsultationSchedule schedule : consultationSchedules) {
//            System.out.println(schedule);
//        }
//    }
}
