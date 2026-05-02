package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.UserModel;
import com.seriemeter.utils.FileUploadUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/AdminContent" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AdminContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MediaDAO mediaDAO = new MediaDAO();

	public AdminContent() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			request.setAttribute("loggedInUser", (UserModel) session.getAttribute("user"));
		}

		request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Collect form data — names must match JSP exactly
			String title = request.getParameter("title");
			String director = request.getParameter("director");
			String releaseDate = request.getParameter("release_date");
			String totalTime = request.getParameter("total_time");
			String description = request.getParameter("description");
			int categoryId = Integer.parseInt(request.getParameter("category_id"));
			int genreId = Integer.parseInt(request.getParameter("genre_id"));

			// Handle file upload → saved to media_uploads subfolder
			Part filePart = request.getPart("media_profile");
			String fileName = "default_media.jpg";

			if (filePart != null && filePart.getSize() > 0 && FileUploadUtil.isImage(filePart)) {
				// Filename based on title e.g. "The Dark Knight" → "the_dark_knight.jpg"
				String extension = FileUploadUtil.getFileExtension(filePart.getSubmittedFileName());
				fileName = title.trim().toLowerCase().replaceAll("\\s+", "_") + extension;

				String uploadDir = System.getProperty("user.home") + File.separator + "seriemeter_uploads"
						+ File.separator + "media_uploads";

				FileUploadUtil.saveFile(filePart, uploadDir, fileName);
			}

			// Populate model
			MediaModel media = new MediaModel();
			media.setTitle(title);
			media.setDirector(director);
			media.setReleaseDate(releaseDate);
			media.setTotalTime(totalTime);
			media.setDescription(description);
			media.setCategoryId(categoryId);
			media.setGenreId(genreId);
			media.setMediaProfile(fileName); // only filename stored in DB

			// Save to database
			int result = mediaDAO.saveMedia(media);

			if (result > 0) {
				response.sendRedirect(request.getContextPath() + "/AdminContent?success=true");
			} else {
				request.setAttribute("error", "Failed to publish. Check Tomcat console.");
				doGet(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Exception: " + e.getMessage());
			doGet(request, response);
		}
	}
}