/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

/**
 *
 * @author Xuan Vinh
 */
public class WorkLocation {
    private int workLocationID;
    private String name;
    private String address;
    private String map;

    public WorkLocation() {
    }

    public WorkLocation(int workLocationID, String name, String address, String map) {
        this.workLocationID = workLocationID;
        this.name = name;
        this.address = address;
        this.map = map;
    }

    public int getWorkLocationID() {
        return workLocationID;
    }

    public void setWorkLocationID(int workLocationID) {
        this.workLocationID = workLocationID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMap() {
        return map;
    }

    public void setMap(String map) {
        this.map = map;
    }

    @Override
    public String toString() {
        return "WorkLocation{" + "workLocationID=" + workLocationID + ", name=" + name + ", address=" + address + ", map=" + map + '}';
    }
}
