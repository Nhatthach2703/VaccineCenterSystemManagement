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
public class News {
    private int newID;
    private String title;
    private String image;
    private String content;
    private int doctorID;
    private Date date;

    public News() {
    }

    public News(int newID, String title, String image, String content, int doctorID, Date date) {
        this.newID = newID;
        this.title = title;
        this.image = image;
        this.content = content;
        this.doctorID = doctorID;
        this.date = date;
    }

    public int getNewID() {
        return newID;
    }

    public void setNewID(int newID) {
        this.newID = newID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "News{" + "newID=" + newID + ", title=" + title + ", image=" + image + ", content=" + content + ", doctorID=" + doctorID + ", date=" + date + '}';
    }
}
