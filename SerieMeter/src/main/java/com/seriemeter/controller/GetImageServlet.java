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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");

		if (name == null || name.trim().isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing name parameter");
			return;
		}

		String uploadDir = System.getProperty("user.home") + File.separator + "seriemeter_uploads";
		File folder = new File(uploadDir);

		if (!folder.exists() || !folder.isDirectory()) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "Storage directory not found");
			return;
		}

		File[] matches;

		// If name already has an extension (e.g. "the_dark_knight.jpg") — direct file
		// lookup
		// If no extension (e.g. "John") — search by prefix for user profile pictures
		if (name.contains(".")) {
			File directFile = new File(folder, name);
			matches = directFile.exists() ? new File[] { directFile } : new File[0];
		} else {
			matches = folder.listFiles((dir, fileName) -> fileName.startsWith(name + "."));
		}

		if (matches != null && matches.length > 0) {
			File imageFile = matches[0];
			String contentType = getServletContext().getMimeType(imageFile.getName());
			if (contentType == null)
				contentType = "image/jpeg";
			response.setContentType(contentType);
			response.setContentLength((int) imageFile.length());
			Files.copy(imageFile.toPath(), response.getOutputStream());
		} else {
			// Fallback to default profile image inside the project
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
}