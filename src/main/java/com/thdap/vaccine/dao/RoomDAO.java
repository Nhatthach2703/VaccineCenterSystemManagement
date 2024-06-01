/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.Room;
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
public class RoomDAO {
    private ContextDAO contextDAO;

    public RoomDAO() {
        contextDAO = new ContextDAO();
    }
    
    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM Room";
        try (Connection conn = contextDAO.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                rooms.add(new Room(rs.getInt("roomID"), rs.getString("roomName"), rs.getInt("workLocationID")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }
    
    
    public Room getRoomById(int roomID) {
        String sql = "SELECT * FROM Room WHERE roomID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, roomID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Room(rs.getInt("roomID"), rs.getString("roomName"), rs.getInt("workLocationID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
//    public static void main(String[] args) {
//        RoomDAO roomDAO = new RoomDAO();
//
//        // Get all rooms
//        List<Room> rooms = roomDAO.getAllRooms();
//        for (Room room : rooms) {
//            System.out.println(room);
//        }
//    }
}
