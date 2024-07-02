/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

/**
 *
 * @author Xuan Vinh
 */
public class UserFile {
    private int userFileID;
    private int userID;
    private String healthInsuranceCardNumber;
    private String bloodType;
    private String medicalHistory;
    private String historyOfDrugAllergies;

    public UserFile() {
    }

    public UserFile( int userID, String healthInsuranceCardNumber, String bloodType, String medicalHistory, String historyOfDrugAllergies) {
        this.userID = userID;
        this.healthInsuranceCardNumber = healthInsuranceCardNumber;
        this.bloodType = bloodType;
        this.medicalHistory = medicalHistory;
        this.historyOfDrugAllergies = historyOfDrugAllergies;
    }

    public int getUserFileID() {
        return userFileID;
    }

    public void setUserFileID(int userFileID) {
        this.userFileID = userFileID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getHealthInsuranceCardNumber() {
        return healthInsuranceCardNumber;
    }

    public void setHealthInsuranceCardNumber(String healthInsuranceCardNumber) {
        this.healthInsuranceCardNumber = healthInsuranceCardNumber;
    }

    public String getBloodType() {
        return bloodType;
    }

    public void setBloodType(String bloodType) {
        this.bloodType = bloodType;
    }

    public String getMedicalHistory() {
        return medicalHistory;
    }

    public void setMedicalHistory(String medicalHistory) {
        this.medicalHistory = medicalHistory;
    }

    public String getHistoryOfDrugAllergies() {
        return historyOfDrugAllergies;
    }

    public void setHistoryOfDrugAllergies(String historyOfDrugAllergies) {
        this.historyOfDrugAllergies = historyOfDrugAllergies;
    }

    @Override
    public String toString() {
        return "UserFile{" + "userFileID=" + userFileID + ", userID=" + userID + ", healthInsuranceCardNumber=" + healthInsuranceCardNumber + ", bloodType=" + bloodType + ", medicalHistory=" + medicalHistory + ", historyOfDrugAllergies=" + historyOfDrugAllergies + '}';
    }
    
    
}
