package com.novel.osp.manager.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.novel.osp.manager.util.IConstants;

public class SecurityFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest servletrequest, ServletResponse servletresponse, FilterChain filterchain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletrequest;
		HttpServletResponse response = (HttpServletResponse) servletresponse;
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		String context = request.getContextPath();
		if (uri.trim().equals(context + "/logout") || uri.trim().equals(context + "/") || uri.trim().equals(context + "/login") || uri.trim().equals(context + "/index.jsp") || uri.trim().equals(context + "/index1.jsp")
				|| uri.trim().indexOf(context + "/static/") != -1) {
			filterchain.doFilter(servletrequest, servletresponse);
			return;
		}
		if (session.getAttribute(IConstants.MEMBERID) == null) {
			response.sendRedirect(context + "/");
			return;
		} else {
//			String purview = (String) session.getAttribute(IConstants.PURVIEW);
//			if (purview != null && !purview.equals("0") && (uri.indexOf(context + "system/member") != -1 && !(uri.indexOf(context + "system/member/password") != -1 || uri.indexOf(context + "system/member/updatePassword") != -1))) {
//				response.sendRedirect(context + "/");
//				return;
//			}
//			if (purview != null && purview.equals("2") && (uri.indexOf(context + "system/updateForm") != -1 || uri.indexOf(context + "ftp/update") != -1 || uri.indexOf(context + "channel/update") != -1)) {
//				response.sendRedirect(context + "/");
//				return;
//			}
			filterchain.doFilter(servletrequest, servletresponse);
		}
	}

	@Override
	public void init(FilterConfig filterconfig) throws ServletException {
	}

}
