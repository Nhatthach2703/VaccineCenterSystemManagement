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
public class InjectionInfo {
    private int injectionInfoID;
    private int userFileID;
    private Date injectionDate;
    private int vaccineID;
    private String patientStatus;
    private Date dateOfNextInjection;

    public InjectionInfo() {
    }

    public InjectionInfo(int userFileID, Date injectionDate, int vaccineID, String patientStatus, Date dateOfNextInjection) {
        this.userFileID = userFileID;
        this.injectionDate = injectionDate;
        this.vaccineID = vaccineID;
        this.patientStatus = patientStatus;
        this.dateOfNextInjection = dateOfNextInjection;
    }

    public int getInjectionInfoID() {
        return injectionInfoID;
    }

    public void setInjectionInfoID(int injectionInfoID) {
        this.injectionInfoID = injectionInfoID;
    }

    public int getUserFileID() {
        return userFileID;
    }

    public void setUserFileID(int userFileID) {
        this.userFileID = userFileID;
    }

    public Date getInjectionDate() {
        return injectionDate;
    }

    public void setInjectionDate(Date injectionDate) {
        this.injectionDate = injectionDate;
    }

    public int getVaccineID() {
        return vaccineID;
    }

    public void setVaccineID(int vaccineID) {
        this.vaccineID = vaccineID;
    }

    public String getPatientStatus() {
        return patientStatus;
    }

    public void setPatientStatus(String patientStatus) {
        this.patientStatus = patientStatus;
    }

    public Date getDateOfNextInjection() {
        return dateOfNextInjection;
    }

    public void setDateOfNextInjection(Date dateOfNextInjection) {
        this.dateOfNextInjection = dateOfNextInjection;
    }

    @Override
    public String toString() {
        return "InjectionInfo{" + "injectionInfoID=" + injectionInfoID + ", userFileID=" + userFileID + ", injectionDate=" + injectionDate + ", vaccineID=" + vaccineID + ", patientStatus=" + patientStatus + ", dateOfNextInjection=" + dateOfNextInjection + '}';
    }
    
}
