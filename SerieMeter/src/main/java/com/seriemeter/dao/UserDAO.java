package com.seriemeter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

	public void insertUser(String fullName, String username, String email, String passwordHash, String userProfile)
			throws Exception {

		// Get the connection from your DBconfig
		Connection con = DBconfig.getConnection();

		// Prepare the SQL string (matching your Users table)
		String sql = "INSERT INTO users (full_name, username, email, password_hash, role, user_profile) VALUES (?, ?, ?, ?, ?, ?)";

		// Create the Prepared Statement
		PreparedStatement pst = con.prepareStatement(sql);

		// Bind the parameters correctly
		pst.setString(1, fullName);
		pst.setString(2, username);
		pst.setString(3, email);
		pst.setString(4, passwordHash);
		pst.setString(5, "User"); // Setting default role to 'user'
		pst.setString(6, userProfile);
		// is_approved defaults to FALSE automatically in the DB — no need to set it
		// here

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
					user.setApproved(rs.getBoolean("is_approved")); // map the approval status
				}
			}
		}
		return user;
	}

	public List<UserModel> getAllUsers() throws Exception {
		List<UserModel> users = new ArrayList<>();

		String query = "SELECT * FROM users";

		try (Connection conn = DBconfig.getConnection();
				PreparedStatement ps = conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				UserModel user = new UserModel();
				user.setUserId(rs.getInt("user_id"));
				user.setFullName(rs.getString("full_name"));
				user.setEmail(rs.getString("email"));
				user.setUserName(rs.getString("username"));
				user.setRole(rs.getString("role"));
				user.setUserProfile(rs.getString("user_profile"));
				user.setApproved(rs.getBoolean("is_approved")); // map the approval status
				users.add(user);
			}
		}
		return users;
	}

	// Update user details WITHOUT changing password
	public void updateUserDetails(UserModel user) throws Exception {
		String sql = "UPDATE users SET full_name = ?, username = ?, user_profile = ? WHERE user_id = ?";

		try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setString(1, user.getFullName());
			pst.setString(2, user.getUserName());
			pst.setString(3, user.getUserProfile());
			pst.setInt(4, user.getUserId());

			int rows = pst.executeUpdate();
			System.out.println("updateUserDetails rows affected: " + rows);
		}
	}

	// Update user details AND password hash
	public void updateUserWithPassword(UserModel user) throws Exception {
		String sql = "UPDATE users SET full_name = ?, username = ?, password_hash = ?, user_profile = ? WHERE user_id = ?";

		try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setString(1, user.getFullName());
			pst.setString(2, user.getUserName());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getUserProfile());
			pst.setInt(5, user.getUserId());

			int rows = pst.executeUpdate();
			System.out.println("updateUserWithPassword rows affected: " + rows);
		}
	}

	/**
	 * Flips is_approved = TRUE for a given user. Called by the admin when they
	 * approve a pending user from the Users page.
	 */
	public void approveUser(int userId) throws Exception {
		String sql = "UPDATE users SET is_approved = TRUE WHERE user_id = ?";

		try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {

			pst.setInt(1, userId);
			pst.executeUpdate();
		}
	}

	public List<UserModel> getUsersBySearch(String query) throws Exception {
		List<UserModel> users = new ArrayList<>();
		String like = "%" + (query != null ? query.trim().toLowerCase() : "") + "%";

		String sql = "SELECT * FROM users " + "WHERE LOWER(full_name) LIKE ? " + "   OR LOWER(username)  LIKE ? "
				+ "   OR LOWER(email)     LIKE ?";

		try (Connection conn = DBconfig.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, like);
			ps.setString(2, like);
			ps.setString(3, like);

			try (ResultSet rs = ps.executeQuery()) {
				while (rs.next()) {
					UserModel user = new UserModel();
					user.setUserId(rs.getInt("user_id"));
					user.setFullName(rs.getString("full_name"));
					user.setEmail(rs.getString("email"));
					user.setUserName(rs.getString("username"));
					user.setRole(rs.getString("role"));
					user.setUserProfile(rs.getString("user_profile"));
					user.setApproved(rs.getBoolean("is_approved"));
					users.add(user);
				}
			}
		}
		return users;
	}

}