package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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

		if (username == null || username.trim().isEmpty()) {
			request.setAttribute("error", "Username or email is required.");
			request.setAttribute("typedUser", username);
			request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
			return;
		}
		if (password == null || password.trim().isEmpty()) {
			request.setAttribute("error", "Password is required.");
			request.setAttribute("typedUser", username);
			request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
			return;
		}

		LoginService loginService = new LoginService();
		String status = loginService.authenticate(username, password);

		if (status.equals("Success")) {
			UserDAO userDAO = new UserDAO();
			HttpSession session = request.getSession();

			try {
				UserModel user = userDAO.getUserByUsername(username);
				session.setAttribute("user", user);

				String contextPath = request.getContextPath();
				if (user != null && "Admin".equalsIgnoreCase(user.getRole())) {
					response.sendRedirect(contextPath + "/Dashboard");
				} else {
					response.sendRedirect(contextPath + "/Explore");
				}
				return;

			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("error", "Something went wrong. Please try again.");
				request.setAttribute("typedUser", username);
				request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
			}

		} else {
			// Authentication failure — map all status strings to user-friendly messages
			String errorMsg;
			switch (status) {
			case "Username is required":
			case "Password is required":
				errorMsg = status;
				break;
			case "User doesn't exists":
				errorMsg = "No account found with that username or email.";
				break;
			case "Password is incorrect":
				errorMsg = "Incorrect password. Please try again.";
				break;
			case "Account pending approval":
				// Show a popup message on the login page — no redirect needed
				errorMsg = "Your account is pending admin approval. Please wait.";
				break;
			default:
				errorMsg = "Login failed. Please try again.";
			}

			// Re-populate the username field so the user doesn't have to retype it
			request.setAttribute("error", errorMsg);
			request.setAttribute("typedUser", username);
			request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
		}
	}
}