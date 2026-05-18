package com.seriemeter.controller;

import com.seriemeter.model.MediaModel;
import com.seriemeter.model.ReviewModel;
import com.seriemeter.model.UserModel;
import com.seriemeter.service.UserProfileService;
import com.seriemeter.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(asyncSupported = true, urlPatterns = { "/User" })
public class UserProfile extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserProfileService userProfileService;

    @Override
    public void init() {
        userProfileService = new UserProfileService();
    }

    /**
     * GET /User
     *
     * Reads the logged-in user from the session, fetches their reviews and
     * bookmarks (respecting an optional ?reviewSort=newest / ?bookmarkSort=oldest
     * query param), then forwards to userProfile.jsp with the following request
     * attributes set:
     *
     *   sessionUser    – the UserModel stored in the session
     *   userReviews    – List<ReviewModel>  shown in the Reviews card
     *   userBookmarks  – List<MediaModel>   shown in the Bookmarks card
     *   reviewCount    – int  shown in the stats banner
     *   bookmarkCount  – int  shown in the stats banner
     *   reviewSort     – "oldest" | "newest"  used to highlight the active sort btn
     *   bookmarkSort   – "oldest" | "newest"  used to highlight the active sort btn
     *   now            – java.util.Date  used by the JSP to compute relative dates
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Read the logged-in user from the session
        UserModel sessionUser = (UserModel) SessionUtil.getAttribute(request, "user");

        // 2. Guard: if no session exists, redirect to login
        if (sessionUser == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        int userId = sessionUser.getUserId();

        // 3. Read optional sort parameters from the URL query string
        //    e.g. /User?reviewSort=newest&bookmarkSort=oldest
        //    Defaults to "oldest" when not provided.
        String reviewSort   = request.getParameter("reviewSort");
        String bookmarkSort = request.getParameter("bookmarkSort");

        if (reviewSort == null || reviewSort.isEmpty()) {
            reviewSort = "oldest";
        }
        if (bookmarkSort == null || bookmarkSort.isEmpty()) {
            bookmarkSort = "oldest";
        }

        // 4. Fetch data via the service layer
        List<ReviewModel> userReviews   = userProfileService.getReviews(userId, reviewSort);
        List<MediaModel>  userBookmarks = userProfileService.getBookmarks(userId, bookmarkSort);
        int               reviewCount   = userProfileService.getReviewCount(userId);
        int               bookmarkCount = userProfileService.getBookmarkCount(userId);

        // 5. Expose everything as request attributes for the JSP
        request.setAttribute("sessionUser",   sessionUser);
        request.setAttribute("userReviews",   userReviews);
        request.setAttribute("userBookmarks", userBookmarks);
        request.setAttribute("reviewCount",   reviewCount);
        request.setAttribute("bookmarkCount", bookmarkCount);
        request.setAttribute("reviewSort",    reviewSort);
        request.setAttribute("bookmarkSort",  bookmarkSort);
        // FIX: provide current time so the JSP can compute relative review dates
        request.setAttribute("now", new Date());

        // 6. Determine whether the popup menu should be visible.
        //    The three-dot form submits ?action=open-menu to open it.
        //    The backdrop form submits ?action=close to hide it.
        //    Edit-profile and logout are plain <a> links inside the popup.
        //    Any other value (or no value) keeps the popup hidden.
        String action = request.getParameter("action");
        String popupStyle;
        if ("open-menu".equals(action)) {
            popupStyle = "display:block";
        } else {
            popupStyle = "display:none";
        }
        request.setAttribute("popupStyle", popupStyle);

        // 7. Forward to the view
        request.getRequestDispatcher("/WEB-INF/pages/userProfile.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
