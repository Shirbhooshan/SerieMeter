package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

import com.seriemeter.model.MediaModel;
import com.seriemeter.dao.MediaDAO;

@WebServlet(asyncSupported = true, urlPatterns = { "/AdminContent" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AdminContent extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MediaDAO mediaDAO = new MediaDAO();

    public AdminContent() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp").forward(request, response);
    }

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
}