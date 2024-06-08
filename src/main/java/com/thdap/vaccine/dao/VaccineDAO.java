/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.TypeOfVaccine;
import com.thdap.vaccine.model.Vaccine;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import static org.eclipse.persistence.config.TargetDatabase.Database;

/**
 *
 * @author Xuan Vinh
 */
public class VaccineDAO {

    private ContextDAO contextDAO;

    public VaccineDAO() {
        contextDAO = new ContextDAO();
    }

    public List<Vaccine> getAllVaccines() {
        List<Vaccine> vaccines = new ArrayList<>();
        String query = "SELECT * FROM Vaccine";
        try (Connection conn = contextDAO.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Vaccine vaccine = new Vaccine(
                        rs.getInt("vaccineID"),
                        rs.getString("name"),
                        rs.getString("summary"),
                        rs.getString("source"),
                        rs.getInt("typeID"),
                        rs.getString("image"),
                        rs.getString("injectionRoute"),
                        rs.getString("contraindicated"),
                        rs.getString("usingNote"),
                        rs.getString("drugInteractions"),
                        rs.getString("unwantedEffects"),
                        rs.getString("preserve"),
                        rs.getString("objectOfUse"),
                        rs.getString("injectionRegimen"),
                        rs.getInt("price"),
                        rs.getBoolean("haveToOrder")
                );
                vaccines.add(vaccine);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vaccines;
    }

    public List<Vaccine> getVaccines() {
        List<Vaccine> vaccines = new ArrayList<>();
        String query = "SELECT vaccineID, name,typeID,source,image,summary FROM Vaccine";
        try (Connection conn = contextDAO.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Vaccine vaccine = new Vaccine(
                        rs.getInt("vaccineID"),
                        rs.getString("name"),
                        rs.getInt("typeID"),
                        rs.getString("source"),
                        rs.getString("image"),
                        rs.getString("summary")
                );
                vaccines.add(vaccine);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vaccines;
    }

    public List<Vaccine> getVaccinesByType(int typeID) {
        List<Vaccine> vaccines = new ArrayList<>();
        String query = "SELECT vaccineID, name, typeID, source, image, summary FROM Vaccine WHERE typeID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, typeID);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Vaccine vaccine = new Vaccine(
                            rs.getInt("vaccineID"),
                            rs.getString("name"),
                            rs.getInt("typeID"),
                            rs.getString("source"),
                            rs.getString("image"),
                            rs.getString("summary")
                    );
                    vaccines.add(vaccine);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vaccines;
    }

    public Vaccine getVaccineById(int vaccineID) {
        Vaccine vaccine = null;
        String query = "SELECT * FROM Vaccine WHERE vaccineID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, vaccineID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    vaccine = new Vaccine(
                            rs.getInt("vaccineID"),
                            rs.getString("name"),
                            rs.getString("summary"),
                            rs.getString("source"),
                            rs.getInt("typeID"),
                            rs.getString("image"),
                            rs.getString("injectionRoute"),
                            rs.getString("contraindicated"),
                            rs.getString("usingNote"),
                            rs.getString("drugInteractions"),
                            rs.getString("unwantedEffects"),
                            rs.getString("preserve"),
                            rs.getString("objectOfUse"),
                            rs.getString("injectionRegimen"),
                            rs.getInt("price"),
                            rs.getBoolean("haveToOrder")
                    );
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vaccine;
    }

    public void deleteVaccine(int vaccineID) {
        String query = "DELETE FROM Vaccine WHERE vaccineID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, vaccineID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateVaccine(Vaccine vaccine) {
        String query = "UPDATE Vaccine SET name = ?, summary = ?, source = ?, typeID = ?, image = ?, injectionRoute = ?, contraindicated = ?, usingNote = ?, drugInteractions = ?, unwantedEffects = ?, preserve = ?, objectOfUse = ?, injectionRegimen = ?, price = ?, haveToOrder = ? WHERE vaccineID = ?";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, vaccine.getName());
            pstmt.setString(2, vaccine.getSummary());
            pstmt.setString(3, vaccine.getSource());
            pstmt.setInt(4, vaccine.getTypeID());
            pstmt.setString(5, vaccine.getImage());
            pstmt.setString(6, vaccine.getInjectionRoute());
            pstmt.setString(7, vaccine.getContraindicated());
            pstmt.setString(8, vaccine.getUsingNote());
            pstmt.setString(9, vaccine.getDrugInteractions());
            pstmt.setString(10, vaccine.getUnwantedEffects());
            pstmt.setString(11, vaccine.getPreserve());
            pstmt.setString(12, vaccine.getObjectOfUse());
            pstmt.setString(13, vaccine.getInjectionRegimen());
            pstmt.setInt(14, vaccine.getPrice());
            pstmt.setBoolean(15, vaccine.isHaveToOrder());
            pstmt.setInt(16, vaccine.getVaccineID());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addVaccine(String name, String summary, String source, int typeID, String filename, String injectionRoute, String contraindicated, String usingNote, String drugInteractions, String unwantedEffects, String preserve, String objectOfUse, String injectionRegimen, int price, boolean haveToOrder) {
        String query = "INSERT INTO Vaccine (name, summary, source, typeID, image, injectionRoute, contraindicated, usingNote, drugInteractions, unwantedEffects, preserve, objectOfUse, injectionRegimen, price, haveToOrder) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, name);
            pstmt.setString(2, summary);
            pstmt.setString(3, source);
            pstmt.setInt(4, typeID);
            pstmt.setString(5, filename);
            pstmt.setString(6, injectionRoute);
            pstmt.setString(7, contraindicated);
            pstmt.setString(8, usingNote);
            pstmt.setString(9, drugInteractions);
            pstmt.setString(10, unwantedEffects);
            pstmt.setString(11, preserve);
            pstmt.setString(12, objectOfUse);
            pstmt.setString(13, injectionRegimen);
            pstmt.setInt(14, price);
            pstmt.setBoolean(15, haveToOrder);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
//    hàm check cho update và add

    public boolean isVaccineExists(String name) throws SQLException {
        String query = "SELECT COUNT(*) FROM Vaccine WHERE name = ?";
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
//   search 

    public List<Vaccine> searchVaccinesByTypeName(String typeName) {
        List<Vaccine> vaccines = new ArrayList<>();
        String query = "SELECT v.* FROM Vaccine v JOIN TypeOfVaccine t ON v.typeID = t.typeID WHERE t.name LIKE ?";

        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, "%" + typeName + "%");

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Vaccine vaccine = new Vaccine(
                            rs.getInt("vaccineID"),
                            rs.getString("name"),
                            rs.getString("summary"),
                            rs.getString("source"),
                            rs.getInt("typeID"),
                            rs.getString("image"),
                            rs.getString("injectionRoute"),
                            rs.getString("contraindicated"),
                            rs.getString("usingNote"),
                            rs.getString("drugInteractions"),
                            rs.getString("unwantedEffects"),
                            rs.getString("preserve"),
                            rs.getString("objectOfUse"),
                            rs.getString("injectionRegimen"),
                            rs.getInt("price"),
                            rs.getBoolean("haveToOrder")
                    );
                    vaccines.add(vaccine);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vaccines;
    }

    public List<Vaccine> searchVaccines(Optional<String> name) {
        List<Vaccine> vaccines = new ArrayList<>();
        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM Vaccine WHERE 1=1");

        if (name.isPresent() && !name.get().isEmpty()) {
            queryBuilder.append(" AND name LIKE ?");
        }

        String query = queryBuilder.toString();

        try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            int paramIndex = 1;

            if (name.isPresent() && !name.get().isEmpty()) {
                stmt.setString(paramIndex++, "%" + name.get() + "%");
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Vaccine vaccine = new Vaccine(
                            rs.getInt("vaccineID"),
                            rs.getString("name"),
                            rs.getString("summary"),
                            rs.getString("source"),
                            rs.getInt("typeID"),
                            rs.getString("image"),
                            rs.getString("injectionRoute"),
                            rs.getString("contraindicated"),
                            rs.getString("usingNote"),
                            rs.getString("drugInteractions"),
                            rs.getString("unwantedEffects"),
                            rs.getString("preserve"),
                            rs.getString("objectOfUse"),
                            rs.getString("injectionRegimen"),
                            rs.getInt("price"),
                            rs.getBoolean("haveToOrder")
                    );
                    vaccines.add(vaccine);
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return vaccines;
    }

    public List<Vaccine> searchVaccinesByOptions(String typeName, String source) {
    List<Vaccine> vaccines = new ArrayList<>();
    String query = "SELECT v.* FROM Vaccine v JOIN TypeOfVaccine t ON v.typeID = t.typeID WHERE 1=1";
    if (typeName != null && !typeName.isEmpty()) {
        query += " AND t.name LIKE ?";
    }
    if (source != null && !source.isEmpty()) {
        query += " AND v.source LIKE ?";
    }

    try (Connection conn = contextDAO.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
        int parameterIndex = 1;
        if (typeName != null && !typeName.isEmpty()) {
            stmt.setString(parameterIndex++, "%" + typeName + "%");
        }
        if (source != null && !source.isEmpty()) {
            stmt.setString(parameterIndex++, "%" + source + "%");
        }

        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Vaccine vaccine = new Vaccine(
                        rs.getInt("vaccineID"),
                        rs.getString("name"),
                        rs.getString("summary"),
                        rs.getString("source"),
                        rs.getInt("typeID"),
                        rs.getString("image"),
                        rs.getString("injectionRoute"),
                        rs.getString("contraindicated"),
                        rs.getString("usingNote"),
                        rs.getString("drugInteractions"),
                        rs.getString("unwantedEffects"),
                        rs.getString("preserve"),
                        rs.getString("objectOfUse"),
                        rs.getString("injectionRegimen"),
                        rs.getInt("price"),
                        rs.getBoolean("haveToOrder")
                );
                vaccines.add(vaccine);
            }
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return vaccines;
}

//  public static void main(String[] args) {
//        // Khởi tạo DAO
//       VaccineDAO vaccineDAO = new VaccineDAO();// Thay YourDAOClass bằng tên lớp DAO thực tế của bạn
//        
//        // Test tìm kiếm vaccine theo loại
//        String typeName = "duyen"; // Thay Type1 bằng loại vaccine cụ thể
//        List<Vaccine> vaccinesByType = vaccineDAO.searchVaccinesByOptions(typeName, null);
//        System.out.println("Vaccines by Type: " + typeName);
//        for (Vaccine vaccine : vaccinesByType) {
//            System.out.println(vaccine);
//        }
//        
//        // Test tìm kiếm vaccine theo nguồn gốc
//        String source = "coconut"; // Thay Source1 bằng nguồn gốc cụ thể
//        List<Vaccine> vaccinesBySource = vaccineDAO.searchVaccinesByOptions(null, source);
//        System.out.println("\nVaccines by Source: " + source);
//        for (Vaccine vaccine : vaccinesBySource) {
//            System.out.println(vaccine);
//        }
//        
//        // Test tìm kiếm vaccine theo cả loại và nguồn gốc
//        List<Vaccine> vaccinesByTypeAndSource = vaccineDAO.searchVaccinesByOptions(typeName, source);
//        System.out.println("\nVaccines by Type and Source: " + typeName + " - " + source);
//        for (Vaccine vaccine : vaccinesByTypeAndSource) {
//            System.out.println(vaccine);
//        }
//    }
//}

    public static void main(String[] args) {
        VaccineDAO vaccineDAO = new VaccineDAO();

        // Get all vaccines
        List<Vaccine> vaccines = vaccineDAO.getAllVaccines();
        for (Vaccine vaccine : vaccines) {
            System.out.println(vaccine);
        }

    }
}