package com.seriemeter.service;

import com.seriemeter.dao.UserDAO;
import com.seriemeter.model.UserModel;
import com.seriemeter.utils.PasswordUtil;

public class LoginService {

    /**
     * Authenticates a student based on username and password.
     * * @param username The provided username
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
            UserDAO studentDAO = new UserDAO();
            
            // Call getStudentByUsername to fetch the student object
            UserModel student = studentDAO.getUserByUsername(username);

            // Check if student object is null
            if (student == null) {
                return "User doesn't exists";
            }

            if (!PasswordUtil.checkPassword(password, student.getPassword())) {
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