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

    // Method to insert a new service review
   public void insertServiceReview(int userID, String content, int rate, java.util.Date date, String type) throws SQLException {
    String query = "INSERT INTO ServiceReviews (userID, content, rate, date, type) VALUES (?, ?, ?, ?, ?)";
    try (Connection conn = contextDAO.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(query)) {
        pstmt.setInt(1, userID);
        pstmt.setString(2, content);
        pstmt.setInt(3, rate);
        pstmt.setDate(4, new java.sql.Date(date.getTime())); // Convert java.util.Date to java.sql.Date
        pstmt.setString(5, type);

        // Log before executing update
        System.out.println("Executing query: " + pstmt);

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
                String type = resultSet.getString("type");

                ServiceReview review = new ServiceReview(reviewID, userID, content, rate, date, type);
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    // Method to retrieve filtered reviews based on rating, date range, and type
    public List<ServiceReview> getFilteredServiceReviews(int rating, Date startDate, Date endDate, String type) {
        List<ServiceReview> reviews = new ArrayList<>();
        StringBuilder queryBuilder = new StringBuilder("SELECT * FROM ServiceReviews WHERE 1=1");

        // Building the query dynamically based on provided filter criteria
        List<Object> params = new ArrayList<>();
        if (rating >= 1 && rating <= 5) {
            queryBuilder.append(" AND rate = ?");
            params.add(rating);
        }
        if (startDate != null) {
            queryBuilder.append(" AND date >= ?");
            params.add(startDate);
        }
        if (endDate != null) {
            queryBuilder.append(" AND date <= ?");
            params.add(endDate);
        }
        if (type != null && !type.isEmpty()) {
            queryBuilder.append(" AND type = ?");
            params.add(type);
        }

        queryBuilder.append(" ORDER BY reviewID DESC");

        try (Connection conn = contextDAO.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(queryBuilder.toString())) {

            // Set parameters based on the collected criteria
            for (int i = 0; i < params.size(); i++) {
                Object param = params.get(i);
                if (param instanceof Integer) {
                    pstmt.setInt(i + 1, (Integer) param);
                } else if (param instanceof Date) {
                    pstmt.setDate(i + 1, (Date) param);
                } else if (param instanceof String) {
                    pstmt.setString(i + 1, (String) param);
                }
            }

            // Execute the query and process the result set
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    int reviewID = resultSet.getInt("reviewID");
                    int userID = resultSet.getInt("userID");
                    String content = resultSet.getString("content");
                    int rate = resultSet.getInt("rate");
                    Date date = resultSet.getDate("date");
                    String reviewType = resultSet.getString("type");

                    ServiceReview review = new ServiceReview(reviewID, userID, content, rate, date, reviewType);
                    reviews.add(review);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reviews;
    }
}
