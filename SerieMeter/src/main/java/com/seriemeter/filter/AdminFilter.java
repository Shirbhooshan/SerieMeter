package com.seriemeter.filter;

import java.io.IOException;

import com.seriemeter.model.UserModel;
import com.seriemeter.utils.SessionUtil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebFilter(urlPatterns = { "/Edit", "/Users", "/AdminContent", "/Dashboard" })
public class AdminFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		// Get user from session
		UserModel user = (UserModel) SessionUtil.getAttribute(req, "user");

		if (user != null && "Admin".equalsIgnoreCase(user.getRole())) {
			// Allow access
			chain.doFilter(request, response);
		} else {
			// Redirect if not admin
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
		}
	}
}