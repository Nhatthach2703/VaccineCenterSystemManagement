/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.WorkSchedule;
import java.sql.Connection;
import java.sql.Date;
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
public class WorkScheduleDAO {
    private ContextDAO contextDAO;

    public WorkScheduleDAO() {
        contextDAO = new ContextDAO();
    }
    
    public List<WorkSchedule> getAllWorkSchedules() {
        List<WorkSchedule> schedules = new ArrayList<>();
        String query = "SELECT * FROM WorkSchedule";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                schedules.add(new WorkSchedule(
                        rs.getInt("WorkScheduleID"),
                        rs.getInt("RoomID"),
                        rs.getInt("ShiftID"),
                        rs.getInt("DoctorID"),
                        rs.getInt("WorkLocationID"),
                        rs.getDate("Date"),
                        rs.getString("workType")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedules;
    }
    
    public int getWorkScheduleID(int roomID, int shiftID, int doctorID, int workLocationID, Date date, String workType) {
        String sql = "SELECT workScheduleID FROM WorkSchedule WHERE roomID = ? AND shiftID = ? AND doctorID = ? AND workLocationID = ? AND date = ? AND workType = ?";
        int workScheduleID = 0;

        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, roomID);
            pstmt.setInt(2, shiftID);
            pstmt.setInt(3, doctorID);
            pstmt.setInt(4, workLocationID);
            pstmt.setDate(5, date);
            pstmt.setString(6, workType);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    workScheduleID = rs.getInt("workScheduleID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return workScheduleID;
    }
    
    public void addWorkSchedule(WorkSchedule workSchedule) {
        String query = "INSERT INTO WorkSchedule (RoomID, ShiftID, DoctorID, WorkLocationID, Date, workType) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, workSchedule.getRoomID());
            pstmt.setInt(2, workSchedule.getShiftID());
            pstmt.setInt(3, workSchedule.getDoctorID());
            pstmt.setInt(4, workSchedule.getWorkLocationID());
            pstmt.setDate(5, workSchedule.getDate());
            pstmt.setString(6, workSchedule.getWorkType());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteInjectionSchedulesByWorkScheduleID(int workScheduleID) {
        try (Connection connection = contextDAO.getConnection()) {
            String sql = "DELETE FROM InjectionSchedule WHERE workScheduleID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, workScheduleID);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteConsultationSchedulesByWorkScheduleID(int workScheduleID) {
        try (Connection connection = contextDAO.getConnection()) {
            String sql = "DELETE FROM ConsultationSchedule WHERE workScheduleID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, workScheduleID);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteWorkSchedule(int workScheduleID) {
        try (Connection connection = contextDAO.getConnection()) {
            deleteInjectionSchedulesByWorkScheduleID(workScheduleID);
            deleteConsultationSchedulesByWorkScheduleID(workScheduleID);

            String sql = "DELETE FROM WorkSchedule WHERE workScheduleID = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, workScheduleID);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateWorkSchedule(WorkSchedule workSchedule) {
        String query = "UPDATE WorkSchedule SET RoomID = ?, ShiftID = ?, DoctorID = ?, WorkLocationID = ?, Date = ?, workType = ? WHERE WorkScheduleID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, workSchedule.getRoomID());
            pstmt.setInt(2, workSchedule.getShiftID());
            pstmt.setInt(3, workSchedule.getDoctorID());
            pstmt.setInt(4, workSchedule.getWorkLocationID());
            pstmt.setDate(5, workSchedule.getDate());
            pstmt.setString(6, workSchedule.getWorkType());
            pstmt.setInt(7, workSchedule.getWorkScheduleID());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    public WorkSchedule getWorkScheduleByID(int id) {
        String query = "SELECT * FROM WorkSchedule WHERE WorkScheduleID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new WorkSchedule(
                            rs.getInt("WorkScheduleID"),
                            rs.getInt("RoomID"),
                            rs.getInt("ShiftID"),
                            rs.getInt("DoctorID"),
                            rs.getInt("WorkLocationID"),
                            rs.getDate("Date"),
                            rs.getString("workType")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean workScheduleExists(int roomID, int shiftID, int doctorID, Date date, String workType) {
        String sql = "SELECT COUNT(*) AS count FROM WorkSchedule WHERE RoomID = ? AND ShiftID = ? AND DoctorID = ? AND Date = ? AND workType = ?";
        int count = 0;

        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, roomID);
            pstmt.setInt(2, shiftID);
            pstmt.setInt(3, doctorID);
            pstmt.setDate(4, date);
            pstmt.setString(5, workType);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt("count");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count > 0;
    }
    
    public boolean isDoctorAssignedToAnotherRoom(int doctorID, int shiftID, Date date) {
        boolean isAssigned = false;
        String query = "SELECT COUNT(*) FROM WorkSchedule "
                + "WHERE doctorID = ? AND shiftID = ? AND date = ?";

        try (Connection connection = contextDAO.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, doctorID);
            preparedStatement.setInt(2, shiftID);
            preparedStatement.setDate(3, date);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    isAssigned = count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isAssigned;
    }
    public boolean isRoomOccupiedByAnotherDoctor(int roomID, int shiftID, Date date) {
        try (Connection connection = contextDAO.getConnection()) {
            String sql = "SELECT COUNT(*) FROM WorkSchedule WHERE roomID = ? AND shiftID = ? AND date = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setInt(1, roomID);
                preparedStatement.setInt(2, shiftID);
                preparedStatement.setDate(3, date);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        return resultSet.getInt(1) > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String[] args) {
        WorkScheduleDAO workScheduleDAO = new WorkScheduleDAO();

        List<WorkSchedule> workSchedules = workScheduleDAO.getAllWorkSchedules();
        for (WorkSchedule workSchedule : workSchedules) {
            System.out.println(workSchedule);
        }
    }
}
