/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.TypeOfVaccine;
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
public class TypeOfVaccineDAO {

    private ContextDAO contextDAO;

    public TypeOfVaccineDAO() {
        contextDAO = new ContextDAO();
    }

    public List<TypeOfVaccine> getAllTypesOfVaccine() {
        List<TypeOfVaccine> types = new ArrayList<>();
        String query = "SELECT * FROM TypeOfVaccine";
        try (Connection conn = contextDAO.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                TypeOfVaccine type = new TypeOfVaccine(
                        rs.getInt("typeID"),
                        rs.getString("name")
                );
                types.add(type);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return types;
    }

    // Create a new TypeOfVaccine
    public void addTypeOfVaccine(String name) throws SQLException {
        String sql = "INSERT INTO TypeOfVaccine (name) VALUES (?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.executeUpdate();
        }
    }

    public boolean isTypeOfVaccineExists(String name) throws SQLException {
        String query = "SELECT COUNT(*) FROM TypeOfVaccine WHERE name = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, name);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    // Read a TypeOfVaccine by ID
    public TypeOfVaccine getTypeOfVaccine(int typeID) throws SQLException {
        String sql = "SELECT * FROM TypeOfVaccine WHERE typeID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, typeID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new TypeOfVaccine(rs.getInt("typeID"), rs.getString("name"));
                }
            }
        }
        return null;
    }

    // Update a TypeOfVaccine
    public void updateTypeOfVaccine(int typeID, String name) throws SQLException {
        String sql = "UPDATE TypeOfVaccine SET name = ? WHERE typeID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, name);
            pstmt.setInt(2, typeID);
            pstmt.executeUpdate();
        }
    }

    // Delete a TypeOfVaccine
    public void deleteTypeOfVaccine(int typeID) throws SQLException {
        String sql = "DELETE FROM TypeOfVaccine WHERE typeID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, typeID);
            pstmt.executeUpdate();
        }
    }

    public String getNameById(int typeId) {
        String name = null;
        String query = "SELECT name FROM TypeOfVaccine WHERE typeID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, typeId);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                name = rs.getString("name");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return name;
    }

    public static void main(String[] args) {
        TypeOfVaccineDAO typeDAO = new TypeOfVaccineDAO();
        List<TypeOfVaccine> types = typeDAO.getAllTypesOfVaccine();
        for (TypeOfVaccine type : types) {
            System.out.println(type);
        }
    }
}


