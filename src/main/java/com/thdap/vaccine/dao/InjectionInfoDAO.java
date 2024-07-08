/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.InjectionInfo;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
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

    public InjectionInfo getInjectionInfoById(int injectionInfoID) {
        String query = "SELECT * FROM InjectionInfo WHERE injectionInfoID = ?";
        InjectionInfo injectionInfo = null;
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, injectionInfoID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Date injectionDate = rs.getDate("injectionDate");
                    Date dateOfNextInjection = rs.getDate("dateOfNextInjection");

                    injectionInfo = new InjectionInfo(
                            rs.getInt("userFileID"),
                            injectionDate,
                            rs.getInt("vaccineID"),
                            rs.getString("patientStatus"),
                            dateOfNextInjection
                    );
                    injectionInfo.setInjectionInfoID(rs.getInt("injectionInfoID"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return injectionInfo;
    }

//    private LocalDate convertToLocalDate(Date sqlDate) {
//        return sqlDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();//
//    }

    public int getInjectionID(int userFileID, Date injectionDate, int vaccineID, String patientStatus, Date dateOfNextInjection) {
        int injectionID = -1;
        String query = "SELECT injectionInfoID FROM InjectionInfo WHERE userFileID = ? AND injectionDate = ? AND vaccineID = ? AND patientStatus = ?";

        if (dateOfNextInjection != null) {
            query += " AND dateOfNextInjection = ?";
        } else {
            query += " AND dateOfNextInjection IS NULL";
        }

        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, userFileID);
            pstmt.setDate(2, new java.sql.Date(injectionDate.getTime()));
            pstmt.setInt(3, vaccineID);
            pstmt.setString(4, patientStatus);

            if (dateOfNextInjection != null) {
                pstmt.setDate(5, new java.sql.Date(dateOfNextInjection.getTime()));
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    injectionID = rs.getInt("injectionInfoID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return injectionID;
    }

}
