/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Xuan Vinh
 */
public class UserDAO {

    private ContextDAO contextDAO;

    public UserDAO() {
        contextDAO = new ContextDAO();
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM Users";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                User user = new User();
                user.setUserID(resultSet.getInt("userID"));
                user.setFullName(resultSet.getString("fullName"));
                user.setAccountID(resultSet.getInt("accountID"));
                user.setImage(resultSet.getString("image"));
                user.setEmail(resultSet.getString("email"));
                user.setDoB(resultSet.getDate("doB"));
                user.setPhoneNumber(resultSet.getString("phoneNumber"));
                user.setAddress(resultSet.getString("address"));
                user.setGender(resultSet.getString("gender"));
                users.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    public void update(User user) {
        String query = "UPDATE Users SET fullName = ?, doB = ?, gender = ?, address = ?, phoneNumber = ? WHERE userID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(query)) {
            // Thiết lập các giá trị cho câu lệnh truy vấn
            statement.setString(1, user.getFullName());
            statement.setDate(2, new java.sql.Date(user.getDoB().getTime())); // Chuyển đổi từ java.util.Date sang java.sql.Date
            statement.setString(3, user.getGender());
            statement.setString(4, user.getAddress());
            statement.setString(5, user.getPhoneNumber());
            statement.setInt(6, user.getUserID());
            // Thực thi câu lệnh truy vấn
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//    public void updateByUserID(int userID, User user) {
//        String query = "UPDATE Users SET fullName = ?, doB = ?, gender = ?, address = ?, phoneNumber = ? WHERE userID = ?";
//        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(query)) {
//            // Thiết lập các giá trị cho câu lệnh truy vấn
//            statement.setString(1, user.getFullName());
//            statement.setDate(2, new java.sql.Date(user.getDoB().getTime())); // Chuyển đổi từ java.util.Date sang java.sql.Date
//            statement.setString(3, user.getGender());
//            statement.setString(4, user.getAddress());
//            statement.setString(5, user.getPhoneNumber());
//            statement.setInt(6, userID);
//            // Thực thi câu lệnh truy vấn
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            // Xử lý ngoại lệ hoặc ghi log lỗi ở đây
//        }
//    }
    public User getUserById(String userId) {
        User user = null;
        try {
            Connection conn = contextDAO.getConnection();
            String query = "SELECT * FROM users WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserID(rs.getInt("id"));
                user.setFullName(rs.getString("fullName"));
                user.setImage(rs.getString("image"));
                user.setAccountID(rs.getInt("accountID"));
                user.setEmail(rs.getString("email"));
                user.setDoB(rs.getDate("doB"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setAddress(rs.getString("address"));
                user.setGender(rs.getString("String"));
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public User findUserByID(int userID) {
        User user = null;
        String query = "SELECT * FROM Users WHERE userID = ?";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setInt(1, userID);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    user = new User();
                    user.setUserID(resultSet.getInt("userID"));
                    user.setFullName(resultSet.getString("fullName"));
                    user.setAccountID(resultSet.getInt("accountID"));
                    user.setImage(resultSet.getString("image"));
                    user.setEmail(resultSet.getString("email"));
                    user.setDoB(resultSet.getDate("doB"));
                    user.setPhoneNumber(resultSet.getString("phoneNumber"));
                    user.setAddress(resultSet.getString("address"));
                    user.setGender(resultSet.getString("gender"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception or log the error here
        }
        return user;
    }

    public boolean updateImageByID(int userID, String imageFileName) {
        boolean success = false;
        String query = "UPDATE Users SET image = ? WHERE userID = ?";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, imageFileName);
            statement.setInt(2, userID);
            int rowsAffected = statement.executeUpdate();
            success = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        List<User> users = userDAO.getAllUsers();

//        if (users.isEmpty()) {
//            System.out.println("Không có người dùng nào trong cơ sở dữ liệu.");
//        } else {
//            System.out.println("Danh sách người dùng:");
//            for (User user : users) {
//                System.out.println(user);
//            }
//        }
        userDAO.findUserByID(1);
        System.out.println(userDAO.findUserByID(1));
    }
}
