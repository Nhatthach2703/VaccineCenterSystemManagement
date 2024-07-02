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
public class Doctor {
    private int doctorID;
    private String fullName;
    private int accountID;
    private String image;
    private String email;
    private Date doB;
    private String phoneNumber;
    private String address;
    private String gender;
    private int workLocationID;
    private String jobTitle;
    private String degreeType;
    private int yearsOfExperience;

    public Doctor() {
    }

    public Doctor(int doctorID, String fullName, int accountID, String image, String email, Date doB, String phoneNumber, String address, String gender, int workLocationID, String jobTitle, String degreeType, int yearsOfExperience) {
        this.doctorID = doctorID;
        this.fullName = fullName;
        this.accountID = accountID;
        this.image = image;
        this.email = email;
        this.doB = doB;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.gender = gender;
        this.workLocationID = workLocationID;
        this.jobTitle = jobTitle;
        this.degreeType = degreeType;
        this.yearsOfExperience = yearsOfExperience;
    }

     public Doctor(int doctorID, String fullName, int accountID, String email, Date doB, String phoneNumber, String address, String gender, int workLocationID, String jobTitle, String degreeType, int yearsOfExperience) {
        this.doctorID = doctorID;
        this.fullName = fullName;
        this.accountID = accountID;
        this.email = email;
        this.doB = doB;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.gender = gender;
        this.workLocationID = workLocationID;
        this.jobTitle = jobTitle;
        this.degreeType = degreeType;
        this.yearsOfExperience = yearsOfExperience;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
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

    public int getWorkLocationID() {
        return workLocationID;
    }

    public void setWorkLocationID(int workLocationID) {
        this.workLocationID = workLocationID;
    }

    public String getDegreeType() {
        return degreeType;
    }

    public void setDegreeType(String degreeType) {
        this.degreeType = degreeType;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }
    

    public int getYearsOfExperience() {
        return yearsOfExperience;
    }

    public void setYearsOfExperience(int yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }

    @Override
    public String toString() {
        return "Doctor{" + "doctorID=" + doctorID + ", fullName=" + fullName + ", accountID=" + accountID + ", image=" + image + ", email=" + email + ", doB=" + doB + ", phoneNumber=" + phoneNumber + ", address=" + address + ", gender=" + gender + ", workLocationID=" + workLocationID + ", jobTitle=" + jobTitle + ", degreeType=" + degreeType + ", yearsOfExperience=" + yearsOfExperience + '}';
    }

    
    
}
