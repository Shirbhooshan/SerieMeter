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
import com.seriemeter.utils.FileUploadUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/AdminContent" })
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize      = 1024 * 1024 * 10,  // 10MB
    maxRequestSize   = 1024 * 1024 * 50   // 50MB
)
public class AdminContent extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MediaDAO mediaDAO = new MediaDAO();

    public AdminContent() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/adminContent.jsp")
               .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Collect Form Data
        String title       = request.getParameter("title");
        String director    = request.getParameter("directorName"); // ✅ Fixed: matches name="directorName"
        String releaseDate = request.getParameter("release_date");
        String totalTime   = request.getParameter("total_time");
        String description = request.getParameter("description");
        int categoryId     = Integer.parseInt(request.getParameter("category_id"));
        int genreId        = Integer.parseInt(request.getParameter("genre_id"));

        // 2. Handle File Upload — saved OUTSIDE the project
        Part filePart = request.getPart("media_profile");
        String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();

        // Use the fixed external path from AppConstants
        File uploadDir = new File(FileUploadUtil.UPLOAD_DIR);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // mkdirs() creates parent folders too if missing
        }

        filePart.write(FileUploadUtil.UPLOAD_DIR + fileName);

        // 3. Populate Model
        MediaModel media = new MediaModel();
        media.setTitle(title);
        media.setDirector(director);
        media.setReleaseDate(releaseDate);
        media.setTotalTime(totalTime);
        media.setDescription(description);
        media.setCategoryId(categoryId);
        media.setGenreId(genreId);
        media.setMediaProfile(fileName); // Only the filename is stored in DB

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