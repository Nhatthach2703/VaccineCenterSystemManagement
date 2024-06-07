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
public class ConsultationSchedule {
    private int scheduleID;
    private int userID;
    private int workLocationID;
    private int shiftID;
    private Date date;

    public ConsultationSchedule() {
    }

    public ConsultationSchedule(int scheduleID, int userID, int workLocationID, int shiftID, Date date) {
        this.scheduleID = scheduleID;
        this.userID = userID;
        this.workLocationID = workLocationID;
        this.shiftID = shiftID;
        this.date = date;
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

    public int getWorkLocationID() {
        return workLocationID;
    }

    public void setWorkLocationID(int workLocationID) {
        this.workLocationID = workLocationID;
    }

    public int getShiftID() {
        return shiftID;
    }

    public void setShiftID(int shiftID) {
        this.shiftID = shiftID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "ConsultationSchedule{" + "scheduleID=" + scheduleID + ", userID=" + userID + ", workLocationID=" + workLocationID + ", shiftID=" + shiftID + ", date=" + date + '}';
    }
    

}
