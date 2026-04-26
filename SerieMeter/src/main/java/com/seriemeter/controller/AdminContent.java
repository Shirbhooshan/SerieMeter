package com.seriemeter.controller;

import com.seriemeter.dao.MovieDAO;
import com.seriemeter.model.Movie;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 * Servlet implementation class AdminContent
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/AdminContent" })
public class AdminContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDAO movieDAO;
	
	public void init() {
		//Initialize the DAO when the servlet starts
		movieDAO = new MovieDAO();
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminContent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. Retrieve form parameters using the "name" attributes from jsp
		
		String title = request.getParameter("movieTitle");
		String director = request.getParameter("directorName");
		String releaseDate = request.getParameter("releaseDate");
		String category = request.getParameter("category");
		String totalTime = request.getParameter("totalTime");
		String synopsis = request.getParameter("synopsis");
		String genre = request.getParameter("genre");
		
		//2 Create a model object
		Movie newMovie = new Movie(title, director, releaseDate, category, totalTime, synopsis, genre);
		
		//3 Save to database using DAO
		boolean success = movieDAO.insertMovie(newMovie);
		
		//4 Redirect or forward based on success
		if(success) {
			// set a success message in the session
			request.setAttribute("message", "Movie added successfully");
			//Redirect back to the form or a list page
			request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp").forward(request, response);
		} else {
			request.setAttribute("error", "Failed to add movie. Please try again.");
			request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp").forward(request, response);
		}
	}

}
