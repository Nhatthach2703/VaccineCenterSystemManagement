/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

public class Notifications {
    private int notificationID;
    private int injectionInfoID;
    private String message;
    private boolean status;

    public Notifications(int notificationID, int injectionInfoID, String message, boolean status) {
        this.notificationID = notificationID;
        this.injectionInfoID = injectionInfoID;
        this.message = message;
        this.status = status;
    }

    public Notifications(int injectionInfoID, String message, boolean status) {
        this.injectionInfoID = injectionInfoID;
        this.message = message;
        this.status = status;
    }
    
    public Notifications() {
    }

  

    // Getters and setters
    public int getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }

    public int getInjectionInfoID() {
        return injectionInfoID;
    }

    public void setInjectionInfoID(int injectionInfoID) {
        this.injectionInfoID = injectionInfoID;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

   

  
}
