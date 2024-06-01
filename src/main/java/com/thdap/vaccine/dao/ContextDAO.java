/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Xuan Vinh
 */
public class ContextDAO {
    private String url = "jdbc:sqlserver://localhost:1433;databaseName=VaccineSystem;encrypt=false;";
    private String className = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String username = "sa";
    private String password = "123123";

    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(className);
            conn = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.out.println(e);
        }
        return conn;
    }
    
    public static void main(String[] args) {
        try {
            ContextDAO dbcontext = new ContextDAO();
            if (dbcontext.getConnection() != null) {
                System.out.println("connect successfully");
            } else {
                System.out.println("not connect");
            }
        } catch (Exception e) {
        }
    }
    
}
