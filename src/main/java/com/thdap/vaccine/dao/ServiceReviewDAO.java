package com.thdap.vaccine.dao;

import com.thdap.vaccine.model.ServiceReview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date; // Import Date from java.sql package
import java.util.ArrayList;
import java.util.List;

public class ServiceReviewDAO {

    private ContextDAO contextDAO;

    public ServiceReviewDAO() {
        contextDAO = new ContextDAO(); // Assuming ContextDAO manages database connection
    }

public void insertServiceReview(int userID, String content, int rate) throws SQLException {
    String query = "INSERT INTO ServiceReviews (userID, content, rate, date) VALUES (?, ?, ?, GETDATE())"; 
    try (Connection conn = contextDAO.getConnection(); PreparedStatement pstmt = conn.prepareStatement(query)) {
        pstmt.setInt(1, userID);
        pstmt.setString(2, content);
        pstmt.setInt(3, rate);
        pstmt.executeUpdate();
    }
}




    // Method to retrieve all reviews from the ServiceReviews table
    public List<ServiceReview> getAllServiceReviews() {
    List<ServiceReview> reviews = new ArrayList<>();
    String query = "SELECT * FROM ServiceReviews ORDER BY reviewID DESC";
    try (Connection conn = contextDAO.getConnection(); 
         PreparedStatement pstmt = conn.prepareStatement(query); 
         ResultSet resultSet = pstmt.executeQuery()) {
        while (resultSet.next()) {
            int reviewID = resultSet.getInt("reviewID");
            int userID = resultSet.getInt("userID");
            String content = resultSet.getString("content");
            int rate = resultSet.getInt("rate");
            Date date = resultSet.getDate("date");

            ServiceReview review = new ServiceReview(reviewID, userID, content, rate, date);
            reviews.add(review);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return reviews;
}


   public static void main(String[] args) {
    // Create instance of ServiceReviewDAO
    ServiceReviewDAO serviceReviewDAO = new ServiceReviewDAO();

    try {
        // Inserting a review
        serviceReviewDAO.insertServiceReview(3, "hello", 5);

        // Retrieving all reviews
        List<ServiceReview> reviews = serviceReviewDAO.getAllServiceReviews();

        // Displaying retrieved reviews
        for (ServiceReview review : reviews) {
            System.out.println("Review ID: " + review.getReviewID());
            System.out.println("User ID: " + review.getUserID());
            System.out.println("Content: " + review.getContent());
            System.out.println("Rate: " + review.getRate());
            System.out.println("Date: " + review.getDate());
            System.out.println("-----------------------------------------");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

}
