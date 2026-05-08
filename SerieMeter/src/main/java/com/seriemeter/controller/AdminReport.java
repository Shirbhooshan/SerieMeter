package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.seriemeter.dao.ReportDAO;
import com.seriemeter.dao.UserDAO;
import com.seriemeter.model.UserModel;

/**
 * Servlet implementation class AdminReport
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Report" })
public class AdminReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminReport() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Existing Session Logic
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			request.setAttribute("loggedInUser", (UserModel) session.getAttribute("user"));
		}

		try {
			// Initialize DAO
			ReportDAO reportDao = new ReportDAO();

			// Fetch KPI Stats
			request.setAttribute("totalUsers", reportDao.getTotalUsers());
			request.setAttribute("totalReviews", reportDao.getTotalReviews());
			request.setAttribute("totalMedia", reportDao.getTotalMedia());
			request.setAttribute("avgRating", String.format("%.1f", reportDao.getAverageRating()));

			// Get the counts (Number of reviews per genre)
			java.util.Map<String, Integer> genreCounts = reportDao.getReviewCountByGenre();

			int totalGenreReviews = 0;
			int maxReviewCount = 0;

			// Calculate totals and find the "winner" for the highlight
			if (genreCounts != null) {
				for (int count : genreCounts.values()) {
					totalGenreReviews += count;
					if (count > maxReviewCount) {
						maxReviewCount = count;
					}
				}
			}

			request.setAttribute("genreCounts", genreCounts);
			request.setAttribute("totalGenreReviews", totalGenreReviews);
			request.setAttribute("maxCount", maxReviewCount);

			// Fetch Top Engaging Media (for the table)
			request.setAttribute("topMedia", reportDao.getTopEngagingMedia(5));

			// Forward to JSP
			request.getRequestDispatcher("/WEB-INF/pages/adminReport.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException("Failed to load report data", e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
