package com.seriemeter.service;

import com.seriemeter.dao.UserDAO;
import com.seriemeter.model.UserModel;
import com.seriemeter.utils.PasswordUtil;

public class LoginService {

	/**
	 * Authenticates a student based on username and password. * @param username The
	 * provided username
	 * 
	 * @param password The provided raw password
	 * @return A status message indicating the result of the authentication
	 */
	public String authenticate(String username, String password) {

		// 1. Check if provided username is empty or null
		if (username == null || username.trim().isEmpty()) {
			return "Username is required";
		}

		// 2. Check if provided password is empty or null
		if (password == null || password.trim().isEmpty()) {
			return "Password is required";
		}

		try {
			UserDAO userDAO = new UserDAO();

			// Call getUserByUsername to fetch the student object
			UserModel user = userDAO.getUserByUsername(username);

			// Check if student object is null
			if (user == null) {
				return "User doesn't exists";
			}

			System.out.println("Input Password: " + password);
			System.out.println("Stored Hash from DB: " + user.getPassword());
			System.out.println("Hash Length: " + user.getPassword().length());

			boolean match = PasswordUtil.checkPassword(password, user.getPassword());
			System.out.println("Does it match? " + match);

			// TEMPORARY HACK FOR TESTING
			//if (username.equals("testuser") && password.equals("password123")) {
			//	return "Success";
			//}

			if (!PasswordUtil.checkPassword(password, user.getPassword())) {
				return "Password is incorrect";
			}

			// If all checks pass, return Success
			return "Success";

		} catch (Exception e) {
			e.printStackTrace();
			return "An internal error occurred. Please try again later.";
		}
	}
}