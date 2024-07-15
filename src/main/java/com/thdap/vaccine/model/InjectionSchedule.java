/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

/**
 *
 * @author Xuan Vinh
 */
public class InjectionSchedule {
    private int scheduleID;
    private int userID;
    private int workScheduleID;
    private int userShiftID;
    private boolean status;
    private int vaccineID;

    public InjectionSchedule() {
    }

    public InjectionSchedule(int workScheduleID, int userShiftID, boolean status) {
        this.workScheduleID = workScheduleID;
        this.userShiftID = userShiftID;
        this.status = status;
    }

    public InjectionSchedule(int scheduleID, int userID, int workScheduleID, int userShiftID, boolean status, int vaccineID) {
        this.scheduleID = scheduleID;
        this.userID = userID;
        this.workScheduleID = workScheduleID;
        this.userShiftID = userShiftID;
        this.status = status;
        this.vaccineID = vaccineID;
    }

    public InjectionSchedule(int workScheduleID, int userShiftID, boolean status, int vaccineID) {
        this.workScheduleID = workScheduleID;
        this.userShiftID = userShiftID;
        this.status = status;
        this.vaccineID = vaccineID;
    }
    

    public int getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(int scheduleID) {
        this.scheduleID = scheduleID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getWorkScheduleID() {
        return workScheduleID;
    }

    public void setWorkScheduleID(int workScheduleID) {
        this.workScheduleID = workScheduleID;
    }

    public int getUserShiftID() {
        return userShiftID;
    }

    public void setUserShiftID(int userShiftID) {
        this.userShiftID = userShiftID;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getVaccineID() {
        return vaccineID;
    }

    public void setVaccineID(int vaccineID) {
        this.vaccineID = vaccineID;
    }

    @Override
    public String toString() {
        return "InjectionSchedule{" + "scheduleID=" + scheduleID + ", userID=" + userID + ", workScheduleID=" + workScheduleID + ", userShiftID=" + userShiftID + ", status=" + status + ", vaccineID=" + vaccineID + '}';
    }
    
}
