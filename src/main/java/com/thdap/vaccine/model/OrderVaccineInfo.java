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
public class OrderVaccineInfo {
    private int orderInfoID;
    private int userID;
    private Date createDate;
    private Date dateWantToGetVaccinated;
    private int workLocationID;
    private int vaccineID;
    private boolean confirmStatus;
    private String paymentStatus;
    private double totalPrice;

    public OrderVaccineInfo() {
    }

    public OrderVaccineInfo(int orderInfoID, int userID, Date createDate, Date dateWantToGetVaccinated, int workLocationID, int vaccineID, boolean confirmStatus, String paymentStatus, double totalPrice) {
        this.orderInfoID = orderInfoID;
        this.userID = userID;
        this.createDate = createDate;
        this.dateWantToGetVaccinated = dateWantToGetVaccinated;
        this.workLocationID = workLocationID;
        this.vaccineID = vaccineID;
        this.confirmStatus = confirmStatus;
        this.paymentStatus = paymentStatus;
        this.totalPrice = totalPrice;
    }

    public OrderVaccineInfo(int userID, Date createDate, Date dateWantToGetVaccinated, int workLocationID, int vaccineID, boolean confirmStatus, String paymentStatus, double totalPrice) {
        this.userID = userID;
        this.createDate = createDate;
        this.dateWantToGetVaccinated = dateWantToGetVaccinated;
        this.workLocationID = workLocationID;
        this.vaccineID = vaccineID;
        this.confirmStatus = confirmStatus;
        this.paymentStatus = paymentStatus;
        this.totalPrice = totalPrice;
    }

    public int getOrderInfoID() {
        return orderInfoID;
    }

    public void setOrderInfoID(int orderInfoID) {
        this.orderInfoID = orderInfoID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getDateWantToGetVaccinated() {
        return dateWantToGetVaccinated;
    }

    public void setDateWantToGetVaccinated(Date dateWantToGetVaccinated) {
        this.dateWantToGetVaccinated = dateWantToGetVaccinated;
    }

    public int getWorkLocationID() {
        return workLocationID;
    }

    public void setWorkLocationID(int workLocationID) {
        this.workLocationID = workLocationID;
    }

    public int getVaccineID() {
        return vaccineID;
    }

    public void setVaccineID(int vaccineID) {
        this.vaccineID = vaccineID;
    }

    public boolean isConfirmStatus() {
        return confirmStatus;
    }

    public void setConfirmStatus(boolean confirmStatus) {
        this.confirmStatus = confirmStatus;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "OrderVaccineInfo{" + "orderInfoID=" + orderInfoID + ", userID=" + userID + ", createDate=" + createDate + ", dateWantToGetVaccinated=" + dateWantToGetVaccinated + ", workLocationID=" + workLocationID + ", vaccineID=" + vaccineID + ", confirmStatus=" + confirmStatus + ", paymentStatus=" + paymentStatus + ", totalPrice=" + totalPrice + '}';
    }
    
}
