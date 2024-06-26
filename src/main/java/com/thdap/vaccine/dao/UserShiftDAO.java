/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.UserShift;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Xuan Vinh
 */
public class UserShiftDAO {
    private ContextDAO contextDAO;
    
    public UserShiftDAO() {
        contextDAO = new ContextDAO();
    }
    
    public List<UserShift> getAllUserShifts() {
        List<UserShift> userShifts = new ArrayList<>();
        String query = "SELECT * FROM UserShift";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                int userShiftID = rs.getInt("UserShiftID");
                int shiftID = rs.getInt("shiftID");
                LocalTime startTime = rs.getTime("startTime").toLocalTime();
                LocalTime endTime = rs.getTime("endTime").toLocalTime();
                userShifts.add(new UserShift(userShiftID, shiftID, startTime, endTime));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userShifts;
    }
    
    public List<UserShift> getUserShiftsByShiftID(int shiftID) {
        List<UserShift> userShifts = new ArrayList<>();
        String sql = "SELECT * FROM UserShift WHERE shiftID = ?";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, shiftID);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int userShiftID = rs.getInt("UserShiftID");
                int shiftId = rs.getInt("shiftID");
                LocalTime startTime = LocalTime.parse(rs.getString("startTime"));
                LocalTime endTime = LocalTime.parse(rs.getString("endTime"));

                UserShift userShift = new UserShift(userShiftID, shiftId, startTime, endTime);
                userShifts.add(userShift);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 

        return userShifts;
    }
    
    public UserShift getUserShiftByUserShiftID(int userShiftID) {
        String query = "SELECT * FROM UserShift WHERE UserShiftID = ?";
        UserShift userShift = null;

        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, userShiftID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int shiftID = rs.getInt("shiftID");
                    LocalTime startTime = rs.getTime("startTime").toLocalTime();
                    LocalTime endTime = rs.getTime("endTime").toLocalTime();
                    userShift = new UserShift(userShiftID, shiftID, startTime, endTime);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userShift;
    }
    
//    public static void main(String[] args) {
//        UserShiftDAO userShiftDAO = new UserShiftDAO();
//
//        List<UserShift> userShifts = userShiftDAO.getAllUserShifts();
//        userShifts.forEach(System.out::println);
//    }
}
