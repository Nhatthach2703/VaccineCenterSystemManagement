/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.Shift;
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
public class ShiftDAO {
    private ContextDAO contextDAO;

    public ShiftDAO() {
        contextDAO = new ContextDAO();
    }
    
    public List<Shift> getAllShifts() {
        List<Shift> shifts = new ArrayList<>();
        String sql = "SELECT * FROM Shift";
        try (Connection conn = contextDAO.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                shifts.add(new Shift(rs.getInt("shiftID"), rs.getTime("startTime").toLocalTime(), rs.getTime("endTime").toLocalTime()));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shifts;
    }
    
//    public static void main(String[] args) {
//        ShiftDAO shiftDAO = new ShiftDAO();
//
//        List<Shift> shifts = shiftDAO.getAllShifts();
//        for (Shift shift : shifts) {
//            System.out.println(shift);
//        }
//    }
}
