package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.seriemeter.utils.SessionUtil;

/**
 * Servlet implementation class Logout
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/Logout" })
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public Logout() {
        super();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// Used Session's invalidateSession method to logout
        SessionUtil.invalidateSession(request);

        // Redirect the user to the login page
        response.sendRedirect(request.getContextPath() + "/Login");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}