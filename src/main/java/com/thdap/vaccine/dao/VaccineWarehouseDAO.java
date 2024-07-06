package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.VaccineWarehouse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VaccineWarehouseDAO {

    private ContextDAO contextDAO;

    public VaccineWarehouseDAO() {
        this.contextDAO = new ContextDAO();
    }

    // Get all VaccineWarehouse records
    public List<VaccineWarehouse> getAll() {
        List<VaccineWarehouse> warehouses = new ArrayList<>();
        String sql = "SELECT * FROM VaccineWarehouse";
        try (
            Connection conn = contextDAO.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int warehouseID = rs.getInt("warehouseID");
                int vaccineID = rs.getInt("vaccineID");
                int workLocationID = rs.getInt("workLocationID");
                int quantity = rs.getInt("quantity");

                VaccineWarehouse warehouse = new VaccineWarehouse(warehouseID, vaccineID, workLocationID, quantity);
                warehouses.add(warehouse);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return warehouses;
    }

    // Get all VaccineWarehouse records filtered by workLocationID
    public List<VaccineWarehouse> getAllByWorkLocationId(int workLocationId) {
        List<VaccineWarehouse> warehouses = new ArrayList<>();
        String sql = "SELECT * FROM VaccineWarehouse WHERE workLocationID = ?";
        try (
            Connection conn = contextDAO.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)
        ) {
            stmt.setInt(1, workLocationId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int warehouseID = rs.getInt("warehouseID");
                int vaccineID = rs.getInt("vaccineID");
                int workLocationID = rs.getInt("workLocationID");
                int quantity = rs.getInt("quantity");

                VaccineWarehouse warehouse = new VaccineWarehouse(warehouseID, vaccineID, workLocationID, quantity);
                warehouses.add(warehouse);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return warehouses;
    }
    
    public boolean vaccineExistsInWarehouse(int vaccineID, int workLocationID) {
        String sql = "SELECT COUNT(*) FROM VaccineWarehouse WHERE vaccineID = ? AND workLocationID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, vaccineID);
            pstmt.setInt(2, workLocationID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean addVaccineToWarehouse(int vaccineID, int workLocationID, int quantity) {
        String sql = "INSERT INTO VaccineWarehouse (vaccineID, workLocationID, quantity) VALUES (?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, vaccineID);
            pstmt.setInt(2, workLocationID);
            pstmt.setInt(3, quantity);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public VaccineWarehouse getWarehouseById(int warehouseID) {
        String sql = "SELECT * FROM VaccineWarehouse WHERE warehouseID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, warehouseID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int vaccineID = rs.getInt("vaccineID");
                int workLocationID = rs.getInt("workLocationID");
                int quantity = rs.getInt("quantity");

                return new VaccineWarehouse(warehouseID, vaccineID, workLocationID, quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if warehouse with given ID is not found or on error
    }
    
    public boolean updateWarehouse(int warehouseID, int vaccineID, int workLocationID, int quantity) {
        String sql = "UPDATE VaccineWarehouse SET vaccineID = ?, workLocationID = ?, quantity = ? WHERE warehouseID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, vaccineID);
            pstmt.setInt(2, workLocationID);
            pstmt.setInt(3, quantity);
            pstmt.setInt(4, warehouseID);

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteWarehouse(int warehouseID) {
        String sql = "DELETE FROM VaccineWarehouse WHERE warehouseID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, warehouseID);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
