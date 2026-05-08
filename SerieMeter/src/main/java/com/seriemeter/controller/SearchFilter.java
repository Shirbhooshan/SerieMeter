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

@WebServlet(asyncSupported = true, urlPatterns = { "/Search" })
public class SearchFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String clean(String s) {
		return s != null ? s.trim() : "";
	}

	private int toInt(String s) {
		try {
			return Integer.parseInt(s);
		} catch (Exception e) {
			return 0;
		}
	}

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

		String query = clean(request.getParameter("query"));
		String catStr = clean(request.getParameter("category"));
		String genreStr = clean(request.getParameter("genre"));
		String yearRange = clean(request.getParameter("yearRange"));
		String sortBy = clean(request.getParameter("sortBy"));
		if (sortBy.isEmpty())
			sortBy = "newest";

		int categoryId = toInt(catStr);
		int genreId = toInt(genreStr);

		MediaDAO mediaDAO = new MediaDAO();
		List<MediaModel> results = mediaDAO.searchMedia(query, categoryId, genreId, yearRange, sortBy);

		request.setAttribute("results", results);
		request.setAttribute("resultCount", results.size());
		request.setAttribute("query", query);
		request.setAttribute("category", catStr);
		request.setAttribute("genre", genreStr);
		request.setAttribute("yearRange", yearRange);
		request.setAttribute("sortBy", sortBy);

		request.getRequestDispatcher("/WEB-INF/pages/searchFilter.jsp").forward(request, response);
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
