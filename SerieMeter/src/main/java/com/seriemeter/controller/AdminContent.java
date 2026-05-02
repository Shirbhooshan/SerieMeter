package com.seriemeter.controller;

<<<<<<< HEAD
=======
import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.UserModel;

>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import jakarta.servlet.http.Part;

import java.io.File;
=======
import jakarta.servlet.http.HttpSession;
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
import java.io.IOException;

<<<<<<< HEAD
import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
=======
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminContent" })
public class AdminContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
<<<<<<< HEAD
	private MediaDAO mediaDAO = new MediaDAO();
=======
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
=======
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

>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
		request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
<<<<<<< HEAD
		try {
			// 1. Read text fields
			String title = request.getParameter("title");
			String director = request.getParameter("director");
			String releaseDate = request.getParameter("release_date");
			String totalTime = request.getParameter("total_time");
			String description = request.getParameter("description");
			int categoryId = Integer.parseInt(request.getParameter("category_id"));
			int genreId = Integer.parseInt(request.getParameter("genre_id"));

			// 2. Build filename from title e.g. "The Dark Knight" → "the_dark_knight.jpg"
			Part filePart = request.getPart("media_profile");
			String originalName = filePart.getSubmittedFileName();
			String extension = originalName.substring(originalName.lastIndexOf(".")); // e.g. ".jpg"
			String fileName = title.trim().toLowerCase().replaceAll("\\s+", "_") + extension;

			// 3. Save file to user home root folder
			String uploadDir = System.getProperty("user.home") + File.separator + "seriemeter_uploads";
			File folder = new File(uploadDir);
			if (!folder.exists())
				folder.mkdirs();
			filePart.write(uploadDir + File.separator + fileName);

			// 4. Build model
			MediaModel media = new MediaModel();
			media.setTitle(title);
			media.setDirector(director);
			media.setReleaseDate(releaseDate);
			media.setTotalTime(totalTime);
			media.setDescription(description);
			media.setMediaProfile(fileName); // stores "the_dark_knight.jpg"
			media.setCategoryId(categoryId);
			media.setGenreId(genreId);

			// 5. Save to DB
			int result = mediaDAO.saveMedia(media);

			if (result > 0) {
				response.sendRedirect(request.getContextPath() + "/AdminContent?success=true");
			} else {
				request.setAttribute("error", "DB insert returned 0. Check console.");
				doGet(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Exception: " + e.getMessage());
			doGet(request, response);
=======

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
>>>>>>> branch 'safiyah' of https://github.com/Shirbhooshan/SerieMeter.git
		}
	}
}