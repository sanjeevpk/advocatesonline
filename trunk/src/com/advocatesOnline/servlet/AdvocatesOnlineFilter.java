/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.servlet;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.servlet
 * File             : AdvocateOnlineFilter.java
 * Created On       : 17-Jun-2013 5:14:52 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 17-Jun-2013 5:14:52 PM      | Initial Version
 *</pre>
 */


import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;

import com.advocatesOnline.entity.User;
import com.advocatesOnline.enums.UserType;
import com.advocatesOnline.service.LoginService;

/**
 * Servlet Filter implementation class AdvocatesOnlineFilter
 */
@WebFilter("/AdvocatesOnlineFilter")
public class AdvocatesOnlineFilter implements Filter {

	private static final Logger logger = Logger.getLogger(AdvocatesOnlineFilter.class);
	LoginService loginService;
	private ArrayList<String> urlList;
	private FilterConfig filterConfig = null;

	/**
	 * Default constructor. 
	 */
	public AdvocatesOnlineFilter() {
		super();
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {

	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession(false);
		boolean allowedRequest = false;
		String url = request.getServletPath();

		String urls = filterConfig.getInitParameter("avoid-urls");
		System.out.println(urls);
		StringTokenizer token = new StringTokenizer(urls, ",");

		urlList = new ArrayList<String>();

		while (token.hasMoreTokens()) {
			System.out.println(token);
			urlList.add(token.nextToken());
		}

		try{
			//session.setAttribute("USERID", "100");

			if(urlList.contains(url)) {
				allowedRequest = true;
			}

			if (!allowedRequest) {
				if (null != session.getAttribute("USERID") || "" != session.getAttribute("USERID") || !session.getAttribute("USERID").equals("")){ 
					System.out.println("Session already exists...So continuing...");
					chain.doFilter(req, res);  
				}else{
					System.out.println("Session expired! Please login again to continue using");
					request.setAttribute("USER_SESSION_EXPIRED", "Your session has ended. Please login!");
					RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath() + "/UserLogin.jsp");
					rd.include(request, response);
					rd.forward(request, response);
					return;
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
			logger.debug(UserLogin.class +" Exception in doPost() ", e);
		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
		
	}
}
