/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

/**
 *
 * @author Xuan Vinh
 */
public class Account {
    private int accountID;
    private String roleID;
    private String username;
    private String password;
    private String email;
    private boolean status;

    public Account() {
    }

    public Account(int accountID, String roleID, String username, String password, String email, boolean status) {
        this.accountID = accountID;
        this.roleID = roleID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.status = status;
    }
    
    

    public Account(int accountID, String roleID, String username, String password, String email) {
        this.accountID = accountID;
        this.roleID = roleID;
        this.username = username;
        this.password = password;
        this.email = email;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" + "accountID=" + accountID + ", roleID=" + roleID + ", username=" + username + ", password=" + password + ", email=" + email + ", status=" + status + '}';
    }
    
    

    
    
    
}
