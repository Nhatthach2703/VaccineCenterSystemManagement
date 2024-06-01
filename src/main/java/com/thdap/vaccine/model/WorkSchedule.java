/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

import java.time.LocalDate;

/**
 *
 * @author Xuan Vinh
 */
public class WorkSchedule {
    private int workScheduleID;
    private int roomID;
    private int shiftID;
    private int doctorID;
    private int workLocationID;
    private LocalDate date;
    private int numberOfPatients;

    public WorkSchedule() {
    }

    public WorkSchedule(int workScheduleID, int roomID, int shiftID, int doctorID, int workLocationID, LocalDate date, int numberOfPatients) {
        this.workScheduleID = workScheduleID;
        this.roomID = roomID;
        this.shiftID = shiftID;
        this.doctorID = doctorID;
        this.workLocationID = workLocationID;
        this.date = date;
        this.numberOfPatients = numberOfPatients;
    }

    public WorkSchedule(int roomID, int shiftID, int doctorID, int workLocationID, LocalDate date, int numberOfPatients) {
        this.roomID = roomID;
        this.shiftID = shiftID;
        this.doctorID = doctorID;
        this.workLocationID = workLocationID;
        this.date = date;
        this.numberOfPatients = numberOfPatients;
    }
    
    

    public int getWorkScheduleID() {
        return workScheduleID;
    }

    public void setWorkScheduleID(int workScheduleID) {
        this.workScheduleID = workScheduleID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getShiftID() {
        return shiftID;
    }

    public void setShiftID(int shiftID) {
        this.shiftID = shiftID;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public int getWorkLocationID() {
        return workLocationID;
    }

    public void setWorkLocationID(int workLocationID) {
        this.workLocationID = workLocationID;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getNumberOfPatients() {
        return numberOfPatients;
    }

    public void setNumberOfPatients(int numberOfPatients) {
        this.numberOfPatients = numberOfPatients;
    }

    @Override
    public String toString() {
        return "WorkSchedule{" + "workScheduleID=" + workScheduleID + ", roomID=" + roomID + ", shiftID=" + shiftID + ", doctorID=" + doctorID + ", workLocationID=" + workLocationID + ", date=" + date + ", numberOfPatients=" + numberOfPatients + '}';
    }
    
    
    
}
