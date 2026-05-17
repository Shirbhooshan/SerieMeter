package com.seriemeter.dao;

import com.seriemeter.utils.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ReportDAO {

	/** Total number of registered users */
	public int getTotalUsers() {
		String sql = "SELECT COUNT(*) FROM users";
		try (Connection c = DBconfig.getConnection();
				PreparedStatement ps = c.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			return rs.next() ? rs.getInt(1) : 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	/** Total number of reviews ever submitted */
	public int getTotalReviews() {
		String sql = "SELECT COUNT(*) FROM review";
		try (Connection c = DBconfig.getConnection();
				PreparedStatement ps = c.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			return rs.next() ? rs.getInt(1) : 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	/** Total number of media entries */
	public int getTotalMedia() {
		String sql = "SELECT COUNT(*) FROM media";
		try (Connection c = DBconfig.getConnection();
				PreparedStatement ps = c.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			return rs.next() ? rs.getInt(1) : 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * Overall average rating across all reviews, scaled to /10 (ratings are stored
	 * 1-5, displayed as x2 = /10)
	 */
	public double getAverageRating() {
		String sql = "SELECT AVG(rating) * 2 FROM review";
		try (Connection c = DBconfig.getConnection();
				PreparedStatement ps = c.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			return rs.next() ? rs.getDouble(1) : 0.0;
		} catch (Exception e) {
			e.printStackTrace();
			return 0.0;
		}
	}

	public Map<String, Integer> getReviewCountByGenre() {
		Map<String, Integer> map = new LinkedHashMap<>();
		String sql = "SELECT g.genre_name, COUNT(r.review_id) AS review_count " + "FROM review r "
				+ "JOIN media m ON r.media_id = m.media_id " + "JOIN genre g ON m.genre_id = g.genre_id "
				+ "GROUP BY g.genre_name " + "ORDER BY review_count DESC"; // Order by most reviews first
		try (Connection c = DBconfig.getConnection();
				PreparedStatement ps = c.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				map.put(rs.getString("genre_name"), rs.getInt("review_count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	/**
	 * Top N most engaging media (by review count + bookmark count). Returns rows
	 * with: media_id, media_profile, title, category_id, genre_name,
	 * bookmark_count, review_count
	 */
	public List<Map<String, Object>> getTopEngagingMedia(int limit) {
		List<Map<String, Object>> list = new ArrayList<>();

		String sql = "SELECT m.media_id, m.title, m.media_profile, m.category_id, g.genre_name, "
				+ "       COUNT(DISTINCT w.user_id) AS bookmark_count, "
				+ "       COUNT(DISTINCT r.review_id) AS review_count " + "FROM media m "
				+ "JOIN genre g ON m.genre_id = g.genre_id " + "LEFT JOIN watchlist w ON m.media_id = w.media_id "
				+ "LEFT JOIN review r ON m.media_id = r.media_id "
				+ "GROUP BY m.media_id, m.title, m.media_profile, m.category_id, g.genre_name "
				+ "ORDER BY (COUNT(DISTINCT r.review_id) + COUNT(DISTINCT w.user_id)) DESC " + "LIMIT ?";
		try (Connection c = DBconfig.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
			ps.setInt(1, limit);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Map<String, Object> row = new LinkedHashMap<>();
				row.put("mediaId", rs.getInt("media_id"));
				row.put("title", rs.getString("title"));
				row.put("mediaProfile", rs.getString("media_profile")); // Now matches JSP ${item.mediaProfile}
				row.put("categoryId", rs.getInt("category_id"));
				row.put("genreName", rs.getString("genre_name"));
				row.put("bookmarkCount", rs.getInt("bookmark_count"));
				row.put("reviewCount", rs.getInt("review_count"));
				list.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}