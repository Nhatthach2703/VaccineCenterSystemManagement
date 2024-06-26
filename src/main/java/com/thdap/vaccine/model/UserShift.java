/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

import java.time.LocalTime;

/**
 *
 * @author Xuan Vinh
 */
public class UserShift {
    private int userShiftID;
    private int shiftID;
    private LocalTime startTime;
    private LocalTime endTime;

    public UserShift() {
    }

    public UserShift(int userShiftID, int shiftID, LocalTime startTime, LocalTime endTime) {
        this.userShiftID = userShiftID;
        this.shiftID = shiftID;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public int getUserShiftID() {
        return userShiftID;
    }

    public void setUserShiftID(int userShiftID) {
        this.userShiftID = userShiftID;
    }

    public int getShiftID() {
        return shiftID;
    }

    public void setShiftID(int shiftID) {
        this.shiftID = shiftID;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "UserShift{" + "userShiftID=" + userShiftID + ", shiftID=" + shiftID + ", startTime=" + startTime + ", endTime=" + endTime + '}';
    }
    
    
}
