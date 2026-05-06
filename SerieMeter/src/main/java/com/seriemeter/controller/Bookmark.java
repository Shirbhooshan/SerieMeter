package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.seriemeter.dao.BookmarkDAO;
import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.UserModel;

/**
 * Servlet implementation class Bookmark
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Bookmark" })
public class Bookmark extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookmarkDAO bookmarkDAO = new BookmarkDAO();
	private MediaDAO mediaDAO = new MediaDAO();

	// show the user's bookmark page
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/Login");
			return;
		}

		UserModel user = (UserModel) session.getAttribute("user");
		List<MediaModel> bookmarkedMedia = bookmarkDAO.getBookmarkedMedia(user.getUserId());
		request.setAttribute("bookmarkedMedia", bookmarkedMedia);
		request.getRequestDispatcher("/WEB-INF/pages/bookmark.jsp").forward(request, response);
	}

	// add or remove a bookmark, then redirect back to media page
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/Login");
			return;
		}

		UserModel user = (UserModel) session.getAttribute("user");
		int userId = user.getUserId();
		int mediaId = Integer.parseInt(request.getParameter("media_id"));
		String action = request.getParameter("action");

		if ("add".equals(action)) {
			bookmarkDAO.addBookmark(userId, mediaId);
		} else if ("remove".equals(action)) {
			bookmarkDAO.removeBookmark(userId, mediaId);
		}

		response.sendRedirect(request.getContextPath() + "/Media?id=" + mediaId);
	}
}