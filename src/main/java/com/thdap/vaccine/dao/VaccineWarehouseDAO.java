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
}
