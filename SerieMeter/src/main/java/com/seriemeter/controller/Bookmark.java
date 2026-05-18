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
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.UserModel;

@WebServlet(asyncSupported = false, urlPatterns = { "/Bookmark" })
public class Bookmark extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// loads the user's bookmarks and shows in the page
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		// If not logged in sends user to the logged-out bookmark page
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/Bookmarks");
			return;
		}

		// Getting logged in user from session
		UserModel user = (UserModel) session.getAttribute("user");

		// Loads the user's bookmarks
		BookmarkDAO bookmarkDAO = new BookmarkDAO();
		List<MediaModel> bookmarkList = bookmarkDAO.getBookmarkedMedia(user.getUserId());

		// Puts the list in request so bookmark.jsp can loop through it
		request.setAttribute("bookmarkList", bookmarkList);

		// Reads action from URL 
		String action = request.getParameter("action");

		if ("confirm-clear".equals(action)) {
			// Showing the clear all confirmation popup
			request.setAttribute("popupStyle", "display:flex");
			request.setAttribute("popupType", "clear");

		} else if ("confirm-remove".equals(action)) {
			// Showing the remove confirmation popup for a specific media
			request.setAttribute("popupStyle", "display:flex");
			request.setAttribute("popupType", "remove");
			request.setAttribute("pendingMediaId", request.getParameter("mediaId"));

		} else {
			// No popup 
			request.setAttribute("popupStyle", "display:none");
			request.setAttribute("popupType", "");
		}

		request.getRequestDispatcher("/WEB-INF/pages/bookmark.jsp").forward(request, response);
	}

	// handles add, remove, and clearAll actions
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		// If not logged in sends user back to login
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/Login");
			return;
		}

		UserModel user = (UserModel) session.getAttribute("user");
		BookmarkDAO bookmarkDAO = new BookmarkDAO();

		String action = request.getParameter("action");

		// media.jsp sends "media_id", bookmark.jsp sends "mediaId"

		String mediaIdParam = request.getParameter("media_id");
		if (mediaIdParam == null) {
			mediaIdParam = request.getParameter("mediaId");
		}

		if ("add".equals(action) && mediaIdParam != null) {
			// Add bookmark is called from media.jsp
			int mediaId = Integer.parseInt(mediaIdParam);
			bookmarkDAO.addBookmark(user.getUserId(), mediaId);

		} else if ("remove".equals(action) && mediaIdParam != null) {
			// Remove one bookmark is called from media.jsp or bookmark.jsp
			int mediaId = Integer.parseInt(mediaIdParam);
			bookmarkDAO.removeBookmark(user.getUserId(), mediaId);

		} else if ("clearAll".equals(action)) {
			// Remove all bookmarks for user is called from bookmark.jsp
			bookmarkDAO.clearAllBookmarks(user.getUserId());
		}

		// Redirects back to GET so the page reloads with updated list
		// If came from media page go back there with popup message
		// If came from bookmark page stay on bookmark page
		if (mediaIdParam != null && request.getParameter("fromMedia") != null) {
			String msg = "add".equals(action) ? "added" : "removed";
			response.sendRedirect(request.getContextPath() + "/Media?id=" + mediaIdParam + "&bookmark=" + msg);
		} else {

			if ("clearAll".equals(action) || request.getParameter("fromMedia") == null) {
				response.sendRedirect(request.getContextPath() + "/Bookmark");
			} else {
				String msg = "add".equals(action) ? "added" : "removed";
				response.sendRedirect(request.getContextPath() + "/Media?id=" + mediaIdParam + "&bookmark=" + msg);
			}
		}
	}
}