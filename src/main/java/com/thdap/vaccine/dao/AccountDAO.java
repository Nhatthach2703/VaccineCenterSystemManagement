/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.Account;
import com.thdap.vaccine.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO extends ContextDAO {

    private ContextDAO contextDAO;

    public AccountDAO() {
        contextDAO = new ContextDAO();
    }

    public List<Account> getAllAccounts() {
        List<Account> accounts = new ArrayList<>();
        String query = "SELECT * FROM Account";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Account account = new Account();
                account.setAccountID(resultSet.getInt("accountID"));
                account.setRoleID(resultSet.getString("roleID"));
                account.setUsername(resultSet.getString("username"));
                account.setPassword(resultSet.getString("password"));
                account.setEmail(resultSet.getString("email"));
                account.setStatus(resultSet.getBoolean("status"));
                accounts.add(account);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return accounts;
    }

    public Account getAccountById(String accountId) {
        Account account = null;
        try (Connection conn = contextDAO.getConnection()) {
            String query = "SELECT * FROM Account WHERE accountID = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, accountId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        account = new Account();
                        account.setAccountID(rs.getInt("id"));
                        account.setPassword(rs.getString("password"));
                        // Lấy các thuộc tính khác nếu cần
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public boolean updatePassword(int accountID, String newPassword) {
        boolean success = false;
        String query = "UPDATE Account SET password = ? WHERE accountID = ?";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, newPassword);
            stmt.setInt(2, accountID);

            int rowsAffected = stmt.executeUpdate();
            success = rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return success;
    }

    public boolean updatePassword(String email, String newPassword) {//theo email
        boolean isUpdated = false;
        String query = "UPDATE Account SET password = ? WHERE email = ?";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement pst = conn.prepareStatement(query)) {
            pst.setString(1, newPassword);
            pst.setString(2, email);

            int rowCount = pst.executeUpdate();
            isUpdated = rowCount > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isUpdated;
    }

    public Account login(String username, String password) {
        String query = "SELECT * FROM Account WHERE username = ? AND password = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new Account(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4), resultSet.getString(5), resultSet.getBoolean(6));
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return null;
    }

    public User getUserByAccountID(int accountID) {//lấy user theo accountID
        User user = null;
        String query = "SELECT * FROM Users WHERE accountID = ?";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setInt(1, accountID);

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
        }

        return user;
    }

    public boolean createAccount(String username, String password, String email) {
        String roleID = "User";
        String sql = "INSERT INTO Account (roleID, username, password, email,status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement st = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setString(1, roleID);
            st.setString(2, username);
            st.setString(3, password);
            st.setString(4, email);
            st.setBoolean(5, true);
            int affectedRows = st.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating account failed, no rows affected.");
            }

            try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int accountID = generatedKeys.getInt(1);
                    return accountID > 0;
                } else {
                    throw new SQLException("Creating account failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean createUser(String fullName, int accountID, String email, java.sql.Date doB, String phoneNumber, String address, String gender) {
        String defaultImagePath = "stockAvata.png";
        String sql = "INSERT INTO Users (fullName, accountID, image, email, doB, phoneNumber, address, gender) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, fullName);
            st.setInt(2, accountID);
            st.setString(3, defaultImagePath);
            st.setString(4, email);
            st.setDate(5, doB);
            st.setString(6, phoneNumber);
            st.setString(7, address);
            st.setString(8, gender);
            int affectedRows = st.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean usernameExists(String username) {
        String sql = "SELECT COUNT(*) FROM Account WHERE username = ?";
        try {
            Connection conn = contextDAO.getConnection(); // Lấy kết nối từ contextDAO
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean emailExists(String email) {
        String sql = "SELECT COUNT(*) FROM Account WHERE email = ?";
        try {
            Connection conn = contextDAO.getConnection(); // Lấy kết nối từ contextDAO
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public int getAccountID(String username) {
        String sql = "SELECT accountID FROM Account WHERE username = ?";
        try {
            Connection conn = contextDAO.getConnection(); // Lấy kết nối từ contextDAO
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("accountID");
            } else {
                throw new SQLException("No account found with the given username");
            }
        } catch (SQLException e) {
            System.out.println(e);
            return -1; // Trả về giá trị mặc định hoặc thực hiện xử lý phù hợp
        }
    }

    public Account getAccountEmail(String email) {

        try {
            String sql = "SELECT accountID, roleID, username, password, email "
                    + "FROM Account WHERE email = ?;";

            Connection connection = null;

            connection = contextDAO.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            Account account = new Account();

            while (rs.next()) {
                account.setAccountID(rs.getInt("accountID"));
                account.setRoleID(rs.getString("roleID"));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setEmail(rs.getString("email"));

                return account;
            }

            rs.close();
            ps.close();

        } catch (SQLException ex) {

        }
        return null;
    }

    public String getRoleID(int accountID) {
        String sql = "SELECT roleID FROM Account WHERE accountID = ?";
        try {
            Connection conn = contextDAO.getConnection(); // Lấy kết nối từ contextDAO
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, accountID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString("roleID");
            } else {
                throw new SQLException("No account found with the given accountID");
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null; // Trả về giá trị mặc định hoặc thực hiện xử lý phù hợp
        }
    }

    public void addAccount(String roleID, String username, String password, String email) throws SQLException {
        String sql = "INSERT INTO Account (roleID, username, password, email, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, roleID);
            st.setString(2, username);
            st.setString(3, password);
            st.setString(4, email);
            st.setBoolean(5, true);
            st.executeUpdate();
        } catch (SQLException e) {
            // Log lỗi để dễ dàng debug
            e.printStackTrace();
            throw new SQLException("Error adding account", e);
        }
    }

    public static void main(String[] args) {
        AccountDAO accountDAO = new AccountDAO();
        List<Account> accounts = accountDAO.getAllAccounts();

        if (accounts.isEmpty()) {
            System.out.println("Không có tài khoản nào trong cơ sở dữ liệu.");
        } else {
            System.out.println("Danh sách các tài khoản:");
            for (Account account : accounts) {
                System.out.println(account);
            }
        }
//        accountDAO.updatePassword(1, "1234");
        int accountID = 2; // Replace with the actual account ID you want to query
        String roleID = accountDAO.getRoleID(accountID);
        System.out.println("Role ID for accountID " + accountID + " is: " + roleID);
    }

    public Account getAccountByEmail(String email) {
        Account account = null;
        String query = "SELECT * FROM Account WHERE email = ?";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    account = new Account();
                    account.setAccountID(resultSet.getInt("accountID"));
                    account.setRoleID(resultSet.getString("roleID"));
                    account.setUsername(resultSet.getString("username"));
                    account.setPassword(resultSet.getString("password"));
                    account.setEmail(resultSet.getString("email"));
                    account.setStatus(resultSet.getBoolean("status"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }
    public void updateAccountStatus(int accountID, boolean status) {
        String query = "UPDATE Account SET status = ? WHERE accountID = ?";

        try (Connection conn = contextDAO.getConnection();
             PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setBoolean(1, status);
            statement.setInt(2, accountID);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
