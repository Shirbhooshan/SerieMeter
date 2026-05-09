package com.seriemeter.controller;

import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.UserModel;
import com.seriemeter.service.MediaService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = { "/Dashboard" })
public class AdminDashboard extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private MediaService mediaService;

	@Override
	public void init() {
		mediaService = new MediaService();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			request.setAttribute("loggedInUser", (UserModel) session.getAttribute("user"));
		}

		MediaDAO mediaDAO = new MediaDAO();
		List<MediaModel> mediaList = mediaDAO.getAllMediaWithAvgRating();
		request.setAttribute("mediaList", mediaList);

		request.getRequestDispatcher("/WEB-INF/pages/adminDashboard.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			request.setAttribute("loggedInUser", (UserModel) session.getAttribute("user"));
		}

		String action = request.getParameter("action");
		if ("delete".equals(action)) {
			int mediaId = Integer.parseInt(request.getParameter("mediaId"));
			boolean deleted = mediaService.deleteMedia(mediaId);
			if (deleted) {
				request.setAttribute("message", "Media deleted successfully.");
			} else {
				request.setAttribute("error", "Failed to delete media.");
			}
		}

		doGet(request, response);
	}
}