package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.Notifications;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO for handling operations related to Notifications.
 */
public class NotificationsDAO {

    private ContextDAO contextDAO;

    public NotificationsDAO() {
        contextDAO = new ContextDAO();
    }

    public List<Notifications> getAllNotifications() {
        List<Notifications> notifications = new ArrayList<>();
        String query = "SELECT * FROM Notifications";
        try (Connection conn = contextDAO.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Notifications notification = new Notifications(
                        rs.getInt("notificationID"),
                        rs.getInt("injectionInfoID"),
                        rs.getString("message"),
                        rs.getBoolean("status")
                );
                notifications.add(notification);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return notifications;
    }

    public Notifications getNotificationById(int notificationID) {
        Notifications notification = null;
        String query = "SELECT * FROM Notifications WHERE notificationID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, notificationID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    notification = new Notifications(
                            rs.getInt("notificationID"),
                            rs.getInt("injectionInfoID"),
                            rs.getString("message"),
                            rs.getBoolean("status")
                    );
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return notification;
    }

    public List<Notifications> getPendingNotifications() {
        List<Notifications> notifications = new ArrayList<>();
        String query = "SELECT * FROM Notifications WHERE status = 0";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Notifications notification = new Notifications();
                notification.setNotificationID(rs.getInt("notificationID"));
                notification.setInjectionInfoID(rs.getInt("injectionInfoID"));
                notification.setMessage(rs.getString("message"));
                notification.setStatus(rs.getBoolean("status"));
                notifications.add(notification);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return notifications;
    }

    public void updateNotificationStatus(Notifications notification) {
        String query = "UPDATE Notifications SET status = ? WHERE notificationID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setBoolean(1, notification.isStatus());
            pstmt.setInt(2, notification.getNotificationID());
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean addNotification(Notifications notification) {
        String query = "INSERT INTO Notifications (injectionInfoID, message, status) VALUES (?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, notification.getInjectionInfoID());
            pstmt.setString(2, notification.getMessage());
            pstmt.setBoolean(3, notification.isStatus());
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteNotificationByInjectionInfoID(int injectionInfoID) {
        String query = "DELETE FROM Notifications WHERE injectionInfoID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, injectionInfoID);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
