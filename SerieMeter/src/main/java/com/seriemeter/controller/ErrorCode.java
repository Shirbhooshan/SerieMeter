package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ErrorCode
 * Handles all HTTP error codes configured in web.xml (404, 500, 403).
 * Reads the error code Tomcat sets automatically and passes it to error.jsp.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/error" })
public class ErrorCode extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ErrorCode() {
		super();
	}

	/**
	 * Reads the error code and message set by Tomcat,
	 * passes them as request attributes, then forwards to error.jsp.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Tomcat automatically sets these attributes when an error occurs
		Integer errorCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
		String errorMessage = (String) request.getAttribute("jakarta.servlet.error.message");

		// Fallback values in case attributes are null
		request.setAttribute("errorCode", errorCode != null ? errorCode : 0);
		request.setAttribute("errorMessage", errorMessage != null ? errorMessage : "An unexpected error occurred.");

		request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
