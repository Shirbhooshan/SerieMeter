package com.seriemeter.dao;

import com.seriemeter.model.MediaModel;
import com.seriemeter.model.ReviewModel;
import com.seriemeter.utils.DBconfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserProfileDAO {

    // ── Reviews ──────────────────────────────────────────────────────────────

    /**
     * Returns all reviews written by the given user, oldest first.
     * FIX: JOINs with the media table so that mediaTitle is populated
     *      and can be displayed as the review card heading.
     */
    public List<ReviewModel> getReviewsByUserId(int userId) {
        List<ReviewModel> reviews = new ArrayList<>();
        String sql = "SELECT r.review_id, r.user_id, r.media_id, r.rating, r.review_text, "
                   + "       r.created_at, m.title AS media_title "
                   + "FROM review r "
                   + "JOIN media m ON r.media_id = m.media_id "
                   + "WHERE r.user_id = ? "
                   + "ORDER BY r.created_at ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ReviewModel review = new ReviewModel();
                    review.setReviewId(rs.getInt("review_id"));
                    review.setUserId(rs.getInt("user_id"));
                    review.setMediaId(rs.getInt("media_id"));
                    review.setRating(rs.getInt("rating"));
                    review.setReviewText(rs.getString("review_text"));
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    review.setMediaTitle(rs.getString("media_title"));
                    reviews.add(review);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return reviews;
    }

    /**
     * Returns all reviews written by the given user, newest first.
     * FIX: JOINs with the media table so that mediaTitle is populated.
     */
    public List<ReviewModel> getReviewsByUserIdNewest(int userId) {
        List<ReviewModel> reviews = new ArrayList<>();
        String sql = "SELECT r.review_id, r.user_id, r.media_id, r.rating, r.review_text, "
                   + "       r.created_at, m.title AS media_title "
                   + "FROM review r "
                   + "JOIN media m ON r.media_id = m.media_id "
                   + "WHERE r.user_id = ? "
                   + "ORDER BY r.created_at DESC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ReviewModel review = new ReviewModel();
                    review.setReviewId(rs.getInt("review_id"));
                    review.setUserId(rs.getInt("user_id"));
                    review.setMediaId(rs.getInt("media_id"));
                    review.setRating(rs.getInt("rating"));
                    review.setReviewText(rs.getString("review_text"));
                    review.setCreatedAt(rs.getTimestamp("created_at"));
                    review.setMediaTitle(rs.getString("media_title"));
                    reviews.add(review);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return reviews;
    }

    /**
     * Returns the total number of reviews written by the given user.
     */
    public int getReviewCountByUserId(int userId) {
        String sql = "SELECT COUNT(*) FROM review WHERE user_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    // ── Bookmarks ─────────────────────────────────────────────────────────────

    /**
     * Returns all media items bookmarked by the given user, oldest first.
     * FIX: JOINs with the genre table so that genreName is populated and
     *      can be displayed in the profile page card (e.g. "ADVENTURE").
     */
    public List<MediaModel> getBookmarksByUserId(int userId) {
        List<MediaModel> bookmarks = new ArrayList<>();
        String sql = "SELECT m.media_id, m.title, m.director, m.release_date, "
                   + "       m.total_time, m.description, m.media_profile, "
                   + "       m.category_id, m.genre_id, g.genre_name "
                   + "FROM media m "
                   + "JOIN watchlist w ON m.media_id = w.media_id "
                   + "JOIN genre g ON m.genre_id = g.genre_id "
                   + "WHERE w.user_id = ? "
                   + "ORDER BY w.added_date ASC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
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
                    bookmarks.add(media);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookmarks;
    }

    /**
     * Returns all media items bookmarked by the given user, newest first.
     * FIX: JOINs with the genre table so that genreName is populated.
     */
    public List<MediaModel> getBookmarksByUserIdNewest(int userId) {
        List<MediaModel> bookmarks = new ArrayList<>();
        String sql = "SELECT m.media_id, m.title, m.director, m.release_date, "
                   + "       m.total_time, m.description, m.media_profile, "
                   + "       m.category_id, m.genre_id, g.genre_name "
                   + "FROM media m "
                   + "JOIN watchlist w ON m.media_id = w.media_id "
                   + "JOIN genre g ON m.genre_id = g.genre_id "
                   + "WHERE w.user_id = ? "
                   + "ORDER BY w.added_date DESC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
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
                    bookmarks.add(media);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookmarks;
    }

    /**
     * Returns the total number of bookmarks saved by the given user.
     */
    public int getBookmarkCountByUserId(int userId) {
        String sql = "SELECT COUNT(*) FROM watchlist WHERE user_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}
