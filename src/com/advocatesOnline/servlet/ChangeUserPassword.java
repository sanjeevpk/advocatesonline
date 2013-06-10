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
 * File             : ChnageUserPassword.java
 * Created On       : 30-May-2013 6:15:10 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 30-May-2013 6:15:10 PM      | Initial Version
 *</pre>
 */

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.advocatesOnline.entity.User;
import com.advocatesOnline.service.UserService;

/**
 * Servlet implementation class ChangeUserPassword
 */
@WebServlet("/ChangeUserPassword")
public class ChangeUserPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeUserPassword() {
        super();
    }
    
    /* (non-Javadoc)
     * @see javax.servlet.GenericServlet#init(javax.servlet.ServletConfig)
     */
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
		String oldPassword = request.getParameter("oldPasswordTextField") != null ? request.getParameter("oldPasswordTextField") : "";
		String newPassword = request.getParameter("newPasswordTextField") != null ? request.getParameter("newPasswordTextField") : "";
		String confirmNewPassword = request.getParameter("confirmNewPasswordTextField") != null ? request.getParameter("confirmNewPasswordTextField") : "";
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("USERID") != null ? (String)session.getAttribute("USERID") : "";
		System.out.println("user Id-->> "+userId);
		
		boolean passwordChnaged = userService.chageUserPassword(userId, oldPassword, newPassword, confirmNewPassword);
		if(passwordChnaged){
			System.out.println("Password changed successfully.");
			response.getWriter().write("Password has been changed successfully!");
			
		}else{
			System.out.println("Password did not changed");
			response.getWriter().write("Password has not been successful!");
		}
	}
}
