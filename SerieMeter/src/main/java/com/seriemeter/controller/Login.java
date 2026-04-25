package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.seriemeter.dao.UserDAO;
import com.seriemeter.service.LoginService;

/**
 * Servlet implementation class Login
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Login" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		LoginService loginService = new LoginService();
		String status = loginService.authenticate(username, password);

		if (status.equals("Success")) {
			UserDAO user = new UserDAO();
			HttpSession session = request.getSession();
			try {
				session.setAttribute("user", user.getUserByUsername(username));
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/Explore"); // sendRedirect changes URL, client- >
																			// server - > (3 way communication)
		} else {
			request.setAttribute("error", status);
			request.setAttribute("typedUse", username);
			request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response); // (2 way
																									// communication)
		}
	}
}
