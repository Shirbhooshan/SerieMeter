package com.seriemeter.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.seriemeter.model.UserModel;

@WebFilter(urlPatterns = { "/AdminBoard", "/AdminContent", "/Users", "/Edit" })
public class AdminFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {}

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpReq  = (HttpServletRequest) request;
        HttpServletResponse httpRes = (HttpServletResponse) response;

        HttpSession session = httpReq.getSession(false); // false = don't create a new session
        UserModel user = (session != null) ? (UserModel) session.getAttribute("user") : null;

        boolean isAdmin = user != null && "Admin".equals(user.getRole());

        if (isAdmin) {
            chain.doFilter(request, response); // allow through
        } else {
            httpRes.sendRedirect(httpReq.getContextPath() + "/404");
        }
    }

    public void destroy() {}
}