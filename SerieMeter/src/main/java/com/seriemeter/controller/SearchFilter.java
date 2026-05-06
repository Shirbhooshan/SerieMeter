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
@WebServlet(asyncSupported = true, urlPatterns = { "/Search" })
public class SearchFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchFilter() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Get the 'query' variable from the navbar input name="query"
		String query = request.getParameter("query");

		MediaDAO mediaDAO = new MediaDAO();
		List<MediaModel> searchResults;

		// Logic: If the query is empty, show all. If not, filter.
		if (query != null && !query.trim().isEmpty()) {
			searchResults = mediaDAO.searchMedia(query);
		} else {
			searchResults = mediaDAO.getAllMedia();
		}

		// Store the list in a request attribute to be used by the JSP
		request.setAttribute("results", searchResults);

		// Also store the keyword to show "Results for: 'Inception'" on the page
		request.setAttribute("searchKeyword", query);

		// Redirect/Forward to your search results page
		request.getRequestDispatcher("WEB-INF/pages/searchFilter.jsp").forward(request, response);
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
