package com.seriemeter.service;

import java.nio.file.Paths;
import jakarta.servlet.http.Part;

import com.seriemeter.dao.UserDAO;
import com.seriemeter.utils.FileUploadUtil;
import com.seriemeter.utils.PasswordUtil;

public class RegisterService {
    private UserDAO dao = new UserDAO();

    public void registerNewUser(String fullName, String username, String email,
                                String password, Part profilePart, String uploadDir) throws Exception {

        // Hash the password
        String hashedPassword = PasswordUtil.getHashPassword(password);

        // Default filename if user skips upload
        String savedFileName = "default_profile.png";

        // Only process if a real file was uploaded
        if (profilePart != null && profilePart.getSize() > 0 && FileUploadUtil.isImage(profilePart)) {
            String originalName = Paths.get(profilePart.getSubmittedFileName()).getFileName().toString();
            String extension    = FileUploadUtil.getFileExtension(originalName);
            savedFileName       = FileUploadUtil.buildFileName(username, extension);
            FileUploadUtil.saveFile(profilePart, uploadDir, savedFileName);
        }

        // Send to DAO
        dao.insertUser(fullName, username, email, hashedPassword, savedFileName);
    }
}