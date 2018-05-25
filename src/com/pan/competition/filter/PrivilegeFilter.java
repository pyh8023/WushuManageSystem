package com.pan.competition.filter;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PrivilegeFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;

		String username = (String) request.getSession(true).getAttribute("username");

		if(username==null)
			response.sendRedirect( request.getContextPath()+ "/login.jsp");
		
		chain.doFilter(req, res);
	}
}
