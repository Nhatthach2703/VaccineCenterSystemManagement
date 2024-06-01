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
        List<WorkSchedule> workSchedules = new ArrayList<>();
        String sql = "SELECT * FROM WorkSchedule";
        try (Connection conn = contextDAO.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                workSchedules.add(new WorkSchedule(
                        rs.getInt("WorkScheduleID"),
                        rs.getInt("RoomID"),
                        rs.getInt("ShiftID"),
                        rs.getInt("DoctorID"),
                        rs.getInt("WorkLocationID"),
                        rs.getDate("Date").toLocalDate(),
                        rs.getInt("NumberOfPatients")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return workSchedules;
    }
    
    public void addWorkSchedule(WorkSchedule workSchedule) {
        String sql = "INSERT INTO WorkSchedule (RoomID, ShiftID, DoctorID, WorkLocationID, Date, NumberOfPatients) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, workSchedule.getRoomID());
            stmt.setInt(2, workSchedule.getShiftID());
            stmt.setInt(3, workSchedule.getDoctorID());
            stmt.setInt(4, workSchedule.getWorkLocationID());
            stmt.setDate(5, Date.valueOf(workSchedule.getDate()));
            stmt.setInt(6, workSchedule.getNumberOfPatients());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteWorkSchedule(int workScheduleID) {
        String sql = "DELETE FROM WorkSchedule WHERE WorkScheduleID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, workScheduleID);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateWorkSchedule(WorkSchedule workSchedule) {
        String sql = "UPDATE WorkSchedule SET RoomID = ?, ShiftID = ?, DoctorID = ?, WorkLocationID = ?, Date = ?, NumberOfPatients = ? WHERE WorkScheduleID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, workSchedule.getRoomID());
            stmt.setInt(2, workSchedule.getShiftID());
            stmt.setInt(3, workSchedule.getDoctorID());
            stmt.setInt(4, workSchedule.getWorkLocationID());
            stmt.setDate(5, java.sql.Date.valueOf(workSchedule.getDate()));
            stmt.setInt(6, workSchedule.getNumberOfPatients());
            stmt.setInt(7, workSchedule.getWorkScheduleID());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    public WorkSchedule getWorkScheduleById(int workScheduleID) {
        WorkSchedule workSchedule = null;
        String sql = "SELECT * FROM WorkSchedule WHERE WorkScheduleID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, workScheduleID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    workSchedule = new WorkSchedule(
                            rs.getInt("WorkScheduleID"),
                            rs.getInt("RoomID"),
                            rs.getInt("ShiftID"),
                            rs.getInt("DoctorID"),
                            rs.getInt("WorkLocationID"),
                            rs.getDate("Date").toLocalDate(),
                            rs.getInt("NumberOfPatients")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return workSchedule;
    }
    
    public static void main(String[] args) {
        WorkScheduleDAO workScheduleDAO = new WorkScheduleDAO();

        List<WorkSchedule> workSchedules = workScheduleDAO.getAllWorkSchedules();
        for (WorkSchedule workSchedule : workSchedules) {
            System.out.println(workSchedule);
        }
    }
}
