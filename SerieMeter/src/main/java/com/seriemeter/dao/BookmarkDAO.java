package com.seriemeter.dao;

import com.seriemeter.model.MediaModel;
import com.seriemeter.utils.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookmarkDAO {

	public boolean isBookmarked(int userId, int mediaId) {
		String sql = "SELECT 1 FROM watchlist WHERE user_id = ? AND media_id = ?";
		try (Connection conn = DBconfig.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ps.setInt(2, mediaId);
			ResultSet rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public void addBookmark(int userId, int mediaId) {
		String sql = "INSERT IGNORE INTO watchlist (user_id, media_id) VALUES (?, ?)";
		try (Connection conn = DBconfig.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ps.setInt(2, mediaId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void removeBookmark(int userId, int mediaId) {
		String sql = "DELETE FROM watchlist WHERE user_id = ? AND media_id = ?";
		try (Connection conn = DBconfig.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ps.setInt(2, mediaId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<MediaModel> getBookmarkedMedia(int userId) {
		List<MediaModel> list = new ArrayList<>();
		String sql = "SELECT m.* FROM media m " + "JOIN watchlist w ON m.media_id = w.media_id "
				+ "WHERE w.user_id = ? " + "ORDER BY w.added_date DESC";
		try (Connection conn = DBconfig.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MediaModel media = new MediaModel();
				media.setMediaId(rs.getInt("media_id"));
				media.setTitle(rs.getString("title"));
				media.setDirector(rs.getString("director"));
				media.setReleaseDate(rs.getString("release_date"));
				media.setTotalTime(rs.getString("total_time"));
				media.setDescription(rs.getString("description"));
				media.setMediaProfile(rs.getString("media_profile"));
				media.setCategoryId(rs.getInt("category_id"));
				media.setGenreId(rs.getInt("genre_id"));
				list.add(media);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}