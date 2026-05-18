package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.seriemeter.dao.UserDAO;
import com.seriemeter.model.UserModel;
import com.seriemeter.service.UserProfileService;

/**
 * Servlet implementation class Users
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Users" })
public class AdminUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUsers() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			request.setAttribute("loggedInUser", (UserModel) session.getAttribute("user"));
		}

		try {
			UserDAO dao = new UserDAO();

			// Read search query from URL
			String search = request.getParameter("search");

			List<UserModel> users;
			if (search != null && !search.trim().isEmpty()) {
				users = dao.getUsersBySearch(search.trim());
			} else {
				users = dao.getAllUsers();
			}

			UserProfileService profileService = new UserProfileService();
			List<Integer> reviewCounts = new ArrayList<>();
			for (UserModel u : users) {
				reviewCounts.add(profileService.getReviewCount(u.getUserId()));
			}

			request.setAttribute("users", users);
			request.setAttribute("reviewCounts", reviewCounts);
			request.setAttribute("searchValue", search != null ? search : "");

			request.getRequestDispatcher("/WEB-INF/pages/adminUsers.jsp").forward(request, response);

		} catch (Exception e) {
			throw new ServletException("Failed to load users", e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if ("approve".equals(action)) {
			int userId = Integer.parseInt(request.getParameter("userId"));
			UserDAO userDAO = new UserDAO();
			try {
				userDAO.approveUser(userId);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect(request.getContextPath() + "/Users");
	}

}
