/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.Doctor;
import java.sql.Connection;
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
    
    public static void main(String[] args) {
        DoctorDAO doctorDAO = new DoctorDAO();
        List<Doctor> doctors = doctorDAO.getAllDoctors();

        for (Doctor doctor : doctors) {
            System.out.println(doctor);
        }
    }
    
}
