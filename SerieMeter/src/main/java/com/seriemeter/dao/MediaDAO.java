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

		String sql = "SELECT * FROM media WHERE is_deleted = 0 ORDER BY media_id ASC";

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

		String sql = "SELECT * FROM media WHERE media_id = ? AND is_deleted = 0";

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

	// Soft delete
	private static final String DELETE_MEDIA_SQL = "UPDATE media SET is_deleted = 1 WHERE media_id = ?";

	public boolean deleteMedia(int mediaId) {
		boolean rowUpdated = false;
		try (Connection conn = DBconfig.getConnection();
				PreparedStatement ps = conn.prepareStatement(DELETE_MEDIA_SQL)) {

			ps.setInt(1, mediaId);
			rowUpdated = ps.executeUpdate() > 0;
			System.out.println("MediaDAO deleteMedia: rows affected = " + rowUpdated + " for mediaId = " + mediaId);

		} catch (SQLException e) {
			System.out.println("MediaDAO deleteMedia ERROR: " + e.getMessage());
			e.printStackTrace();
		}
		return rowUpdated;
	}

	// Returns only movies (category_id = 1), joined with genre name

	public List<MediaModel> getMovies() {
		List<MediaModel> list = new ArrayList<>();
		String sql = "SELECT m.*, g.genre_name FROM media m " + "JOIN genre g ON m.genre_id = g.genre_id "
				+ "WHERE m.category_id = 1 AND m.is_deleted = 0 " + "ORDER BY m.media_id DESC";
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
				media.setGenreName(rs.getString("genre_name"));
				list.add(media);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Returns only series (category_id = 2), joined with genre name
	public List<MediaModel> getSeries() {
		List<MediaModel> list = new ArrayList<>();
		String sql = "SELECT m.*, g.genre_name FROM media m " + "JOIN genre g ON m.genre_id = g.genre_id "
				+ "WHERE m.category_id = 2 AND m.is_deleted = 0 " + "ORDER BY m.media_id DESC";
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
				media.setGenreName(rs.getString("genre_name"));
				list.add(media);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Returns top 8 most reviewed media, most reviews = trending

	// LEFT JOIN so media with 0 reviews still appear

	public List<MediaModel> getTrendingMedia() {
		List<MediaModel> list = new ArrayList<>();
		String sql = "SELECT m.*, g.genre_name, COUNT(r.review_id) AS review_count " + "FROM media m "
				+ "JOIN genre g ON m.genre_id = g.genre_id " + "LEFT JOIN review r ON m.media_id = r.media_id "
				+ "WHERE m.is_deleted = 0 " + "GROUP BY m.media_id, g.genre_name " + "ORDER BY review_count DESC "
				+ "LIMIT 8";
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
				media.setGenreName(rs.getString("genre_name"));
				list.add(media);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Overloaded method for search filter and sort order

	public List<MediaModel> getAllMedia(String search, String sort) {

		List<MediaModel> mediaList = new ArrayList<>();

		// Build query with optional search filter and sort order
		String order;
		if ("newest".equals(sort)) {
			order = "ORDER BY release_date DESC";
		} else if ("oldest".equals(sort)) {
			order = "ORDER BY release_date ASC";
		} else {
			order = "ORDER BY media_id ASC"; // default: natural DB order
		}

		String sql = "SELECT * FROM media WHERE is_deleted = 0 " + "AND (title LIKE ? OR director LIKE ?) " + order;

		try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			// Wrap search term with wildcards for LIKE matching
			String term = "%" + (search != null ? search : "") + "%";
			pst.setString(1, term);
			pst.setString(2, term);

			try (ResultSet rs = pst.executeQuery()) {
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
					media.setDeleted(rs.getBoolean("is_deleted"));
					mediaList.add(media);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mediaList;
	}

	public List<MediaModel> searchMediaDashboard(String query, int categoryId, int genreId, String yearRange,
			String sortBy) {

		List<MediaModel> results = new ArrayList<>();
		StringBuilder where = new StringBuilder("WHERE 1=1 ");
		List<Object> params = new ArrayList<>();

		// title OR director
		if (query != null && !query.trim().isEmpty()) {
			where.append("AND (LOWER(m.title) LIKE ? OR LOWER(m.director) LIKE ?) ");
			String like = "%" + query.trim().toLowerCase() + "%";
			params.add(like);
			params.add(like);
		}

		// Category filter
		if (categoryId == 1 || categoryId == 2) {
			where.append("AND m.category_id = ? ");
			params.add(categoryId);
		}

		// Genre filter
		if (genreId > 0) {
			where.append("AND m.genre_id = ? ");
			params.add(genreId);
		}

		// Year range filter
		if (yearRange != null && !yearRange.trim().isEmpty()) {
			switch (yearRange.trim()) {
			case "2020-2026":
				where.append("AND YEAR(m.release_date) BETWEEN 2020 AND 2026 ");
				break;
			case "2015-2019":
				where.append("AND YEAR(m.release_date) BETWEEN 2015 AND 2019 ");
				break;
			case "2010-2014":
				where.append("AND YEAR(m.release_date) BETWEEN 2010 AND 2014 ");
				break;
			case "2000-2009":
				where.append("AND YEAR(m.release_date) BETWEEN 2000 AND 2009 ");
				break;
			case "pre2000":
				where.append("AND YEAR(m.release_date) < 2000 ");
				break;
			}
		}

		// Sort order
		if (sortBy == null)
			sortBy = "";
		String order;
		switch (sortBy) {
		case "oldest":
			order = "ORDER BY m.release_date ASC ";
			break;
		case "az":
			order = "ORDER BY m.title ASC ";
			break;
		case "newest":
		default:
			order = "ORDER BY m.release_date DESC ";
			break;
		}

		String sql = "SELECT m.*, g.genre_name FROM media m " + "JOIN genre g ON m.genre_id = g.genre_id " + where
				+ order;

		try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			for (int i = 0; i < params.size(); i++) {
				Object p = params.get(i);
				if (p instanceof Integer)
					pst.setInt(i + 1, (Integer) p);
				else
					pst.setString(i + 1, (String) p);
			}

			ResultSet rs = pst.executeQuery();
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
				media.setGenreName(rs.getString("genre_name"));
				results.add(media);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return results;
	}

	public List<MediaModel> getMediaByGenre(String genreName) {
		List<MediaModel> list = new ArrayList<>();
		String sql = "SELECT m.*, g.genre_name FROM media m " + "JOIN genre g ON m.genre_id = g.genre_id "
				+ "WHERE g.genre_name = ? AND m.is_deleted = 0";
		try (Connection c = DBconfig.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {

			ps.setString(1, genreName);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				MediaModel media = new MediaModel();
				media.setMediaId(rs.getInt("media_id"));
				media.setTitle(rs.getString("title"));
				media.setMediaProfile(rs.getString("media_profile"));
				media.setGenreName(rs.getString("genre_name"));
				// ... set other fields as needed
				list.add(media);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getRandomMediaId() {
		int randomId = 0;

		String query = "SELECT media_id FROM media WHERE is_deleted = 0 ORDER BY RAND() LIMIT 1";
		
		try (Connection conn = DBconfig.getConnection();
				PreparedStatement ps = conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery()) {

			if (rs.next()) {
				randomId = rs.getInt("media_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return randomId;
	}

	/**
	 * Returns all media with their average rating (scaled to /10). avgRating will
	 * be 0.0 if no reviews exist for that media.
	 */
	public List<MediaModel> getAllMediaWithAvgRating() {
		List<MediaModel> mediaList = new ArrayList<>();

		String sql = "SELECT m.*, COALESCE(AVG(r.rating) * 2, 0) AS avg_rating " + "FROM media m "
				+ "LEFT JOIN review r ON m.media_id = r.media_id " + "WHERE m.is_deleted = 0 "
				+ "GROUP BY m.media_id ORDER BY m.media_id ASC";
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
				media.setAvgRating(rs.getDouble("avg_rating"));
				mediaList.add(media);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mediaList;
	}

	// search media by title
	// called by AdminEdit when admin types in the search box
	public List<MediaModel> searchMediaEdit(String query, String sort) {
		List<MediaModel> list = new ArrayList<>();

		// ORDER BY based on sort param
		String orderBy;
		if ("name".equals(sort)) {
			orderBy = "m.title ASC";
		} else if ("category".equals(sort)) {
			orderBy = "m.category_id ASC";
		} else {
			orderBy = "m.media_id DESC"; // default — date added
		}

		String sql = "SELECT m.*, g.genre_name FROM media m " + "JOIN genre g ON m.genre_id = g.genre_id "
				+ "WHERE m.title LIKE ? " + "ORDER BY " + orderBy;

		try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setString(1, "%" + query + "%");
			try (ResultSet rs = pst.executeQuery()) {
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
					media.setGenreName(rs.getString("genre_name"));
					list.add(media);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// Get all media with sort applied
	// Called by AdminEdit when sort changes but no search query
	public List<MediaModel> getAllMediaSorted(String sort) {
		List<MediaModel> list = new ArrayList<>();

		String orderBy;
		if ("name".equals(sort)) {
			orderBy = "m.title ASC";
		} else if ("category".equals(sort)) {
			orderBy = "m.category_id ASC";
		} else {
			orderBy = "m.media_id DESC";
		}

		String sql = "SELECT m.*, g.genre_name FROM media m " + "JOIN genre g ON m.genre_id = g.genre_id " + "ORDER BY "
				+ orderBy;

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
				media.setGenreName(rs.getString("genre_name"));
				list.add(media);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<MediaModel> getAllMediaWithAvgRating(String search, String sort) {
	    List<MediaModel> mediaList = new ArrayList<>();

	    String orderBy;
	    if ("newest".equals(sort)) {
	        orderBy = "ORDER BY m.release_date DESC";
	    } else if ("oldest".equals(sort)) {
	        orderBy = "ORDER BY m.release_date ASC";
	    } else {
	        orderBy = "ORDER BY m.media_id ASC";
	    }

	    String like = "%" + (search != null ? search.trim().toLowerCase() : "") + "%";

	    String sql = "SELECT m.*, COALESCE(AVG(r.rating) * 2, 0) AS avg_rating "
	               + "FROM media m "
	               + "LEFT JOIN review r ON m.media_id = r.media_id "
	               + "WHERE m.is_deleted = 0 "
	               + "AND (LOWER(m.title) LIKE ? OR LOWER(m.director) LIKE ?) "
	               + "GROUP BY m.media_id "
	               + orderBy;

	    try (Connection con = DBconfig.getConnection();
	         PreparedStatement pst = con.prepareStatement(sql)) {

	        pst.setString(1, like);
	        pst.setString(2, like);

	        try (ResultSet rs = pst.executeQuery()) {
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
	                media.setAvgRating(rs.getDouble("avg_rating"));
	                mediaList.add(media);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return mediaList;
	}

}