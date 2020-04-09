package com.licz.ssm.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.licz.ssm.util.LoginUserUtil;



public class SessionFilter implements Filter{
	
	public void destroy() { }

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		String requestURL = request.getRequestURL().toString();
		if(requestURL.indexOf("login.action") == -1 && requestURL.indexOf("login.jsp") == -1 && requestURL.indexOf("loginOut.action") == -1 && requestURL.indexOf("homePage.jsp") == -1){
			String ctx = request.getContextPath();
			if(null == LoginUserUtil.getLoginUser(request)){
				response.sendRedirect(ctx+"/jsp/login.jsp");
				return;
			}
		}
        filterChain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("###########################SessionFilter init success###########################");
	}

}
