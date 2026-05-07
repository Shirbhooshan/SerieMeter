package com.seriemeter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.seriemeter.model.ReviewModel;
import com.seriemeter.utils.DBconfig;

public class ReviewDAO {

	public void addReview(ReviewModel review) {
		// review_id and created_at are usually handled by DB defaults
		String query = "INSERT INTO review (user_id, media_id, rating, review_text) VALUES (?, ?, ?, ?)";

		try (Connection conn = DBconfig.getConnection(); PreparedStatement pst = conn.prepareStatement(query)) {

			pst.setInt(1, review.getUserId());
			pst.setInt(2, review.getMediaId());
			pst.setInt(3, review.getRating());
			pst.setString(4, review.getReviewText());

			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// Method to fetch all reviews for a specific media item
	public List<ReviewModel> getReviewsByMediaId(int mediaId) {
		List<ReviewModel> reviews = new ArrayList<>();
		// Join with users table to get the username of the reviewer
		String query = "SELECT r.*, u.username FROM review r " + "JOIN users u ON r.user_id = u.user_id "
				+ "WHERE r.media_id = ? ORDER BY r.created_at DESC";

		try (Connection conn = DBconfig.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {

			stmt.setInt(1, mediaId);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				ReviewModel review = new ReviewModel();
				review.setReviewId(rs.getInt("review_id"));
				review.setUserId(rs.getInt("user_id"));
				review.setMediaId(rs.getInt("media_id"));
				review.setRating(rs.getInt("rating"));
				review.setReviewText(rs.getString("review_text"));
				review.setCreatedAt(rs.getTimestamp("created_at"));
				review.setUsername(rs.getString("username"));
				reviews.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reviews;
	}
}