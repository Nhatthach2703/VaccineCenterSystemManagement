/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;


/**
 *
 * @author Xuan Vinh
 */
public class ConsultationSchedule {
    private int scheduleID;
    private int userID;
    private int workScheduleID;
    private int userShiftID;
    private boolean status;

    public ConsultationSchedule() {
    }

    public ConsultationSchedule(int scheduleID, int userID, int workScheduleID, int userShiftID, boolean status) {
        this.scheduleID = scheduleID;
        this.userID = userID;
        this.workScheduleID = workScheduleID;
        this.userShiftID = userShiftID;
        this.status = status;
    }

    public ConsultationSchedule(int workScheduleID, int userShiftID, boolean status) {
        this.workScheduleID = workScheduleID;
        this.userShiftID = userShiftID;
        this.status = status;
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

    @Override
    public String toString() {
        return "ConsultationSchedule{" + "scheduleID=" + scheduleID + ", userID=" + userID + ", workScheduleID=" + workScheduleID + ", userShiftID=" + userShiftID + ", status=" + status + '}';
    }

    
}
