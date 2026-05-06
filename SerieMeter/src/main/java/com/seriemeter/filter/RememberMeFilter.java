package com.seriemeter.filter;

import com.seriemeter.dao.UserDAO;
import com.seriemeter.model.UserModel;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = { "/*" })
public class RememberMeFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpSession session = httpReq.getSession(false);

		// If session already has a user, no need to check cookie
		boolean sessionHasUser = session != null && session.getAttribute("user") != null;

		if (!sessionHasUser) {
			Cookie[] cookies = httpReq.getCookies();
			if (cookies != null) {
				String rememberedUsername = null;

				for (Cookie cookie : cookies) {
					if ("rememberMe".equals(cookie.getName())) {
						rememberedUsername = cookie.getValue();
						break;
					}
				}

				if (rememberedUsername != null && !rememberedUsername.isEmpty()) {
					try {
						UserDAO userDAO = new UserDAO();
						UserModel user = userDAO.getUserByUsername(rememberedUsername);

						if (user != null) {
							// Restore session from cookie
							HttpSession newSession = httpReq.getSession(true);
							newSession.setAttribute("user", user);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}

		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
	}
}