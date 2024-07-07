/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.OrderVaccineInfo;
import java.sql.Connection;
import java.sql.Date;
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
public class OrderVaccineInfoDAO {
    private ContextDAO contextDAO;

    public OrderVaccineInfoDAO() {
        contextDAO = new ContextDAO();
    }

    public List<OrderVaccineInfo> getAllOrderVaccineInfo() {
        List<OrderVaccineInfo> orders = new ArrayList<>();
        String sql = "SELECT * FROM OrderVaccineInfo";
        try (Connection conn = contextDAO.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                OrderVaccineInfo order = new OrderVaccineInfo(
                        rs.getInt("orderInfoID"),
                        rs.getInt("userID"),
                        rs.getDate("createDate"),
                        rs.getDate("dateWantToGetVaccinated"),
                        rs.getInt("workLocationID"),
                        rs.getInt("vaccineID"),
                        rs.getBoolean("confirmStatus"),
                        rs.getString("paymentStatus"),
                        rs.getDouble("totalPrice")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    public boolean insertOrderVaccineInfo(OrderVaccineInfo orderInfo) {
        String sql = "INSERT INTO OrderVaccineInfo (userID, createDate, dateWantToGetVaccinated, workLocationID, vaccineID, confirmStatus, paymentStatus, totalPrice) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, orderInfo.getUserID());
            pstmt.setDate(2, new java.sql.Date(orderInfo.getCreateDate().getTime()));
            pstmt.setDate(3, new java.sql.Date(orderInfo.getDateWantToGetVaccinated().getTime()));
            pstmt.setInt(4, orderInfo.getWorkLocationID());
            pstmt.setInt(5, orderInfo.getVaccineID());
            pstmt.setBoolean(6, orderInfo.isConfirmStatus());
            pstmt.setString(7, orderInfo.getPaymentStatus());
            pstmt.setDouble(8, orderInfo.getTotalPrice());

            int rowsInserted = pstmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getOrderInfoID(int userID, Date createDate, Date dateWantToGetVaccinated, int workLocationID, int vaccineID, double totalPrice) {
        int orderInfoID = -1;
        String sql = "SELECT orderInfoID FROM OrderVaccineInfo "
                + "WHERE userID = ? AND createDate = ? AND dateWantToGetVaccinated = ? "
                + "AND workLocationID = ? AND vaccineID = ? AND totalPrice = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userID);
            stmt.setDate(2, new java.sql.Date(createDate.getTime()));
            stmt.setDate(3, new java.sql.Date(dateWantToGetVaccinated.getTime()));
            stmt.setInt(4, workLocationID);
            stmt.setInt(5, vaccineID);
            stmt.setDouble(6, totalPrice);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                orderInfoID = rs.getInt("orderInfoID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderInfoID;
    }

    public boolean updatePaymentStatusByID(int orderInfoID, String paymentStatus) {
        String sql = "UPDATE OrderVaccineInfo SET paymentStatus = ? WHERE orderInfoID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, paymentStatus);
            stmt.setInt(2, orderInfoID);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Return false if an exception occurred or no rows were updated
    }
    
    public boolean deleteOrderByOrderInfoID(int orderInfoID) {
        String sql = "DELETE FROM OrderVaccineInfo WHERE orderInfoID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderInfoID);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<OrderVaccineInfo> getOrderHistoryByUserID(int userID) {
        List<OrderVaccineInfo> orders = new ArrayList<>();
        String sql = "SELECT * FROM OrderVaccineInfo WHERE userID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userID);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                OrderVaccineInfo order = new OrderVaccineInfo(
                        rs.getInt("orderInfoID"),
                        rs.getInt("userID"),
                        rs.getDate("createDate"),
                        rs.getDate("dateWantToGetVaccinated"),
                        rs.getInt("workLocationID"),
                        rs.getInt("vaccineID"),
                        rs.getBoolean("confirmStatus"),
                        rs.getString("paymentStatus"),
                        rs.getDouble("totalPrice")
                );
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
    
    public boolean updateConfirmStatusByID(int orderInfoID, boolean confirmStatus) {
        String sql = "UPDATE OrderVaccineInfo SET confirmStatus = ? WHERE orderInfoID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setBoolean(1, confirmStatus);
            stmt.setInt(2, orderInfoID);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
      public OrderVaccineInfo getOrderInfoByID(int orderInfoID) {
        OrderVaccineInfo order = null;
        String sql = "SELECT * FROM OrderVaccineInfo WHERE orderInfoID = ?";
        try (Connection conn = contextDAO.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderInfoID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                order = new OrderVaccineInfo(
                        rs.getInt("orderInfoID"),
                        rs.getInt("userID"),
                        rs.getDate("createDate"),
                        rs.getDate("dateWantToGetVaccinated"),
                        rs.getInt("workLocationID"),
                        rs.getInt("vaccineID"),
                        rs.getBoolean("confirmStatus"),
                        rs.getString("paymentStatus"),
                        rs.getDouble("totalPrice")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }
}
