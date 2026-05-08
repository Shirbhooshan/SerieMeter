package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;

/**
 * Servlet implementation class Genre
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Genre" })
public class Genre extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Genre() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String genreName = request.getParameter("name");

		// f no genre is provided, redirect to Explore
		if (genreName == null || genreName.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/Explore");
			return;
		}

		MediaDAO mediaDAO = new MediaDAO();
		
		List<MediaModel> genreMedias = mediaDAO.getMediaByGenre(genreName);

		request.setAttribute("genreName", genreName);
		request.setAttribute("mediaList", genreMedias);

		request.getRequestDispatcher("/WEB-INF/pages/genre.jsp").forward(request, response);
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
