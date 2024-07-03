/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.InjectionInfo;
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
public class InjectionInfoDAO {
    private ContextDAO contextDAO;

    public InjectionInfoDAO() {
        contextDAO = new ContextDAO();
    }

    public List<InjectionInfo> getAllInjectionInfos() {
        String sql = "SELECT * FROM InjectionInfo";
        List<InjectionInfo> injectionInfos = new ArrayList<>();
        try (Connection conn = contextDAO.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                InjectionInfo injectionInfo = new InjectionInfo(
                        rs.getInt("userFileID"),
                        rs.getDate("injectionDate"),
                        rs.getInt("vaccineID"),
                        rs.getString("patientStatus"),
                        rs.getDate("dateOfNextInjection")
                );
                injectionInfo.setInjectionInfoID(rs.getInt("injectionInfoID"));
                injectionInfos.add(injectionInfo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return injectionInfos;
    }
    
    public List<InjectionInfo> getInjectionInfosByUserFileID(int userFileID) {
        String sql = "SELECT * FROM InjectionInfo WHERE userFileID = ?";
        List<InjectionInfo> injectionInfos = new ArrayList<>();
        try (Connection conn = contextDAO.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userFileID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    InjectionInfo injectionInfo = new InjectionInfo(
                            rs.getInt("userFileID"),
                            rs.getDate("injectionDate"),
                            rs.getInt("vaccineID"),
                            rs.getString("patientStatus"),
                            rs.getDate("dateOfNextInjection")
                    );
                    injectionInfo.setInjectionInfoID(rs.getInt("injectionInfoID"));
                    injectionInfos.add(injectionInfo);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return injectionInfos;
    }

    public boolean addInjectionInfo(InjectionInfo newInjectionInfo) {
        String sql = "INSERT INTO InjectionInfo (userFileID, injectionDate, vaccineID, patientStatus, dateOfNextInjection) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, newInjectionInfo.getUserFileID());
            ps.setDate(2, newInjectionInfo.getInjectionDate());
            ps.setInt(3, newInjectionInfo.getVaccineID());
            ps.setString(4, newInjectionInfo.getPatientStatus());
            ps.setDate(5, newInjectionInfo.getDateOfNextInjection());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteInjectionInfoByUserFileID(int userFileID) {
        String sql = "DELETE FROM InjectionInfo WHERE userFileID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userFileID);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
