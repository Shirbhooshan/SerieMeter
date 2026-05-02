package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@WebServlet("/getimage")
public class GetImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Base root folder
    private static final String BASE_DIR = System.getProperty("user.home")
            + File.separator + "seriemeter_uploads";

    // Subfolders
    public static final String USER_DIR  = BASE_DIR + File.separator + "user_uploads";
    public static final String MEDIA_DIR = BASE_DIR + File.separator + "media_uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String type = request.getParameter("type"); // "user" or "media"

        if (name == null || name.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing name parameter");
            return;
        }

        // Pick the correct subfolder based on type param
        String uploadDir = "media".equals(type) ? MEDIA_DIR : USER_DIR;
        File folder = new File(uploadDir);

        if (!folder.exists() || !folder.isDirectory()) {
            serveDefault(request, response);
            return;
        }

        File[] matches;

        // Full filename (e.g. "the_dark_knight.jpg") → direct lookup in media_uploads
        // Just username (e.g. "John") → prefix search in user_uploads
        if (name.contains(".")) {
            File directFile = new File(folder, name);
            matches = directFile.exists() ? new File[]{directFile} : new File[0];
        } else {
            matches = folder.listFiles((dir, fileName) -> fileName.startsWith(name + "."));
        }

        if (matches != null && matches.length > 0) {
            File imageFile = matches[0];
            String contentType = getServletContext().getMimeType(imageFile.getName());
            if (contentType == null) contentType = "image/jpeg";
            response.setContentType(contentType);
            response.setContentLength((int) imageFile.length());
            Files.copy(imageFile.toPath(), response.getOutputStream());
        } else {
            serveDefault(request, response);
        }
    }

    private void serveDefault(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String defaultPath = getServletContext().getRealPath("/assets/images/default_profile.png");
        File defaultFile = new File(defaultPath);
        if (defaultFile.exists()) {
            response.setContentType("image/png");
            response.setContentLength((int) defaultFile.length());
            Files.copy(defaultFile.toPath(), response.getOutputStream());
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found");
        }
    }
}