package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.seriemeter.dao.MediaDAO;

/**
 * Servlet implementation class Randomize
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Randomize" })
public class Randomize extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Randomize() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MediaDAO mediaDAO = new MediaDAO();
		int randomId = mediaDAO.getRandomMediaId();

		if (randomId > 0) {
			// Redirect to existing Media details servlet
			response.sendRedirect(request.getContextPath() + "/Media?id=" + randomId);
		} else {
			// Fallback if the database is empty
			response.sendRedirect(request.getContextPath() + "/Explore");
		}
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
