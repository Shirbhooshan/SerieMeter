package com.seriemeter.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.seriemeter.utils.SessionUtil;

@WebServlet(asyncSupported = true, urlPatterns = { "/Logout" })
public class Logout extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Logout() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Invalidate the session
        SessionUtil.invalidateSession(request);

        // Cookie clearing
        Cookie cookie = new Cookie("rememberMe", "");
        cookie.setMaxAge(0);      // tells browser to delete it immediately
        cookie.setPath("/");      // matching the path when cookie was created
        response.addCookie(cookie);

        // Redirect to login
        response.sendRedirect(request.getContextPath() + "/Login");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}