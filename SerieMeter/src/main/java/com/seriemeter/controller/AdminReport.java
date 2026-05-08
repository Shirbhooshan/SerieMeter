package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.seriemeter.dao.UserDAO;
import com.seriemeter.model.UserModel;

/**
 * Servlet implementation class AdminReport
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Report" })
public class AdminReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminReport() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("user") != null) {
			request.setAttribute("loggedInUser", (UserModel) session.getAttribute("user"));
		}

		try {
			UserDAO dao = new UserDAO();
			List<UserModel> users = dao.getAllUsers();
			request.setAttribute("users", users);
			request.getRequestDispatcher("/WEB-INF/pages/adminReport.jsp").forward(request, response);
		} catch (Exception e) {
			throw new ServletException("Failed to load users", e);
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
