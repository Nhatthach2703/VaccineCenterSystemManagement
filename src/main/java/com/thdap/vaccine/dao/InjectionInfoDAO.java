/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.InjectionInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
}
