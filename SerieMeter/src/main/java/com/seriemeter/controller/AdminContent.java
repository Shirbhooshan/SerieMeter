package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
<<<<<<< HEAD

=======
>>>>>>> branch 'Shirbhooshan' of https://github.com/Shirbhooshan/SerieMeter.git
import java.io.File;
import java.io.IOException;

<<<<<<< HEAD
import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
=======
import com.seriemeter.model.MediaModel;
import com.seriemeter.dao.MediaDAO;

>>>>>>> branch 'Shirbhooshan' of https://github.com/Shirbhooshan/SerieMeter.git

import com.seriemeter.model.MediaModel;
import com.seriemeter.dao.MediaDAO;


import com.seriemeter.model.MediaModel;
import com.seriemeter.dao.MediaDAO;


import com.seriemeter.model.MediaModel;
import com.seriemeter.dao.MediaDAO;


import com.seriemeter.model.MediaModel;
import com.seriemeter.dao.MediaDAO;


import com.seriemeter.model.MediaModel;
import com.seriemeter.dao.MediaDAO;

@WebServlet(asyncSupported = true, urlPatterns = { "/AdminContent" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AdminContent extends HttpServlet {
<<<<<<< HEAD
	private static final long serialVersionUID = 1L;
	private MediaDAO mediaDAO = new MediaDAO();
=======
    private static final long serialVersionUID = 1L;
    private MediaDAO mediaDAO = new MediaDAO();

    public AdminContent() {
        super();
    }
>>>>>>> branch 'Shirbhooshan' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp").forward(request, response);
	}
=======
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp").forward(request, response);
    }
>>>>>>> branch 'Shirbhooshan' of https://github.com/Shirbhooshan/SerieMeter.git

<<<<<<< HEAD
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// 1. Read text fields
			String title = request.getParameter("title");
			String director = request.getParameter("director");
			String releaseDate = request.getParameter("release_date");
			String totalTime = request.getParameter("total_time");
			String description = request.getParameter("description");
			int categoryId = Integer.parseInt(request.getParameter("category_id"));
			int genreId = Integer.parseInt(request.getParameter("genre_id"));

			// 2. Build filename from title e.g. "The Dark Knight" → "the_dark_knight.jpg"
			Part filePart = request.getPart("media_profile");
			String originalName = filePart.getSubmittedFileName();
			String extension = originalName.substring(originalName.lastIndexOf(".")); // e.g. ".jpg"
			String fileName = title.trim().toLowerCase().replaceAll("\\s+", "_") + extension;

			// 3. Save file to user home root folder
			String uploadDir = System.getProperty("user.home") + File.separator + "seriemeter_uploads";
			File folder = new File(uploadDir);
			if (!folder.exists())
				folder.mkdirs();
			filePart.write(uploadDir + File.separator + fileName);

			// 4. Build model
			MediaModel media = new MediaModel();
			media.setTitle(title);
			media.setDirector(director);
			media.setReleaseDate(releaseDate);
			media.setTotalTime(totalTime);
			media.setDescription(description);
			media.setMediaProfile(fileName); // stores "the_dark_knight.jpg"
			media.setCategoryId(categoryId);
			media.setGenreId(genreId);

			// 5. Save to DB
			int result = mediaDAO.saveMedia(media);

			if (result > 0) {
				response.sendRedirect(request.getContextPath() + "/AdminContent?success=true");
			} else {
				request.setAttribute("error", "DB insert returned 0. Check console.");
				doGet(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Exception: " + e.getMessage());
			doGet(request, response);
		}
	}
=======
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. Collect Form Data
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        String releaseDate = request.getParameter("release_date");
        String totalTime = request.getParameter("total_time");
        String description = request.getParameter("description");
        int categoryId = Integer.parseInt(request.getParameter("category_id"));
        int genreId = Integer.parseInt(request.getParameter("genre_id"));

        // 2. Handle File Upload (Media Profile)
        Part filePart = request.getPart("media_profile");
        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
        
        // Define path to save image (In webapp/assets/images)
        String uploadPath = getServletContext().getRealPath("") + File.separator + "assets" + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        
        filePart.write(uploadPath + File.separator + fileName);

        // 3. Populate Model
        MediaModel media = new MediaModel();
        media.setTitle(title);
        media.setDirector(director);
        media.setReleaseDate(releaseDate);
        media.setTotalTime(totalTime);
        media.setDescription(description);
        media.setCategoryId(categoryId);
        media.setGenreId(genreId);
        media.setMediaProfile(fileName); // Save filename to DB

        // 4. Save to Database
        int result = mediaDAO.saveMedia(media);

        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/AdminContent?success=true");
        } else {
            request.setAttribute("error", "Failed to publish content.");
            doGet(request, response);
        }
    }
>>>>>>> branch 'Shirbhooshan' of https://github.com/Shirbhooshan/SerieMeter.git
}