package com.seriemeter.controller;

import java.io.IOException;
import java.util.List;

import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.UserModel;
import com.seriemeter.utils.Fileuploadutil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/* Handles the following three situations:
 *  1. GET  /Edit        shows the full media list in adminEdit.jsp
 *  2. GET  /Edit?id=5   shows the edit form for media ID 5
 *  3. POST /Edit        saves the submitted edit form to DB, redirect back to list
 */

@WebServlet(asyncSupported = true, urlPatterns = { "/Edit" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AdminEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_FOLDER = "assets" + java.io.File.separator + "images";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Checking session: only logged-in admins can see this page
		HttpSession session = request.getSession(false); // false = don't create a new session

		if (session == null || session.getAttribute("user") == null) {
			// If no session found then send to login
			response.sendRedirect(request.getContextPath() + "/Login");
			return;
		}

		// Get the user from session and check role
		UserModel loggedInUser = (UserModel) session.getAttribute("user");

		if (!loggedInUser.getRole().equals("Admin")) {
			// If not an admin then send to home
			response.sendRedirect(request.getContextPath() + "/Home");
			return;
		}

		// Checking if "id" was passed in URL e.g. /Edit?id=3
		String idParam = request.getParameter("id");

		if (idParam != null) {
			// When admin clicks on Edit of a specific row it
			// loads the media item and show the pre-filled edit form

			try {
				int mediaId = Integer.parseInt(idParam); // string to number

				MediaDAO mediaDAO = new MediaDAO();
				MediaModel media = mediaDAO.getMediaById(mediaId);

				if (media != null) {
					// Putting the media in request so adminEditForm.jsp can read it
					// JSP can accesses it as ${editMedia.title}
					request.setAttribute("editMedia", media);
					request.getRequestDispatcher("/WEB-INF/pages/adminEditForm.jsp").forward(request, response);
				} else {
					// If no media found with that ID then go back to list
					response.sendRedirect(request.getContextPath() + "/Edit");
				}

			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect(request.getContextPath() + "/Edit");
			}

		} else {
			// showing the full media list

			try {
				MediaDAO mediaDAO = new MediaDAO();
				List<MediaModel> mediaList = mediaDAO.getAllMedia();

				// Putting the list in request so adminEdit.jsp can loop through it
				// JSP uses: <c:forEach var="media" items="${mediaList}">
				request.setAttribute("mediaList", mediaList);

				request.getRequestDispatcher("/WEB-INF/pages/adminEdit.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
				// Even if DB fails, still show the page with empty table
				request.getRequestDispatcher("/WEB-INF/pages/adminEdit.jsp").forward(request, response);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Session checking
		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect(request.getContextPath() + "/Login");
			return;
		}

		// Reading form fields submitted by the admin

		int mediaId = Integer.parseInt(request.getParameter("mediaId"));
		String title = request.getParameter("movieTitle");
		String director = request.getParameter("directorName");
		String release = request.getParameter("releaseDate");
		String synopsis = request.getParameter("synopsis");
		int categoryId = Integer.parseInt(request.getParameter("category"));
		int genreId = Integer.parseInt(request.getParameter("genre"));

		String posterFileName = request.getParameter("existingPoster");

		try {
			// getPart() reads the file input from the form
			Part filePart = request.getPart("posterImage");

			if (filePart != null && filePart.getSize() > 0) {
				// checking it's an image
				if (Fileuploadutil.isImage(filePart)) {

					// Building filename using mediaId so each media has a unique poster
					String extension = Fileuploadutil.getFileExtension(filePart.getSubmittedFileName());
					posterFileName = "media_" + mediaId + extension;

					// getRealPath gives us the actual folder path inside the deployed webapp
					String uploadDir = getServletContext().getRealPath("") + java.io.File.separator + UPLOAD_FOLDER;

					// Saving the file to disk
					Fileuploadutil.saveFile(filePart, uploadDir, posterFileName);

				} else {
					// if not an image — reload the form with error, keep it filled
					MediaDAO fetchDAO = new MediaDAO();
					MediaModel existingMedia = fetchDAO.getMediaById(mediaId);
					request.setAttribute("error", "Invalid file type. Please upload an image.");
					request.setAttribute("editMedia", existingMedia);
					request.getRequestDispatcher("/WEB-INF/pages/Admineditform.jsp").forward(request, response);
					return;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			// keeping the existing poster and continuing
		}

		// Putting values into a MediaModel object to pass to DAO
		MediaModel media = new MediaModel();
		media.setMediaId(mediaId);
		media.setTitle(title);
		media.setDirector(director);
		media.setReleaseDate(release);
		media.setDescription(synopsis);
		media.setCategoryId(categoryId);
		media.setGenreId(genreId);
		media.setMediaProfile(posterFileName); // new or existing poster filename

		// Declaring mediaDAO here so it is in scope for the update call
		MediaDAO mediaDAO = new MediaDAO();
		boolean success = mediaDAO.updateMedia(media);

		if (success) {
			// going back to the media list page
			response.sendRedirect(request.getContextPath() + "/Edit");
		} else {
			// going back to edit form with error message
			request.setAttribute("error", "Update failed. Please try again.");
			request.setAttribute("editMedia", media); // keeping filled form
			request.getRequestDispatcher("/WEB-INF/pages/Admineditform.jsp").forward(request, response);
		}
	}
}