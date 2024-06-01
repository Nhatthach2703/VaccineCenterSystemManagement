/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

/**
 *
 * @author Xuan Vinh
 */
public class Admin {
    private int adminID;
    private String fullName;
    private int accountID;
    private String image;
    private String email;
    private String phoneNumber;

    public Admin() {
    }

    public Admin(int adminID, String fullName, int accountID, String image, String email, String phoneNumber) {
        this.adminID = adminID;
        this.fullName = fullName;
        this.accountID = accountID;
        this.image = image;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Override
    public String toString() {
        return "Admin{" + "adminID=" + adminID + ", fullName=" + fullName + ", accountID=" + accountID + ", image=" + image + ", email=" + email + ", phoneNumber=" + phoneNumber + '}';
    }
    
}
