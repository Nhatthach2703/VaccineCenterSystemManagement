/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.thdap.vaccine.model;

/**
 *
 * @author Xuan Vinh
 */
public class Vaccine {
    private int vaccineID;
    private String name;
    private String summary;
    private String source;
    private int typeID;
    private String image;
    private String injectionRoute;
    private String contraindicated;
    private String usingNote;
    private String drugInteractions;
    private String unwantedEffects;
    private String preserve;
    private String objectOfUse;
    private String injectionRegimen;
    private int price;
    private boolean haveToOrder;

    public Vaccine() {
    }

    public Vaccine(int vaccineID, String name,int typeID , String source, String image,String summary) {
        this.vaccineID = vaccineID;
        this.name = name;
        this.typeID = typeID;
        this.source = source;
         this.image = image;
        this.summary = summary;
       
    }

   

    public Vaccine(int vaccineID, String name, String summary, String source, int typeID, String image, String injectionRoute, String contraindicated, String usingNote, String drugInteractions, String unwantedEffects, String preserve, String objectOfUse, String injectionRegimen, int price, boolean haveToOrder) {
        this.vaccineID = vaccineID;
        this.name = name;
        this.summary = summary;
        this.source = source;
        this.typeID = typeID;
        this.image = image;
        this.injectionRoute = injectionRoute;
        this.contraindicated = contraindicated;
        this.usingNote = usingNote;
        this.drugInteractions = drugInteractions;
        this.unwantedEffects = unwantedEffects;
        this.preserve = preserve;
        this.objectOfUse = objectOfUse;
        this.injectionRegimen = injectionRegimen;
        this.price = price;
        this.haveToOrder = haveToOrder;
    }

    public Vaccine(int vaccineID, String name, String source, int typeID, String image, String objectOfUse, int price) {
        this.vaccineID = vaccineID;
        this.name = name;
        this.source = source;
        this.typeID = typeID;
        this.image = image;
        this.objectOfUse = objectOfUse;
        this.price = price;
    }

    public Vaccine(int vaccineID,String image, String name, String source, int price) {
        this.vaccineID = vaccineID;
        this.image = image;
        this.name = name;
        this.source = source;
        this.price = price;
    }


    public int getVaccineID() {
        return vaccineID;
    }

    public void setVaccineID(int vaccineID) {
        this.vaccineID = vaccineID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public int getTypeID() {
        return typeID;
    }

    public void setTypeID(int typeID) {
        this.typeID = typeID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getInjectionRoute() {
        return injectionRoute;
    }

    public void setInjectionRoute(String injectionRoute) {
        this.injectionRoute = injectionRoute;
    }

    public String getContraindicated() {
        return contraindicated;
    }

    public void setContraindicated(String contraindicated) {
        this.contraindicated = contraindicated;
    }

    public String getUsingNote() {
        return usingNote;
    }

    public void setUsingNote(String usingNote) {
        this.usingNote = usingNote;
    }

    public String getDrugInteractions() {
        return drugInteractions;
    }

    public void setDrugInteractions(String drugInteractions) {
        this.drugInteractions = drugInteractions;
    }

    public String getUnwantedEffects() {
        return unwantedEffects;
    }

    public void setUnwantedEffects(String unwantedEffects) {
        this.unwantedEffects = unwantedEffects;
    }

    public String getPreserve() {
        return preserve;
    }

    public void setPreserve(String preserve) {
        this.preserve = preserve;
    }

    public String getObjectOfUse() {
        return objectOfUse;
    }

    public void setObjectOfUse(String objectOfUse) {
        this.objectOfUse = objectOfUse;
    }

    public String getInjectionRegimen() {
        return injectionRegimen;
    }

    public void setInjectionRegimen(String injectionRegimen) {
        this.injectionRegimen = injectionRegimen;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isHaveToOrder() {
        return haveToOrder;
    }

    public void setHaveToOrder(boolean haveToOrder) {
        this.haveToOrder = haveToOrder;
    }

    @Override
    public String toString() {
        return "Vaccine{" + "vaccineID=" + vaccineID + ", name=" + name + ", summary=" + summary + ", source=" + source + ", typeID=" + typeID + ", image=" + image + ", injectionRoute=" + injectionRoute + ", contraindicated=" + contraindicated + ", usingNote=" + usingNote + ", drugInteractions=" + drugInteractions + ", unwantedEffects=" + unwantedEffects + ", preserve=" + preserve + ", objectOfUse=" + objectOfUse + ", injectionRegimen=" + injectionRegimen + ", price=" + price + ", haveToOrder=" + haveToOrder + '}';
    }
    
   
    
}
