package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.seriemeter.service.RegisterService;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB — keep small files in memory
		maxFileSize = 1024 * 1024 * 5, // 5MB max per file
		maxRequestSize = 1024 * 1024 * 10 // 10MB max total request
)
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// Fetch data from form
			String fullName = request.getParameter("full_name");
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			// Get the uploaded file part
			Part profilePart = request.getPart("user_profile");

			// Upload to root direcory
			String uploadDir = System.getProperty("user.home") + java.io.File.separator + "seriemeter_uploads"
					+ java.io.File.separator + "user_uploads";

			// Call service to register
			service.registerNewUser(fullName, username, email, password, profilePart, uploadDir);

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
