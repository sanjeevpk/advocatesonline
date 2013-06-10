/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.servlet;

import java.io.IOException;
import java.util.Date;

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
import com.advocatesOnline.enums.Gender;
import com.advocatesOnline.enums.UserType;
import com.advocatesOnline.service.RegistrationService;


/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.servlet
 * File             : RegisterUser.java
 * Created On       : 15-May-2013 8:46:11 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time                 | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 15-May-2013 8:46:11 PM      | Initial Version
 *</pre>
 */


/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(RegisterUser.class);
	RegistrationService registrationService;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
        super();
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	
    	super.init(config);
    	WebApplicationContext factory =  WebApplicationContextUtils.getWebApplicationContext(config.getServletContext());
    	registrationService = factory.getBean(RegistrationService.class);
		
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
		logger.debug(RegisterUser.class + " doPost() enter");
		response.setContentType("text/html"); 
		
    	try{
			String name = "";
			String email = "";
			String password = "";
			String gender = "";
			String userType = "";
			//Date dob = new Date();
			
			name = request.getParameter("nameTextField") != null ? request.getParameter("nameTextField") : "";
					
			email = request.getParameter("emailTextField") != null ? request.getParameter("emailTextField") : ""; 
				
			password = request.getParameter("passwordTextField") != null ? request.getParameter("passwordTextField") : "";
			
			gender = request.getParameter("genderRadioField") != null ? request.getParameter("genderRadioField") : "";
			
			userType = request.getParameter("userTypeHiddenField") != null ? request.getParameter("userTypeHiddenField") : "";
				 
			log("Log4j logging starting...");
			
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPassword(DigestUtils.md5Hex(password));
			user.setGender(Gender.valueOf(gender.toString()));
			user.setActive(true);
			user.setUserType(UserType.valueOf(userType.toString()));
			user.setCreatedBy(Long.toString(user.getId()));
			user.setCreatedOn(new Date());
			user.setCreatedTime(new Date());
			
			System.out.println("****************** Values from user object ***********");
			System.out.println("Name -->>"+user.getName());
			System.out.println("Email -->>"+user.getEmail());
			System.out.println("Password -->>"+user.getPassword());
			System.out.println("Gender -->>"+user.getGender());
			System.out.println("User Type -->>"+user.getUserType());
			
			logger.debug("Name-->>"+user.getName());
			logger.debug("Email -->>"+user.getEmail());
			logger.debug("Password -->>"+user.getPassword());
			logger.debug("Gender -->>"+user.getGender());	
			logger.debug("User Type -->>"+user.getUserType());
			
			boolean uniqueEmail = registrationService.checkEmailUniqness(user);
			System.out.println("UniqueEmail ? "+uniqueEmail);
			if(!uniqueEmail){
				boolean saved = registrationService.saveNewRegistration(user);//ServiceFactory.getRegistrationService().saveNewRegistration(user);
				if(saved){
					System.out.println("Saved!!!");
					response.getWriter().write("New user <b>" +user.getName()+" </b>has been registered successfully. Please check your email for confirmation of registaration by clicking the link in it.");
				}
				else {
					System.out.println("Not Saved...");
					response.getWriter().write("Problem while registering the New user <b>" +user.getName()+" </b> Please write to admin@weblearning.com");
				}
			}
			else{
				System.out.println("Email Id already exists...");
				response.getWriter().write("Given Email already exists with AdvocatesOnline. Please choose another email or login to AdvocatesOnline.");
			}
			
    		
    	}catch(Exception e){
    		e.printStackTrace();
    		System.out.println(e.toString());
    		logger.debug(RegisterUser.class + " doGet() ", e);
    	}
    	
    	logger.debug(RegisterUser.class + " doPost() leave");
	}

}
