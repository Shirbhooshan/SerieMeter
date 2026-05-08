package com.seriemeter.service;

import com.seriemeter.dao.UserProfileDAO;
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.ReviewModel;

import java.util.List;

public class UserProfileService {

    private final UserProfileDAO userProfileDAO;

    public UserProfileService() {
        this.userProfileDAO = new UserProfileDAO();
    }

    // ── Reviews ───────────────────────────────────────────────────────────────

    /**
     * Returns the user's reviews in the requested sort order.
     *
     * @param userId the logged-in user's ID
     * @param sort   "newest" for newest-first, anything else defaults to oldest-first
     * @return list of ReviewModel objects
     */
    public List<ReviewModel> getReviews(int userId, String sort) {
        if ("newest".equalsIgnoreCase(sort)) {
            return userProfileDAO.getReviewsByUserIdNewest(userId);
        }
        // Default: oldest first
        return userProfileDAO.getReviewsByUserId(userId);
    }

    /**
     * Returns the total number of reviews written by the user.
     */
    public int getReviewCount(int userId) {
        return userProfileDAO.getReviewCountByUserId(userId);
    }

    // ── Bookmarks ─────────────────────────────────────────────────────────────

    /**
     * Returns the user's bookmarked media in the requested sort order.
     *
     * @param userId the logged-in user's ID
     * @param sort   "newest" for newest-first, anything else defaults to oldest-first
     * @return list of MediaModel objects
     */
    public List<MediaModel> getBookmarks(int userId, String sort) {
        if ("newest".equalsIgnoreCase(sort)) {
            return userProfileDAO.getBookmarksByUserIdNewest(userId);
        }
        // Default: oldest first
        return userProfileDAO.getBookmarksByUserId(userId);
    }

    /**
     * Returns the total number of bookmarks saved by the user.
     */
    public int getBookmarkCount(int userId) {
        return userProfileDAO.getBookmarkCountByUserId(userId);
    }
}
