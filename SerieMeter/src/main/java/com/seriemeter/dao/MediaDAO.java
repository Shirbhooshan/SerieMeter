package com.seriemeter.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.seriemeter.model.MediaModel;
import com.seriemeter.utils.DBconfig;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MediaDAO {

    private static final String INSERT_MEDIA_SQL = "INSERT INTO media " +
        "(title, director, release_date, total_time, description, media_profile, category_id, genre_id) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

    public int saveMedia(MediaModel media) {
        int result = 0;

        try (Connection connection = DBconfig.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MEDIA_SQL)) {
            
            preparedStatement.setString(1, media.getTitle());
            preparedStatement.setString(2, media.getDirector());

            // Handling the datetime conversion
            if (media.getReleaseDate() != null && !media.getReleaseDate().isEmpty()) {
                // HTML date input returns "yyyy-MM-dd", datetime needs a timestamp
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date parsedDate = dateFormat.parse(media.getReleaseDate());
                preparedStatement.setTimestamp(3, new Timestamp(parsedDate.getTime()));
            } else {
                preparedStatement.setNull(3, java.sql.Types.TIMESTAMP);
            }

            preparedStatement.setString(4, media.getTotalTime());
            preparedStatement.setString(5, media.getDescription());
            preparedStatement.setString(6, media.getMediaProfile());
            preparedStatement.setInt(7, media.getCategoryId());
            preparedStatement.setInt(8, media.getGenreId());

            result = preparedStatement.executeUpdate();

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


