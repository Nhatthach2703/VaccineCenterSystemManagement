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
import java.util.logging.Level;
import java.util.logging.Logger;

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
        String query = "SELECT * FROM ConsultationSchedule";
        try (Connection conn = new ContextDAO().getConnection(); PreparedStatement pstmt = conn.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                schedules.add(new ConsultationSchedule(
                        rs.getInt("scheduleID"),
                        rs.getInt("userID"),
                        rs.getInt("WorkScheduleID"),
                        rs.getInt("UserShiftID"),
                        rs.getBoolean("status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedules;
    }

    public void addConsultationSchedule(ConsultationSchedule consultationSchedule) {
        String sql = "INSERT INTO ConsultationSchedule (WorkScheduleID, UserShiftID, status) VALUES (?, ?, ?)";

        try (Connection conn = new ContextDAO().getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, consultationSchedule.getWorkScheduleID());
            pstmt.setInt(2, consultationSchedule.getUserShiftID());
            pstmt.setBoolean(3, consultationSchedule.isStatus());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteConsultationSchedulesByWorkScheduleID(int workScheduleID) {
        String query = "DELETE FROM ConsultationSchedule WHERE workScheduleID = ?";
        try (Connection connection = contextDAO.getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, workScheduleID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //
    public List<ConsultationSchedule> getConsultationSchedulesByDateAndLocation(String filterDate, String filterWorkLocation) {
        List<ConsultationSchedule> consultationSchedules = new ArrayList<>();
        String sql = "SELECT cs.* FROM ConsultationSchedule cs "
                + "JOIN WorkSchedule ws ON cs.workScheduleID = ws.WorkScheduleID "
                + "WHERE ws.Date = ? AND ws.WorkLocationID = ?";
        try (Connection connection = contextDAO.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDate(1, Date.valueOf(filterDate));
            statement.setInt(2, Integer.parseInt(filterWorkLocation));
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    ConsultationSchedule schedule = new ConsultationSchedule();
                    schedule.setScheduleID(rs.getInt("scheduleID"));
                    schedule.setUserID(rs.getInt("userID"));
                    schedule.setWorkScheduleID(rs.getInt("workScheduleID"));
                    schedule.setUserShiftID(rs.getInt("userShiftID"));
                    schedule.setStatus(rs.getBoolean("status"));
                    consultationSchedules.add(schedule);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsultationScheduleDAO.class.getName()).log(Level.SEVERE,
                    "Error fetching consultation schedules by date and location: "
                    + filterDate + ", " + filterWorkLocation, ex);
        }

        return consultationSchedules;
    }

    public List<ConsultationSchedule> getConsultationSchedulesByDate(String filterDate) {
        List<ConsultationSchedule> consultationSchedules = new ArrayList<>();
        String sql = "SELECT cs.* FROM ConsultationSchedule cs "
                + "JOIN WorkSchedule ws ON cs.workScheduleID = ws.WorkScheduleID "
                + "WHERE ws.Date = ?";
        try (Connection connection = contextDAO.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setDate(1, Date.valueOf(filterDate));
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    ConsultationSchedule schedule = new ConsultationSchedule();
                    schedule.setScheduleID(rs.getInt("scheduleID"));
                    schedule.setUserID(rs.getInt("userID"));
                    schedule.setWorkScheduleID(rs.getInt("workScheduleID"));
                    schedule.setUserShiftID(rs.getInt("userShiftID"));
                    schedule.setStatus(rs.getBoolean("status"));
                    consultationSchedules.add(schedule);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsultationScheduleDAO.class.getName()).log(Level.SEVERE,
                    "Error fetching consultation schedules by date: " + filterDate, ex);
        }

        return consultationSchedules;
    }

    public List<ConsultationSchedule> getConsultationSchedulesByLocation(String filterWorkLocation) {
        List<ConsultationSchedule> consultationSchedules = new ArrayList<>();
        String sql = "SELECT cs.* FROM ConsultationSchedule cs "
                + "JOIN WorkSchedule ws ON cs.workScheduleID = ws.WorkScheduleID "
                + "WHERE ws.WorkLocationID = ?";
        try (Connection connection = contextDAO.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, Integer.parseInt(filterWorkLocation));
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    ConsultationSchedule schedule = new ConsultationSchedule();
                    schedule.setScheduleID(rs.getInt("scheduleID"));
                    schedule.setUserID(rs.getInt("userID"));
                    schedule.setWorkScheduleID(rs.getInt("workScheduleID"));
                    schedule.setUserShiftID(rs.getInt("userShiftID"));
                    schedule.setStatus(rs.getBoolean("status"));
                    consultationSchedules.add(schedule);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsultationScheduleDAO.class.getName()).log(Level.SEVERE, "Error fetching consultation schedules by location: " + filterWorkLocation, ex);
        }
        return consultationSchedules;
    }

//    public void bookConsultation(ConsultationSchedule schedule){
//        String sql = "UPDATE ConsultationSchedule SET userID = ? WHERE scheduleID = ?";
//        try (Connection connection = contextDAO.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
//            statement.setInt(1, schedule.getUserID());
//            statement.setInt(2, schedule.getScheduleID());
//            statement.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(ConsultationScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    public boolean bookConsultation(ConsultationSchedule schedule) {
        String sql = "UPDATE ConsultationSchedule SET userID = ? WHERE scheduleID = ?";
        try (Connection connection = contextDAO.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, schedule.getUserID());
            statement.setInt(2, schedule.getScheduleID());
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            Logger.getLogger(ConsultationScheduleDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public ConsultationSchedule getConsultationScheduleByID(int scheduleID) {
        String query = "SELECT * FROM ConsultationSchedule WHERE scheduleID = ?";
        ConsultationSchedule schedule = null;

        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, scheduleID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    schedule = new ConsultationSchedule(
                            rs.getInt("scheduleID"),
                            rs.getInt("userID"),
                            rs.getInt("WorkScheduleID"),
                            rs.getInt("UserShiftID"),
                            rs.getBoolean("status")
                    );
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(ConsultationScheduleDAO.class.getName()).log(Level.SEVERE,
                    "Error fetching consultation schedule by ID: " + scheduleID, e);
        }
        return schedule;
    }

    public List<ConsultationSchedule> getConsultationSchedulesByUserID(int userID) {
        List<ConsultationSchedule> consultationSchedules = new ArrayList<>();
        String sql = "SELECT * FROM ConsultationSchedule WHERE userID = ?";
        try (Connection connection = contextDAO.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userID);
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    ConsultationSchedule schedule = new ConsultationSchedule(
                            rs.getInt("scheduleID"),
                            rs.getInt("userID"),
                            rs.getInt("WorkScheduleID"),
                            rs.getInt("UserShiftID"),
                            rs.getBoolean("status")
                    );
                    consultationSchedules.add(schedule);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ConsultationScheduleDAO.class.getName()).log(Level.SEVERE, "Error fetching consultation schedules by user ID: " + userID, ex);
        }
        return consultationSchedules;
    }

    public static void main(String[] args) {
        ConsultationScheduleDAO consultationScheduleDAO = new ConsultationScheduleDAO();

        List<ConsultationSchedule> consultationSchedules = consultationScheduleDAO.getAllConsultationSchedules();
        for (ConsultationSchedule schedule : consultationSchedules) {
            System.out.println(schedule);
        }
    }
}
