package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.seriemeter.dao.MediaDAO;
import com.seriemeter.model.MediaModel;

@WebServlet(asyncSupported = true, urlPatterns = { "/Explore" })
public class Explore extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MediaDAO mediaDAO = new MediaDAO();

        // Getting trending movies/series (top 8 most reviewed) 
        List<MediaModel> trendingList = mediaDAO.getTrendingMedia();

        // Getting movies (category_id = 1)
        List<MediaModel> movieList = mediaDAO.getMovies();

        // Getting series (category_id = 2)
        List<MediaModel> seriesList = mediaDAO.getSeries();

        // Putting all three lists into request so explore.jsp can read them
        request.setAttribute("trendingList", trendingList);
        request.setAttribute("movieList", movieList);
        request.setAttribute("seriesList", seriesList);

        // Forward to the JSP
        request.getRequestDispatcher("/WEB-INF/pages/explore.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
