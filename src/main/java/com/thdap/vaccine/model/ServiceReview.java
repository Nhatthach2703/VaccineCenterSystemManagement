package com.thdap.vaccine.model;

import java.util.Date;

public class ServiceReview {
    private int reviewID;
    private int userID;
    private String content;
    private int rate;
    private Date date;
    private String type;

    public ServiceReview(int reviewID, int userID, String content, int rate, Date date, String type) {
        this.reviewID = reviewID;
        this.userID = userID;
        this.content = content;
        this.rate = rate;
        this.date = date;
        this.type = type;
    }

    public ServiceReview() {
    }

    // Getters and setters
    public int getReviewID() {
        return reviewID;
    }

    public void setReviewID(int reviewID) {
        this.reviewID = reviewID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "ServiceReview{" +
                "reviewID=" + reviewID +
                ", userID=" + userID +
                ", content='" + content + '\'' +
                ", rate=" + rate +
                ", date=" + date +
                ", type='" + type + '\'' +
                '}';
    }
}
