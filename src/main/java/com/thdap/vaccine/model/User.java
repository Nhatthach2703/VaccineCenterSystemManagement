/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

import java.sql.Date;

/**
 *
 * @author Xuan Vinh
 */
public class User {
    private int userID;
    private String fullName;
    private int accountID;
    private String image;
    private String email;
    private Date doB;
    private String phoneNumber;
    private String address;
    private String gender;

    public User() {
    }

    public User(int userID, String fullName, int accountID, String image, String email, Date doB, String phoneNumber, String address, String gender) {
        this.userID = userID;
        this.fullName = fullName;
        this.accountID = accountID;
        this.image = image;
        this.email = email;
        this.doB = doB;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.gender = gender;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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

    public Date getDoB() {
        return doB;
    }

    public void setDoB(Date doB) {
        this.doB = doB;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", fullName=" + fullName + ", accountID=" + accountID + ", image=" + image + ", email=" + email + ", doB=" + doB + ", phoneNumber=" + phoneNumber + ", address=" + address + ", gender=" + gender + '}';
    }
    
    
}
