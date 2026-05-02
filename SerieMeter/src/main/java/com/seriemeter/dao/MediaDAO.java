package com.seriemeter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.seriemeter.model.MediaModel;
import com.seriemeter.utils.DBconfig;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MediaDAO {

	public int saveMedia(MediaModel media) {
		int result = 0;

		String sql = "INSERT INTO media (title, director, release_date, total_time, description, media_profile, category_id, genre_id) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DBconfig.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, media.getTitle());
			ps.setString(2, media.getDirector());

			// Convert "yyyy-MM-dd" string from HTML date input to SQL Timestamp
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date parsed = sdf.parse(media.getReleaseDate());
			ps.setTimestamp(3, new Timestamp(parsed.getTime()));

			ps.setString(4, media.getTotalTime());
			ps.setString(5, media.getDescription());
			ps.setString(6, media.getMediaProfile());
			ps.setInt(7, media.getCategoryId());
			ps.setInt(8, media.getGenreId());

<<<<<<< HEAD
			result = ps.executeUpdate();
			System.out.println("MediaDAO: rows inserted = " + result);

		} catch (Exception e) {
			System.out.println("MediaDAO ERROR: " + e.getMessage());
			e.printStackTrace();
		}

		return result;
	}

	/*
	 * getAllMedia() returns every row from media table, newest first.
	 */
	public List<MediaModel> getAllMedia() {

		List<MediaModel> mediaList = new ArrayList<>();

		String sql = "SELECT * FROM media ORDER BY media_id ASC";

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

		return media;
	}

	/*
	 * updateMedia(MediaModel media) updates the existing row in the media table.
	 */
	public boolean updateMedia(MediaModel media) {

		String sql = "UPDATE media SET title = ?, director = ?, release_date = ?, total_time = ?, "
				+ "description = ?, category_id = ?, genre_id = ?, media_profile = ? " + "WHERE media_id = ?";

		try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setString(1, media.getTitle());
			pst.setString(2, media.getDirector());

			// release_date comes as "yyyy-MM-dd" from the form input
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date parsed = sdf.parse(media.getReleaseDate());
			pst.setTimestamp(3, new Timestamp(parsed.getTime()));

			pst.setString(4, media.getTotalTime());
			pst.setString(5, media.getDescription());
			pst.setInt(6, media.getCategoryId());
			pst.setInt(7, media.getGenreId());
			pst.setString(8, media.getMediaProfile());
			pst.setInt(9, media.getMediaId());

			return pst.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
=======
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
 // Fetch all media with category and genre names joined
    private static final String SELECT_ALL_MEDIA_SQL =
        "SELECT m.media_id, m.title, m.director, m.release_date, m.total_time, " +
        "       m.description, m.media_profile, m.category_id, m.genre_id, " +
        "       c.category_name, g.genre_name, " +
        "       COUNT(r.review_id) AS total_reviews, " +
        "       COALESCE(AVG(r.rating), 0) AS avg_rating " +
        "FROM media m " +
        "LEFT JOIN category c ON m.category_id = c.category_id " +
        "LEFT JOIN genre g ON m.genre_id = g.genre_id " +
        "LEFT JOIN review r ON m.media_id = r.media_id " +
        "GROUP BY m.media_id, m.title, m.director, m.release_date, m.total_time, " +
        "         m.description, m.media_profile, m.category_id, m.genre_id, " +
        "         c.category_name, g.genre_name " +
        "ORDER BY m.release_date DESC";

    public List<MediaModel> getAllMedia() {
        List<MediaModel> mediaList = new ArrayList<>();
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_MEDIA_SQL);
             ResultSet rs = ps.executeQuery()) {

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
                // These need to be added to MediaModel too — see note below
                media.setCategoryName(rs.getString("category_name"));
                media.setGenreName(rs.getString("genre_name"));
                media.setTotalReviews(rs.getInt("total_reviews"));
                media.setAvgRating(rs.getDouble("avg_rating"));
                mediaList.add(media);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mediaList;
    }

    // Delete media by ID
    private static final String DELETE_MEDIA_SQL =
        "DELETE FROM media WHERE media_id = ?";

    public boolean deleteMedia(int mediaId) {
        boolean rowDeleted = false;
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE_MEDIA_SQL)) {

            ps.setInt(1, mediaId);
            rowDeleted = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
    
}