package com.seriemeter.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.UserModel;
import com.seriemeter.utils.FileUploadUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet(asyncSupported = true, urlPatterns = { "/Edit" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class AdminEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			request.setAttribute("loggedInUser", (UserModel) session.getAttribute("user"));
		}

		String idParam = request.getParameter("id");

		if (idParam != null) {
			try {
				int mediaId = Integer.parseInt(idParam);
				MediaDAO mediaDAO = new MediaDAO();
				MediaModel media = mediaDAO.getMediaById(mediaId);

				if (media != null) {
					request.setAttribute("editMedia", media);
					request.getRequestDispatcher("/WEB-INF/pages/Admineditform.jsp").forward(request, response);
				} else {
					response.sendRedirect(request.getContextPath() + "/Edit");
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect(request.getContextPath() + "/Edit");
			}
		}

		else {
			try {
				MediaDAO mediaDAO = new MediaDAO();

				// Reading search and sort params from URL
				String query = request.getParameter("query");
				String sort = request.getParameter("sort");
				if (sort == null)
					sort = "date"; // default

				List<MediaModel> mediaList;

				if (query != null && !query.trim().isEmpty()) {
					// Search query presents filter by title
					mediaList = mediaDAO.searchMediaEdit(query, sort);
				} else {
					// No query loads all with sort applied
					mediaList = mediaDAO.getAllMediaSorted(sort);
				}

				// Passing back to JSP so inputs stay filled after submit
				request.setAttribute("mediaList", mediaList);
				request.setAttribute("searchQuery", query);
				request.setAttribute("currentSort", sort);

				request.getRequestDispatcher("/WEB-INF/pages/adminEdit.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
				request.getRequestDispatcher("/WEB-INF/pages/adminEdit.jsp").forward(request, response);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int mediaId = Integer.parseInt(request.getParameter("mediaId"));
		String title = request.getParameter("movieTitle");
		String director = request.getParameter("directorName");
		String release = request.getParameter("releaseDate");
		String totalTime = request.getParameter("totalTime");
		String synopsis = request.getParameter("synopsis");
		int categoryId = Integer.parseInt(request.getParameter("category"));
		int genreId = Integer.parseInt(request.getParameter("genre"));

		String posterFileName = request.getParameter("existingPoster");

		try {
			Part filePart = request.getPart("posterImage");

			if (filePart != null && filePart.getSize() > 0) {
				if (FileUploadUtil.isImage(filePart)) {
					String extension = FileUploadUtil.getFileExtension(filePart.getSubmittedFileName());
					posterFileName = title.trim().toLowerCase().replaceAll("\\s+", "_") + extension;

					// Save to user.home — same as rest of project
					String uploadDir = System.getProperty("user.home") + File.separator + "seriemeter_uploads"
							+ File.separator + "media_uploads";
					FileUploadUtil.saveFile(filePart, uploadDir, posterFileName);
				} else {
					MediaModel existingMedia = new MediaDAO().getMediaById(mediaId);
					request.setAttribute("error", "Invalid file type. Please upload an image.");
					request.setAttribute("editMedia", existingMedia);
					request.getRequestDispatcher("/WEB-INF/pages/Admineditform.jsp").forward(request, response);
					return;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		MediaModel media = new MediaModel();
		media.setMediaId(mediaId);
		media.setTitle(title);
		media.setDirector(director);
		media.setReleaseDate(release);
		media.setTotalTime(totalTime);
		media.setDescription(synopsis);
		media.setCategoryId(categoryId);
		media.setGenreId(genreId);
		media.setMediaProfile(posterFileName);

		boolean success = new MediaDAO().updateMedia(media);

		if (success) {
			response.sendRedirect(request.getContextPath() + "/Edit");
		} else {
			request.setAttribute("error", "Update failed. Please try again.");
			request.setAttribute("editMedia", media);
			request.getRequestDispatcher("/WEB-INF/pages/Admineditform.jsp").forward(request, response);
		}
	}
}