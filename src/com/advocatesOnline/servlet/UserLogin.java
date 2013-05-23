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

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.advocatesOnline.entity.User;
import com.advocatesOnline.enums.UserType;
import com.advocatesOnline.service.LoginService;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.servlet
 * File             : UserLogin.java
 * Created On       : 18-May-2013 9:09:17 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time                 | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 18-May-2013 9:09:17 PM      | Initial Version
 *</pre>
 */


/**
 * Servlet implementation class UserLogin
 */
@WebServlet(description = "User login action will be hitting to this servlet", urlPatterns = { "/UserLogin" })
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(UserLogin.class);
	LoginService loginService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogin() {
        super();
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	super.init(config);
    	WebApplicationContext factory =  WebApplicationContextUtils.getWebApplicationContext(config.getServletContext());
    	loginService = factory.getBean(LoginService.class);
		
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
		logger.debug(UserLogin.class + "doPost() enter");
		response.setContentType("text/html"); 
		
		try{
			String email = "";
			String password = "";
			String userType = "";
			email = request.getParameter("emailTextField") != null ? request.getParameter("emailTextField") : ""; 
			password = request.getParameter("passwordTextField") != null ? request.getParameter("passwordTextField") : "";
			userType = request.getParameter("userTypeHiddenField") != null ? request.getParameter("userTypeHiddenField") : "";
				 
			log("Log4j logging starting...");
			
			User user = new User();
			user.setEmail(email);
			user.setPassword(DigestUtils.md5Hex(password));
			user.setUserType(UserType.valueOf(userType.toString()));
			
			System.out.println("****************** Values from user object ***********");
			System.out.println("Email -->>"+user.getEmail());
			System.out.println("Password -->>"+user.getPassword());
			System.out.println("User Type -->>"+user.getUserType());
			
			logger.debug("Email -->>"+user.getEmail());
			logger.debug("Password -->>"+user.getPassword());
			logger.debug("User Type -->>"+user.getUserType());
						
			boolean login = loginService.validateAndLogin(user);
			if(login){
				System.out.println("logingIn -->>"+getServletContext().getContextPath()+"/user/UserMenuBar.jsp");
				response.getWriter().write("Welcome <b>" +user.getName()+" to AdvocatesOnline.</b>");
				//RequestDispatcher dispatcher = request.getRequestDispatcher("/user/UserMenuBar.jsp");
				//dispatcher.forward(request,response);
				response.sendRedirect("NewFile.jsp");
			}
			else {
				System.out.println("Invalid login...Please check user name and password.");
				response.getWriter().write("Problem while logining into AdvocatesOnline. Please check your username or password.</br>If problem continous please write to admin@weblearning.com");
			}
    		
		}catch(Exception e){
			e.printStackTrace();
			logger.debug(UserLogin.class +" Exception in doPost() ", e);
		}
		logger.debug(UserLogin.class + "doPost() leave");
	}
}
