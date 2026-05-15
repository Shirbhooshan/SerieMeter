package com.seriemeter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.seriemeter.model.ContactModel;
import com.seriemeter.utils.DBconfig;

public class ContactDAO {
    public static int saveFeedback(ContactModel contact) {
        String query = "INSERT INTO contact (name, email, message) VALUES (?, ?, ?)";
        int result = 0;

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getMessage());

            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}