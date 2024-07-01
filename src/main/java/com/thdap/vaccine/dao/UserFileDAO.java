/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.UserFile;
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
public class UserFileDAO {
    private ContextDAO contextDAO;

    public UserFileDAO() {
        contextDAO = new ContextDAO();
    }
    
    public boolean addUserFile(UserFile userFile) {
        String query = "INSERT INTO UserFile (userID, healthInsuranceCardNumber, bloodType, medicalHistory, historyOfDrugAllergies) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, userFile.getUserID());
            pstmt.setString(2, userFile.getHealthInsuranceCardNumber());
            pstmt.setString(3, userFile.getBloodType());
            pstmt.setString(4, userFile.getMedicalHistory());
            pstmt.setString(5, userFile.getHistoryOfDrugAllergies());

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isHealthInsuranceCardNumberExists(String healthInsuranceCardNumber) {
        String query = "SELECT COUNT(*) FROM UserFile WHERE healthInsuranceCardNumber = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, healthInsuranceCardNumber);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<UserFile> getAllUserFiles() {
        List<UserFile> userFiles = new ArrayList<>();
        String query = "SELECT * FROM UserFile";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                UserFile userFile = new UserFile();
                userFile.setUserID(resultSet.getInt("userID"));
                userFile.setHealthInsuranceCardNumber(resultSet.getString("healthInsuranceCardNumber"));
                userFile.setBloodType(resultSet.getString("bloodType"));
                userFile.setMedicalHistory(resultSet.getString("medicalHistory"));
                userFile.setHistoryOfDrugAllergies(resultSet.getString("historyOfDrugAllergies"));
                userFiles.add(userFile);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userFiles;
    }
    
    public UserFile findUserFileByUserID(int userID) {
        String sql = "SELECT * FROM UserFile WHERE userID = ?";
        UserFile userFile = null;
        try (Connection conn = contextDAO.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    userFile = new UserFile(
                            rs.getInt("userID"),
                            rs.getString("healthInsuranceCardNumber"),
                            rs.getString("bloodType"),
                            rs.getString("medicalHistory"),
                            rs.getString("historyOfDrugAllergies")
                    );
                    userFile.setUserFileID(rs.getInt("userFileID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userFile;
    }
    
    public UserFile findUserFileByID(int userFileID) {
        String sql = "SELECT * FROM UserFile WHERE userFileID = ?";
        UserFile userFile = null;
        try (Connection conn = contextDAO.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userFileID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    userFile = new UserFile(
                            rs.getInt("userID"),
                            rs.getString("healthInsuranceCardNumber"),
                            rs.getString("bloodType"),
                            rs.getString("medicalHistory"),
                            rs.getString("historyOfDrugAllergies")
                    );
                    userFile.setUserFileID(rs.getInt("userFileID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userFile;
    }
    
    public boolean updateUserFile(UserFile userFile) {
        String query = "UPDATE UserFile SET healthInsuranceCardNumber = ?, bloodType = ?, medicalHistory = ?, historyOfDrugAllergies = ? WHERE userFileID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, userFile.getHealthInsuranceCardNumber());
            pstmt.setString(2, userFile.getBloodType());
            pstmt.setString(3, userFile.getMedicalHistory());
            pstmt.setString(4, userFile.getHistoryOfDrugAllergies());
            pstmt.setInt(5, userFile.getUserFileID());

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteUserFile(int userFileID) {
        String query = "DELETE FROM UserFile WHERE userFileID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, userFileID);
            int rowsDeleted = pstmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
