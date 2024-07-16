/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.InjectionSchedule;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Xuan Vinh
 */
public class InjectionScheduleDAO {
    private ContextDAO contextDAO;

    public InjectionScheduleDAO() {
        contextDAO = new ContextDAO();
    }
    
    public List<InjectionSchedule> getAllInjectionSchedules() {
        List<InjectionSchedule> schedules = new ArrayList<>();
        String query = "SELECT * FROM InjectionSchedule";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                schedules.add(new InjectionSchedule(
                        rs.getInt("scheduleID"),
                        rs.getInt("userID"),
                        rs.getInt("WorkScheduleID"),
                        rs.getInt("UserShiftID"),
                        rs.getBoolean("status"),
                        rs.getInt("vaccineID")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedules;
    }
    public void addInjectionSchedule(InjectionSchedule injectionSchedule) {
        String sql = "INSERT INTO InjectionSchedule (WorkScheduleID, UserShiftID, status) VALUES (?, ?, ?)";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, injectionSchedule.getWorkScheduleID());
            pstmt.setInt(2, injectionSchedule.getUserShiftID());
            pstmt.setBoolean(3, injectionSchedule.isStatus());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteInjectionSchedulesByWorkScheduleID(int workScheduleID) {
        String query = "DELETE FROM InjectionSchedule WHERE workScheduleID = ?";
        try (Connection connection = contextDAO.getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, workScheduleID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //
    public List<InjectionSchedule> getInjectionSchedulesByDate(String filterDate) {
        List<InjectionSchedule> schedules = new ArrayList<>();
        String query = "SELECT * FROM InjectionSchedule INNER JOIN WorkSchedule ON InjectionSchedule.WorkScheduleID = WorkSchedule.WorkScheduleID WHERE WorkSchedule.date = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, filterDate);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    schedules.add(new InjectionSchedule(
                            rs.getInt("scheduleID"),
                            rs.getInt("userID"),
                            rs.getInt("WorkScheduleID"),
                            rs.getInt("UserShiftID"),
                            rs.getBoolean("status"),
                            rs.getInt("vaccineID")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedules;
    }

    public List<InjectionSchedule> getInjectionSchedulesByLocation(String filterWorkLocation) {
        List<InjectionSchedule> schedules = new ArrayList<>();
        String query = "SELECT * FROM InjectionSchedule INNER JOIN WorkSchedule ON InjectionSchedule.WorkScheduleID = WorkSchedule.WorkScheduleID WHERE WorkSchedule.workLocationID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, filterWorkLocation);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    schedules.add(new InjectionSchedule(
                            rs.getInt("scheduleID"),
                            rs.getInt("userID"),
                            rs.getInt("WorkScheduleID"),
                            rs.getInt("UserShiftID"),
                            rs.getBoolean("status"),
                            rs.getInt("vaccineID")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedules;
    }

    public List<InjectionSchedule> getInjectionSchedulesByDateAndLocation(String filterDate, String filterWorkLocation) {
        List<InjectionSchedule> schedules = new ArrayList<>();
        String query = "SELECT * FROM InjectionSchedule INNER JOIN WorkSchedule ON InjectionSchedule.WorkScheduleID = WorkSchedule.WorkScheduleID WHERE WorkSchedule.date = ? AND WorkSchedule.workLocationID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, filterDate);
            pstmt.setString(2, filterWorkLocation);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    schedules.add(new InjectionSchedule(
                            rs.getInt("scheduleID"),
                            rs.getInt("userID"),
                            rs.getInt("WorkScheduleID"),
                            rs.getInt("UserShiftID"),
                            rs.getBoolean("status"),
                            rs.getInt("vaccineID")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedules;
    }
    
    public InjectionSchedule getInjectionScheduleByID(int injectionScheduleID) {
        InjectionSchedule schedule = null;
        String query = "SELECT * FROM InjectionSchedule WHERE scheduleID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, injectionScheduleID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    schedule = new InjectionSchedule(
                            rs.getInt("scheduleID"),
                            rs.getInt("userID"),
                            rs.getInt("WorkScheduleID"),
                            rs.getInt("UserShiftID"),
                            rs.getBoolean("status"),
                            rs.getInt("vaccineID")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedule;
    }

    public boolean bookInjection(InjectionSchedule schedule) {
        String query = "UPDATE InjectionSchedule SET userID = ?, vaccineID = ? WHERE scheduleID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, schedule.getUserID());
            pstmt.setInt(2, schedule.getVaccineID());
            pstmt.setInt(3, schedule.getScheduleID());

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<InjectionSchedule> getInjectionSchedulesByUserID(int userID) {
        List<InjectionSchedule> schedules = new ArrayList<>();
        String query = "SELECT * FROM InjectionSchedule WHERE userID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, userID);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    schedules.add(new InjectionSchedule(
                            rs.getInt("scheduleID"),
                            rs.getInt("userID"),
                            rs.getInt("WorkScheduleID"),
                            rs.getInt("UserShiftID"),
                            rs.getBoolean("status"),
                            rs.getInt("vaccineID")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedules;
    }
    
    public boolean updateInjectionScheduleStatus(InjectionSchedule injectionSchedule) {
        String query = "UPDATE InjectionSchedule SET status = ? WHERE scheduleID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setBoolean(1, injectionSchedule.isStatus());
            pstmt.setInt(2, injectionSchedule.getScheduleID());
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
}
