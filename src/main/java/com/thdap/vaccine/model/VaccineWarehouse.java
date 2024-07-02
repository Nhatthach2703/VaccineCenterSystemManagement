package com.thdap.vaccine.model;
public class VaccineWarehouse {
    private int warehouseID;
    private int vaccineID;
    private int workLocationID;
    private long quantity;

    // Constructor
    public VaccineWarehouse(int warehouseID, int vaccineID, int workLocationID, long quantity) {
        this.warehouseID = warehouseID;
        this.vaccineID = vaccineID;
        this.workLocationID = workLocationID;
        this.quantity = quantity;
    }

    // Getters and Setters
    public int getWarehouseID() {
        return warehouseID;
    }

    public void setWarehouseID(int warehouseID) {
        this.warehouseID = warehouseID;
    }

    public int getVaccineID() {
        return vaccineID;
    }

    public void setVaccineID(int vaccineID) {
        this.vaccineID = vaccineID;
    }

    public int getWorkLocationID() {
        return workLocationID;
    }

    public void setWorkLocationID(int workLocationID) {
        this.workLocationID = workLocationID;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "VaccineWarehouse{" +
                "warehouseID=" + warehouseID +
                ", vaccineID=" + vaccineID +
                ", workLocationID=" + workLocationID +
                ", quantity=" + quantity +
                '}';
    }
}