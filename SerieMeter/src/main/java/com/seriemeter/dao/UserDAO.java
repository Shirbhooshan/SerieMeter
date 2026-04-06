package com.seriemeter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.seriemeter.utils.DBconfig;
import com.seriemeter.model.UserModel;

public class UserDAO {

    public boolean isValidUser(String identifier, String password) throws Exception {
        boolean isValid = false;
        // Search by username OR email
        String query = "SELECT password_hash FROM Users WHERE username = ? OR email = ?";

        try (Connection conn = DBconfig.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, identifier);
            ps.setString(2, identifier);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String storedHash = rs.getString("password_hash");
                    
                    // Simple check: In a real app, use BCrypt.checkpw(password, storedHash)
                    if (password.equals(storedHash)) {
                        isValid = true;
                    }
                }
            }
        }
        return isValid;
    }

    /**
     * Fetches full User details after successful login to store in the session.
     */
    public UserModel getUserByUsername(String identifier) throws Exception {
        UserModel user = null;
        String query = "SELECT * FROM Users WHERE username = ? OR email = ?";

        try (Connection conn = DBconfig.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, identifier);
            ps.setString(2, identifier);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new UserModel();
                    user.setUserId(rs.getInt("user_id"));
                    user.setFullName(rs.getString("full_name"));
                    user.setEmail(rs.getString("email"));
                    user.setUserName(rs.getString("username"));
                    user.setRole(rs.getString("role"));
                    user.setUserProfile(rs.getString("user_profile"));
                }
            }
        }
        return user;
    }
}