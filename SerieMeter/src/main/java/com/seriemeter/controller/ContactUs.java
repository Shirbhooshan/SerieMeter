package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.seriemeter.dao.ContactDAO;
import com.seriemeter.model.ContactModel;

/**
 * Servlet implementation class ContactUs
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Contact" })
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactUs() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	    String success = (String) request.getSession().getAttribute("successMessage");
	    String error = (String) request.getSession().getAttribute("errorMessage");

	    if (success != null) {
	        request.setAttribute("successMessage", success);
	        request.getSession().removeAttribute("successMessage");
	    }
	    if (error != null) {
	        request.setAttribute("errorMessage", error);
	        request.getSession().removeAttribute("errorMessage");
	    }

	    request.getRequestDispatcher("/WEB-INF/pages/contactUs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// parameters from the JSP form
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String message = request.getParameter("message");

		// Map to Model
		ContactModel feedback = new ContactModel(fullName, email, message);

		// Send to DAO
		int result = ContactDAO.saveFeedback(feedback);

		if (result > 0) {
			request.getSession().setAttribute("successMessage", "Your message has been sent successfully!");
		} else {
			request.getSession().setAttribute("errorMessage", "Something went wrong. Please try again.");
		}
		
		// Redirect to the GET method of this same servlet to clear the POST data
	    response.sendRedirect(request.getContextPath() + "/Contact");
	}
}
