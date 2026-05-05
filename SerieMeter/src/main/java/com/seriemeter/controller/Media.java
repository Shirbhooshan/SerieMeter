package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.seriemeter.dao.MediaDAO;
import com.seriemeter.dao.ReviewDAO;
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.ReviewModel;
import com.seriemeter.model.UserModel;

/**
 * Servlet implementation class Media for tracking movies and series.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Media" })
public class Media extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Create instances of DAOs to avoid "non-static reference" errors
	private MediaDAO mediaDAO = new MediaDAO();
	private ReviewDAO reviewDAO = new ReviewDAO();

	public Media() {
		super();
	}

	/**
	 * Handles public viewing of media details and reviews.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idParam = request.getParameter("id");

		if (idParam != null && !idParam.isEmpty()) {
			try {
				int mediaId = Integer.parseInt(idParam);

				// Fetch details from the media table
				// Note: Use the 'mediaDAO' instance variable, not the 'MediaDAO' class name
				MediaModel media = mediaDAO.getMediaById(mediaId);

				if (media != null) {
					// Fetch associated reviews
					List<ReviewModel> reviews = reviewDAO.getReviewsByMediaId(mediaId);

					request.setAttribute("media", media);
					request.setAttribute("reviews", reviews);

					// Forward to the JSP inside WEB-INF for security
					request.getRequestDispatcher("/WEB-INF/pages/media.jsp").forward(request, response);
				} else {
					// Redirect to Explore if the media ID is invalid
					response.sendRedirect(request.getContextPath() + "/Explore");
				}
			} catch (NumberFormatException e) {
				response.sendRedirect(request.getContextPath() + "/Explore");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/Explore");
		}
	}

	/**
	 * Handles review submissions (requires user login).
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);

		// Check if the "user" object exists in session
		if (session != null && session.getAttribute("user") != null) {
			try {
				// Get the UserModel object and extract the ID
				UserModel user = (UserModel) session.getAttribute("user");
				int userId = user.getUserId();

				// Get parameters from the JSP form
				int mediaId = Integer.parseInt(request.getParameter("media_id"));
				int rating = Integer.parseInt(request.getParameter("rating"));
				String reviewText = request.getParameter("review_text");

				// Populate your Model
				ReviewModel review = new ReviewModel();
				review.setUserId(userId);
				review.setMediaId(mediaId);
				review.setRating(rating);
				review.setReviewText(reviewText);

				// Send to DAO
				reviewDAO.addReview(review);

				// Redirect back to the same page to show the new review
				response.sendRedirect(request.getContextPath() + "/Media?id=" + mediaId);

			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect(request.getContextPath() + "/Explore");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/Login");
		}
	}
}