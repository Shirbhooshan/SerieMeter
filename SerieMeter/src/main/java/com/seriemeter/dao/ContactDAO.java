package com.seriemeter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.seriemeter.model.ContactModel;
import com.seriemeter.utils.DBconfig;

public class ContactDAO {
	public static int saveFeedback(ContactModel contact) {
		String query = "INSERT INTO contact (name, email, message) VALUES (?, ?, ?)";
		int result = 0;

		try (Connection conn = DBconfig.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {

			ps.setString(1, contact.getName());
			ps.setString(2, contact.getEmail());
			ps.setString(3, contact.getMessage());

			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public static List<ContactModel> getAllFeedback() {
		List<ContactModel> feedbackList = new ArrayList<>();
		String query = "SELECT * FROM contact ORDER BY feedback_no DESC";

		try (Connection conn = DBconfig.getConnection();
				PreparedStatement ps = conn.prepareStatement(query);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				ContactModel feedback = new ContactModel();
				feedback.setFeedbackNo(rs.getInt("feedback_no"));
				feedback.setName(rs.getString("name"));
				feedback.setEmail(rs.getString("email"));
				feedback.setMessage(rs.getString("message"));
				feedbackList.add(feedback);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return feedbackList;
	}
}