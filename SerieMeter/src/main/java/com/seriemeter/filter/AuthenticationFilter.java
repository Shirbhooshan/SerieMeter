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

@WebFilter(urlPatterns = { "/Login", "/Register" })
public class AuthenticationFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		// Get user from session
		UserModel user = (UserModel) SessionUtil.getAttribute(req, "user");

		if (user != null) {
			// Already logged in → redirect away from login/register
			if ("Admin".equalsIgnoreCase(user.getRole())) {
				res.sendRedirect(req.getContextPath() + "/Dashboard");
			} else {
				res.sendRedirect(req.getContextPath() + "/Explore");
			}
		} else {
			// Not logged in → allow access
			chain.doFilter(request, response);
		}
	}
}