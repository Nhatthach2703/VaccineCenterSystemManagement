package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.InjectionRegimen;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InjectionRegimenDAO {
    private ContextDAO contextDAO;

    public InjectionRegimenDAO() {
        contextDAO = new ContextDAO();
    }

    public List<InjectionRegimen> getAllInjectionRegimens() {
        List<InjectionRegimen> injectionRegimens = new ArrayList<>();
        String query = "SELECT * FROM InjectionRegimen";
        try (Connection conn = contextDAO.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                InjectionRegimen injectionRegimen = new InjectionRegimen(
                        rs.getInt("injectionRegimenID"),
                        rs.getString("object"),
                        rs.getString("diseasePreventionVaccine"),
                        rs.getString("ageMilestone"),
                        rs.getString("content")
                );
                injectionRegimens.add(injectionRegimen);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return injectionRegimens;
    }

public Map<String, List<InjectionRegimen>> getInjectionRegimensByObject(String object) {
    Map<String, List<InjectionRegimen>> regimensMap = new HashMap<>();
    String query = "SELECT * FROM InjectionRegimen WHERE object = ?";
    try (Connection conn = contextDAO.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(query)) {
        pstmt.setString(1, object);
        try (ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                InjectionRegimen injectionRegimen = new InjectionRegimen(
                        rs.getInt("injectionRegimenID"),
                        rs.getString("object"),
                        rs.getString("diseasePreventionVaccine"),
                        rs.getString("ageMilestone"),
                        rs.getString("content")
                );
                String regimenObject = injectionRegimen.getObject();
                if (!regimensMap.containsKey(regimenObject)) {
                    regimensMap.put(regimenObject, new ArrayList<>());
                }
                regimensMap.get(regimenObject).add(injectionRegimen);
            }
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return regimensMap;
}

    public static void main(String[] args) {
        InjectionRegimenDAO injectionRegimenDAO = new InjectionRegimenDAO();
        List<InjectionRegimen> injectionRegimens = injectionRegimenDAO.getAllInjectionRegimens();

        for (InjectionRegimen injectionRegimen : injectionRegimens) {
            System.out.println(injectionRegimen);
        }
    }
}
