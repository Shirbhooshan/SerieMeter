package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.seriemeter.dao.UserDAO;
import com.seriemeter.model.UserModel;
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
			UserDAO userDAO = new UserDAO();
			HttpSession session = request.getSession();

			try {
				UserModel user = userDAO.getUserByUsername(username);
				session.setAttribute("user", user);

				String rememberMe = request.getParameter("rememberMe");
				if ("on".equals(rememberMe)) {
					Cookie cookie = new Cookie("rememberMe", username);
					cookie.setMaxAge(60 * 60 * 24 * 30);
					cookie.setPath("/");
					cookie.setHttpOnly(true);
					response.addCookie(cookie);
					session.setMaxInactiveInterval(60 * 60 * 24 * 30);
				} else {
					// Clear any old rememberMe cookie
					Cookie clearCookie = new Cookie("rememberMe", "");
					clearCookie.setMaxAge(0);
					clearCookie.setPath("/");
					response.addCookie(clearCookie);
					// Session expires after 30 min inactivity
					session.setMaxInactiveInterval(30 * 60);
				}

				String contextPath = request.getContextPath();
				if (user != null && "Admin".equalsIgnoreCase(user.getRole())) {
					response.sendRedirect(contextPath + "/Dashboard");
				} else {
					response.sendRedirect(contextPath + "/Explore");
				}
				return;

			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/Explore");
		}
	}
}
