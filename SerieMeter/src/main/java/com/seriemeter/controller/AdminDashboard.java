package com.seriemeter.controller;

import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.UserModel;
import com.seriemeter.service.MediaService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = { "/Dashboard" })
public class AdminDashboard extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private MediaService mediaService;

    @Override
    public void init() {
        mediaService = new MediaService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Still pass user to JSP if session exists — safe to keep, doesn't enforce auth
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            request.setAttribute("loggedInUser", (UserModel) session.getAttribute("user"));
        }

        String action = request.getParameter("action");

        // If logout button was clicked, tell the JSP to show the logout confirmation modal
        if ("logoutConfirm".equals(action)) {
            request.setAttribute("showLogoutModal", true);
        }

        // If trash icon was clicked, tell the JSP to show the delete confirmation modal
        // Also pass the mediaId so the modal's Yes button knows which record to delete
        if ("deleteConfirm".equals(action)) {
            request.setAttribute("showDeleteModal", true);
            request.setAttribute("pendingDeleteId", request.getParameter("mediaId"));
        }

        // Read search and sort params from the request (empty string if not present)
        String search = request.getParameter("search") != null ? request.getParameter("search") : "";
        String sort   = request.getParameter("sort")   != null ? request.getParameter("sort")   : "";

        // Pass back to JSP so the form fields retain their values after submit
        request.setAttribute("searchValue", search);
        request.setAttribute("sortValue", sort);
        
        // Calling function from DAO and not service, because we have the avgrating function in DAO only.
        MediaDAO mediaDAO = new MediaDAO();
        List<MediaModel> mediaList = mediaDAO.getAllMediaWithAvgRating(search, sort);
		
        request.setAttribute("mediaList", mediaList);

        request.getRequestDispatcher("/WEB-INF/pages/adminDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Auth check commented out — will be handled by AdminFilter later
        /*
         * HttpSession session = request.getSession(false); if (session == null ||
         * session.getAttribute("user") == null) {
         * response.sendRedirect(request.getContextPath() + "/Login"); return; }
         */

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            request.setAttribute("loggedInUser", (UserModel) session.getAttribute("user"));
        }

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int mediaId = Integer.parseInt(request.getParameter("mediaId"));
            boolean deleted = mediaService.deleteMedia(mediaId);

            if (deleted) {
                request.setAttribute("message", "Media deleted successfully.");
            } else {
                request.setAttribute("error", "Failed to delete media.");
            }
        }

        doGet(request, response);
    }
}