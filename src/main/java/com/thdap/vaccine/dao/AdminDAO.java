/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.Admin;
import java.sql.Connection;
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
public class AdminDAO {
    private ContextDAO contextDAO;

    public AdminDAO() {
        contextDAO = new ContextDAO();
    }
    
    
    public List<Admin> getAllAdmins() {
        List<Admin> admins = new ArrayList<>();
        String query = "SELECT * FROM Admin";
        try (Connection conn = contextDAO.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Admin admin = new Admin(
                        rs.getInt("adminID"),
                        rs.getString("fullName"),
                        rs.getInt("accountID"),
                        rs.getString("image"),
                        rs.getString("email"),
                        rs.getString("phoneNumber")
                );
                admins.add(admin);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return admins;
    }
    public Admin getAdminByAccountID(int accountID) {
        Admin admin = null;
        String query = "SELECT * FROM Admin WHERE accountID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, accountID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    admin = new Admin(
                            rs.getInt("adminID"),
                            rs.getString("fullName"),
                            rs.getInt("accountID"),
                            rs.getString("image"),
                            rs.getString("email"),
                            rs.getString("phoneNumber")
                    );
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return admin;
    }
    
    public static void main(String[] args) {
        AdminDAO adminDAO = new AdminDAO();
        List<Admin> admins = adminDAO.getAllAdmins();

        for (Admin admin : admins) {
            System.out.println(admin);
        }
    }
}
