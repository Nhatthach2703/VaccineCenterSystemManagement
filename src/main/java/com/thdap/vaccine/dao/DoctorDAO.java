/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.Doctor;
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
public class DoctorDAO {
    private ContextDAO contextDAO;

    public DoctorDAO() {
        contextDAO = new ContextDAO();
    }
    
    public List<Doctor> getAllDoctors() {
        List<Doctor> doctors = new ArrayList<>();
        String query = "SELECT * FROM Doctor";
        try (Connection conn = contextDAO.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Doctor doctor = new Doctor(
                        rs.getInt("doctorID"),
                        rs.getString("fullName"),
                        rs.getInt("accountID"),
                        rs.getString("image"),
                        rs.getString("email"),
                        rs.getDate("doB"),
                        rs.getString("phoneNumber"),
                        rs.getString("address"),
                        rs.getString("gender"),
                        rs.getInt("workLocationID"),
                        rs.getString("jobTitle"),
                        rs.getString("degreeType"),
                        rs.getInt("yearsOfExperience")
                );
                doctors.add(doctor);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return doctors;
    }
    public void addDoctor(String fullName, int accountID, String image, String email, java.sql.Date doB, String phoneNumber, String address, String gender, int workLocationID, String degreeType, int yearsOfExperience) throws SQLException {
    String sql = "INSERT INTO Doctor (fullName, accountID, image, email, doB, phoneNumber, address, gender, workLocationID, degreeType, yearsOfExperience) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try (Connection conn = contextDAO.getConnection(); 
         PreparedStatement st = conn.prepareStatement(sql)) {
        
        st.setString(1, fullName);
        st.setInt(2, accountID);
        st.setString(3, image);
        st.setString(4, email);
        st.setDate(5, doB);
        st.setString(6, phoneNumber);
        st.setString(7, address);
        st.setString(8, gender);
        st.setInt(9, workLocationID);
        st.setString(10, degreeType);
        st.setInt(11, yearsOfExperience);
        st.executeUpdate();
    } catch (SQLException e) {
        // Log lỗi để dễ dàng debug
        e.printStackTrace();
        throw new SQLException("Error adding doctor", e);
    }
}
    
    public static void main(String[] args) {
        DoctorDAO doctorDAO = new DoctorDAO();
        List<Doctor> doctors = doctorDAO.getAllDoctors();

        for (Doctor doctor : doctors) {
            System.out.println(doctor);
        }
    }
    
}
