package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.seriemeter.dao.BookmarkDAO;
import com.seriemeter.model.MediaModel;
import com.seriemeter.model.UserModel;

@WebServlet(asyncSupported = true, urlPatterns = { "/Bookmark" })
public class Bookmark extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // loads the user's bookmarks and shows in the page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // If not logged in sends user to the logged-out bookmark page
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/Bookmarks");
            return;
        }

        // Getting logged in user from session
        UserModel user = (UserModel) session.getAttribute("user");

        // Loads the user's bookmarks
        BookmarkDAO bookmarkDAO = new BookmarkDAO();
        List<MediaModel> bookmarkList = bookmarkDAO.getBookmarkedMedia(user.getUserId());

        // Puts the list in request so bookmark.jsp can loop through it
        request.setAttribute("bookmarkList", bookmarkList);

        request.getRequestDispatcher("/WEB-INF/pages/bookmark.jsp").forward(request, response);
    }

    // handles remove one or clear all actions
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // If not logged in sends user back to login
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        UserModel user = (UserModel) session.getAttribute("user");
        BookmarkDAO bookmarkDAO = new BookmarkDAO();

        // action param tells us what to do
        String action = request.getParameter("action");

        if ("remove".equals(action)) {
            // Remove one bookmark, mediaId comes from hidden form field in JSP
            int mediaId = Integer.parseInt(request.getParameter("mediaId"));
            bookmarkDAO.removeBookmark(user.getUserId(), mediaId);

        } else if ("clearAll".equals(action)) {
            // Remove all bookmarks for this user
        	bookmarkDAO.clearAllBookmarks(user.getUserId());
        }

        // Redirect back to GET so the page reloads with updated list
        response.sendRedirect(request.getContextPath() + "/Bookmark");
    }
}
