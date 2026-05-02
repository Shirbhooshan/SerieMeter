package com.seriemeter.controller;

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

@WebServlet(urlPatterns = { "/AdminDashboard" })
public class AdminDashboard extends HttpServlet {
<<<<<<< HEAD
	private static final long serialVersionUID = 1L;
=======

    private static final long serialVersionUID = 1L;
    private MediaService mediaService;

    @Override
    public void init() {
        mediaService = new MediaService();
    }
>>>>>>> refs/remotes/origin/avin

<<<<<<< HEAD
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminDashboard() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/adminDashboard.jsp").forward(request, response);
	}
=======
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
>>>>>>> refs/remotes/origin/avin

<<<<<<< HEAD
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
=======
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }
>>>>>>> refs/remotes/origin/avin

        UserModel loggedInUser = (UserModel) session.getAttribute("user");
        request.setAttribute("loggedInUser", loggedInUser);

        List<MediaModel> mediaList = mediaService.getAllMedia();
        request.setAttribute("mediaList", mediaList);

        request.getRequestDispatcher("/WEB-INF/pages/adminDashboard.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int mediaId = Integer.parseInt(request.getParameter("mediaId"));
            boolean deleted = mediaService.deleteMedia(mediaId);
            if (deleted) {
                request.setAttribute("message", "Media deleted successfully.");
            } else {
                request.setAttribute("error", "Failed to delete media. Please try again.");
            }
        }
        doGet(request, response);
    }
}