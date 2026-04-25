package com.seriemeter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.seriemeter.utils.DBconfig;
import com.seriemeter.utils.PasswordUtil;
import com.seriemeter.model.UserModel;

public class UserDAO {

	public boolean isValidUser(String identifier, String password) throws Exception {
		boolean isValid = false;
		// Search by username OR email
		String query = "SELECT password_hash FROM Users WHERE username = ? OR email = ?";

		try (Connection conn = DBconfig.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

			ps.setString(1, identifier);
			ps.setString(2, identifier);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					String storedHash = rs.getString("password_hash");

					if (PasswordUtil.checkPassword(password, storedHash)) {
						isValid = true;
					}
				}
			}
		}
		return isValid;
	}

	public void insertUser(String fullName, String username, String email, String passwordHash) throws Exception {

		// Get the connection from your DBconfig
		Connection con = DBconfig.getConnection();

		// Prepare the SQL string (matching your Users table)
		String sql = "INSERT INTO users (full_name, username, email, password_hash, role) VALUES (?, ?, ?, ?, ?)";

		// Create the Prepared Statement
		PreparedStatement pst = con.prepareStatement(sql);

		// Bind the parameters correctly
		pst.setString(1, fullName);
		pst.setString(2, username);
		pst.setString(3, email);
		pst.setString(4, passwordHash);
		pst.setString(5, "User"); // Setting default role to 'user'

		// Execute the update
		pst.executeUpdate();

		pst.close();
		con.close();
	}

	/**
	 * Fetches full User details after successful login to store in the session.
	 */
	public UserModel getUserByUsername(String identifier) throws Exception {
		UserModel user = null;
		String query = "SELECT * FROM users WHERE username = ? OR email = ?";

		try (Connection conn = DBconfig.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

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

					user.setPassword(rs.getString("password_hash")); // Important step to setting the hash'ed password

					user.setUserProfile(rs.getString("user_profile"));
				}
			}
		}
		return user;
	}
}