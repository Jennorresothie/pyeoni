package com.pyeoni.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class JspFilter
 */
@WebFilter("*.jsp")
public class JspFilter extends HttpFilter implements Filter {

	/**
	 * @see HttpFilter#HttpFilter()
	 */
	public JspFilter() {
		System.out.println("jsp 체크 필터 생성");
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		System.out.println("jsp 체크 필터 파괴");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String page = req.getRequestURI();
		if (page.contains("page.jsp")) {
			System.out.println(page);
			page = page.replace("page.jsp", ".view");
			page = page.toLowerCase();
			System.out.println(page);

			res.sendRedirect(page);
			return;
		}

		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
