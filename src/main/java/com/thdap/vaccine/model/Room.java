/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

/**
 *
 * @author Xuan Vinh
 */
public class Room {
    private int roomID;
    private String roomName;
    private int workLocationID;

    public Room() {
    }

    public Room(int roomID, String roomName, int workLocationID) {
        this.roomID = roomID;
        this.roomName = roomName;
        this.workLocationID = workLocationID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getWorkLocationID() {
        return workLocationID;
    }

    public void setWorkLocationID(int workLocationID) {
        this.workLocationID = workLocationID;
    }

    @Override
    public String toString() {
        return "Room{" + "roomID=" + roomID + ", roomName=" + roomName + ", workLocationID=" + workLocationID + '}';
    }

    
    
}
