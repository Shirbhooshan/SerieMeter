package com.seriemeter.controller;

import com.seriemeter.dao.UserDAO;
import com.seriemeter.model.UserModel;
import com.seriemeter.utils.FileUploadUtil;
import com.seriemeter.utils.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

/*
 * UserProfileEdit servlet — handles GET (load edit page)
 * and POST (process profile update form).
 * Mapping: /UserProfileEdit
 */
@WebServlet("/UserEdit")
@MultipartConfig
public class UserProfileEdit extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // -- GET - load the edit profile page
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Redirect to login if no active session
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        // Make the session user available to the JSP as ${user}
        request.setAttribute("user", session.getAttribute("user"));
        request.getRequestDispatcher("/WEB-INF/pages/userProfileEdit.jsp")
               .forward(request, response);
    }

    // -- POST - process the form submission 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Redirect to login if session expired
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        // Get the logged-in user from session
        UserModel user = (UserModel) session.getAttribute("user");

        // 1. Read all form parameters
        String fullName    = request.getParameter("full_name");
        String username    = request.getParameter("username");
        String currentPass = request.getParameter("current_password");
        String newPass     = request.getParameter("new_password");
        String confirmPass = request.getParameter("confirm_password");

        try {
            UserDAO dao = new UserDAO();

         // 2. Determine what the user is trying to do
            boolean isPasswordChange = (newPass != null && !newPass.trim().isEmpty());
            boolean isCurrentPassProvided = (currentPass != null && !currentPass.trim().isEmpty());

            // Only validate current password if the user is attempting a password change
            // OR if they typed something in the current password field
            if (isPasswordChange || isCurrentPassProvided) {
                if (!isCurrentPassProvided || !PasswordUtil.checkPassword(currentPass, user.getPassword())) {
                    request.setAttribute("user", user);
                    request.setAttribute("error", "Incorrect current password. No changes were saved.");
                    request.getRequestDispatcher("/WEB-INF/pages/userProfileEdit.jsp")
                           .forward(request, response);
                    return;
                }
            }

            // 3. Handle profile picture upload (mirrors RegisterService logic)
            String uploadDir = System.getProperty("user.home")
                    + File.separator + "seriemeter_uploads"
                    + File.separator + "user_uploads";

            Part profilePart = request.getPart("user_profile");

            if (profilePart != null && profilePart.getSize() > 0
                    && FileUploadUtil.isImage(profilePart)) {

                String originalName  = Paths.get(profilePart.getSubmittedFileName())
                                            .getFileName().toString();
                String extension     = FileUploadUtil.getFileExtension(originalName);

                // Use new username for filename if provided, otherwise keep old
                String nameForFile   = (username != null && !username.trim().isEmpty())
                                       ? username.trim()
                                       : user.getUserName();

                String savedFileName = FileUploadUtil.buildFileName(nameForFile, extension);
                FileUploadUtil.saveFile(profilePart, uploadDir, savedFileName);
                user.setUserProfile(savedFileName);
            }

            // 4. Update full name if provided
            if (fullName != null && !fullName.trim().isEmpty()) {
                user.setFullName(fullName.trim());
            }

            // 5. Update username if provided
            if (username != null && !username.trim().isEmpty()) {
                user.setUserName(username.trim());
            }
            

            if (isPasswordChange) {
                // New password and confirm password must match
                if (!newPass.equals(confirmPass)) {
                    request.setAttribute("user", user);
                    request.setAttribute("error", "New passwords do not match. No changes were saved.");
                    request.getRequestDispatcher("/WEB-INF/pages/userProfileEdit.jsp")
                           .forward(request, response);
                    return;
                }
                // Hash and set new password then update everything including password
                user.setPassword(PasswordUtil.getHashPassword(newPass));
                dao.updateUserWithPassword(user);

            } else {
                // No password change — only update name, username, profile picture
                dao.updateUserDetails(user);
            }

            // 7. Refresh the session with updated user data
            session.setAttribute("user", user);

            // 8. Redirect to user profile page to show updated details
            response.sendRedirect(request.getContextPath() + "/User");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("user", user);
            request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("/WEB-INF/pages/userProfileEdit.jsp")
                   .forward(request, response);
        }
    }
}