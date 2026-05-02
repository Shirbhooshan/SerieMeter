package com.seriemeter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.seriemeter.model.MediaModel;
import com.seriemeter.utils.DBconfig;

public class MediaDAO {

	public boolean insertMedia(MediaModel media) {

		String sql = "INSERT INTO media (title, director, release_date, total_time, description, media_profile, category_id, genre_id) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setString(1, media.getTitle());
			pst.setString(2, media.getDirector());
			pst.setDate(3, java.sql.Date.valueOf(media.getReleaseDate()));
			pst.setString(4, media.getTotalTime());
			pst.setString(5, media.getDescription());
			pst.setString(6, media.getMediaProfile());
			pst.setInt(7, media.getCategoryId());
			pst.setInt(8, media.getGenreId());

			return pst.executeUpdate() > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	/*
	 * getAllMedia() returns every row from media table, newest first.
	 */
	public List<MediaModel> getAllMedia() {

		List<MediaModel> mediaList = new ArrayList<>();

		String sql = "SELECT * FROM media ORDER BY media_id DESC";

		try (Connection con = DBconfig.getConnection();
				PreparedStatement pst = con.prepareStatement(sql);
				ResultSet rs = pst.executeQuery()) {

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
				mediaList.add(media);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mediaList;
	}

	/*
	 * getMediaById(int mediaId) returns one media row by its primary key.
	 */
	public MediaModel getMediaById(int mediaId) {

		MediaModel media = null;

		String sql = "SELECT * FROM media WHERE media_id = ?";

		try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setInt(1, mediaId);

			try (ResultSet rs = pst.executeQuery()) {
				if (rs.next()) { // if() not while() since only one row is expected
					media = new MediaModel();
					media.setMediaId(rs.getInt("media_id"));
					media.setTitle(rs.getString("title"));
					media.setDirector(rs.getString("director"));
					media.setReleaseDate(rs.getString("release_date"));
					media.setTotalTime(rs.getString("total_time"));
					media.setDescription(rs.getString("description"));
					media.setMediaProfile(rs.getString("media_profile"));
					media.setCategoryId(rs.getInt("category_id"));
					media.setGenreId(rs.getInt("genre_id"));
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return media; // null means not found
	}

	/*
	 * updateMedia(MediaModel media) updates an existing row in the media table.
	 */
	public boolean updateMedia(MediaModel media) {

		String sql = "UPDATE media SET title = ?, director = ?, release_date = ?, "
				+ "description = ?, category_id = ?, genre_id = ?, media_profile = ? " + "WHERE media_id = ?";

		try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setString(1, media.getTitle());
			pst.setString(2, media.getDirector());
			pst.setDate(3, java.sql.Date.valueOf(media.getReleaseDate()));
			pst.setString(4, media.getDescription());
			pst.setInt(5, media.getCategoryId());
			pst.setInt(6, media.getGenreId());
			pst.setString(7, media.getMediaProfile());
			pst.setInt(8, media.getMediaId()); 

			return pst.executeUpdate() > 0; // true = success

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}