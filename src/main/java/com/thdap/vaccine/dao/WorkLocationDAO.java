/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.WorkLocation;
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
public class WorkLocationDAO {
    private ContextDAO contextDAO;

    public WorkLocationDAO() {
        contextDAO = new ContextDAO();
    }
    
    public List<WorkLocation> getAllWorkLocations() {
        List<WorkLocation> workLocations = new ArrayList<>();
        String query = "SELECT * FROM WorkLocation";
        try (Connection conn = contextDAO.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                WorkLocation workLocation = new WorkLocation(
                        rs.getInt("workLocationID"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("map")
                );
                workLocations.add(workLocation);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return workLocations;
    }
    
    public static void main(String[] args) {
        WorkLocationDAO dao = new WorkLocationDAO();
        List<WorkLocation> workLocations = dao.getAllWorkLocations();
        for (WorkLocation wl : workLocations) {
            System.out.println(wl);
        }
    }
}
