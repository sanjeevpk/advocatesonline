/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */
package com.advocatesOnline.servlet;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.advocatesOnline.entity.User;
import com.advocatesOnline.service.UserService;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.servlet
 * File             : Profile.java
 * Created On       : 28-Jun-2013 2:19:57 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 28-Jun-2013 2:19:57 PM      | Initial Version
 *</pre>
 */


/**
 * Servlet implementation class UserProfile
 */
@WebServlet("/UserProfile")
public class UserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(UserProfile.class);
	String className = UserProfile.class.getName();
	UserService userService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfile() {
        super();
    }

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		WebApplicationContext factory = WebApplicationContextUtils.getWebApplicationContext(config.getServletContext());
		userService = factory.getBean(UserService.class);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = " : doPost() :: ";
		logger.info(className + method + "enter");
		
		try{
			HttpSession session = request.getSession(false);
			User userDetails = (User)session.getAttribute("USER_DETAILS");
			if(userDetails != null){ 
				int userId = userDetails.getId();
				if(request.getParameter("edit") != null){
					logger.info(className + method + "about to edit profile of "+userId);
					
					
				}else if(request.getParameter("view") != null){
					logger.info(className + method + "about to view profile of" +userId);
					User user = userService.viewUserProfile(userId);
					if(user != null){
						request.setAttribute("VIEW_USER_PROFILE", user);
						logger.info(className + method + "about to display user profile");
						RequestDispatcher dispatcher = request.getRequestDispatcher("/user/ViewUserProfile.jsp");
						dispatcher.forward(request, response);
					}
				}
		}
		
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e.toString());
			logger.info(className + method , e);
		}
		logger.info(className + method + "leave");
	}

}
