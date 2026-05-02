package com.seriemeter.controller;

import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = { "/AdminContent" })
public class AdminContent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MediaDAO mediaDAO;

	public void init() {
		// Initialize the DAO when the servlet starts
		mediaDAO = new MediaDAO();
	}

	public AdminContent() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Session check — only admins allowed
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/Login");
			return;
		}

		UserModel loggedInUser = (UserModel) session.getAttribute("user");

		if (!loggedInUser.getRole().equals("Admin")) {
			response.sendRedirect(request.getContextPath() + "/Home");
			return;
		}

		request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Retrieving form parameters
		String title       = request.getParameter("movieTitle");
		String director    = request.getParameter("directorName");
		String releaseDate = request.getParameter("releaseDate");
		String totalTime   = request.getParameter("totalTime");
		String synopsis    = request.getParameter("synopsis");
		int categoryId     = Integer.parseInt(request.getParameter("category"));
		int genreId        = Integer.parseInt(request.getParameter("genre"));

		// Building a MediaModel (replaces the old Movie object)
		MediaModel newMedia = new MediaModel();
		newMedia.setTitle(title);
		newMedia.setDirector(director);
		newMedia.setReleaseDate(releaseDate);
		newMedia.setTotalTime(totalTime);
		newMedia.setDescription(synopsis);
		newMedia.setCategoryId(categoryId);
		newMedia.setGenreId(genreId);

		// Saveing to seriemeter database via MediaDAO (replaces old MovieDAO/admin_content)
		boolean success = mediaDAO.insertMedia(newMedia);

		// Forwarding back with success or error message
		if (success) {
			request.setAttribute("message", "Media added successfully");
			request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp").forward(request, response);
		} else {
			request.setAttribute("error", "Failed to add media. Please try again.");
			request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp").forward(request, response);
		}
	}
}