package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.seriemeter.service.RegisterService;

/**
 * Servlet implementation class Register
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Register" })
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RegisterService service = new RegisterService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
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
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Fetch data from form (Ensure these 'name' attributes match your JSP input
			// fields)
			String fullName = request.getParameter("full_name");
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			// Call service to register
			service.registerNewUser(fullName, username, email, password);

			// Success! Redirect to login
			response.sendRedirect(request.getContextPath() + "/Login");

		} catch (Exception e) {
			e.printStackTrace();
			// Optional: Pass an error message back to the JSP
			request.setAttribute("errorMessage", "Registration failed: " + e.getMessage());
			doGet(request, response);
		}
	}
}
