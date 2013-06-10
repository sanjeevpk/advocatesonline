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

import com.advocatesOnline.entity.Advocate;
import com.advocatesOnline.entity.User;
import com.advocatesOnline.enums.Gender;
import com.advocatesOnline.enums.UserType;
import com.advocatesOnline.service.RegistrationService;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.servlet
 * File             : RegisterAdvocate.java
 * Created On       : 27-May-2013 14:24:11 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time                 	| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 27-May-2013 14:21:11 PM      	| Initial Version
 *</pre>
 */

/**
 * Servlet implementation class RegisterAdvocate
 */
@WebServlet("/RegisterAdvocate")
public class RegisterAdvocate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(RegisterAdvocate.class);
	RegistrationService registrationService;
	private String className = RegisterAdvocate.class.getName();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAdvocate() {
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
		logger.debug(className + " doPost() enter");
		response.setContentType("text/html"); 
		
    	try{
			String name = "";
			String email = "";
			String password = "";
			String gender = "";
			String userType = "";
			String barCouncilNo = "";
			//Date dob = new Date();
			
			name = request.getParameter("nameTextField") != null ? request.getParameter("nameTextField") : "";
					
			email = request.getParameter("emailTextField") != null ? request.getParameter("emailTextField") : ""; 
				
			password = request.getParameter("passwordTextField") != null ? request.getParameter("passwordTextField") : "";
			
			gender = request.getParameter("genderRadioField") != null ? request.getParameter("genderRadioField") : "";
			
			userType = request.getParameter("userTypeHiddenField") != null ? request.getParameter("userTypeHiddenField") : "";
			
			barCouncilNo = request.getParameter("barCouncilTextField") != null ? request.getParameter("barCouncilTextField") : ""; 
				 
			log("Log4j logging starting...");
			
			Advocate advocate = new Advocate();
			advocate.setName(name);
			advocate.setEmail(email);
			advocate.setPassword(DigestUtils.md5Hex(password));
			advocate.setGender(Gender.valueOf(gender.toString()));
			advocate.setActive(true);
			advocate.setUserType(UserType.valueOf(userType.toString()));
			advocate.setCreatedBy(Long.toString(advocate.getId()));
			advocate.setCreatedOn(new Date());
			advocate.setCreatedTime(new Date());
			advocate.setBarCouncilNo(barCouncilNo);
			
			System.out.println("****************** Values from user object ***********");
			System.out.println("Name -->>"+advocate.getName());
			System.out.println("Email -->>"+advocate.getEmail());
			System.out.println("Password -->>"+advocate.getPassword());
			System.out.println("Gender -->>"+advocate.getGender());
			System.out.println("User Type -->>"+advocate.getUserType());
			
			logger.debug("Name-->>"+advocate.getName());
			logger.debug("Email -->>"+advocate.getEmail());
			logger.debug("Password -->>"+advocate.getPassword());
			logger.debug("Gender -->>"+advocate.getGender());	
			logger.debug("User Type -->>"+advocate.getUserType());
			
			boolean uniqueEmail = registrationService.checkEmailUniqness(advocate);
			System.out.println("UniqueEmail ? "+uniqueEmail);
			if(!uniqueEmail){
				boolean saved = registrationService.saveNewAdvocateRegistration(advocate);//ServiceFactory.getRegistrationService().saveNewRegistration(user);
				if(saved){
					System.out.println("Saved!!!");
					response.getWriter().write("New user <b>" +advocate.getName()+" </b>has been registered successfully. Please check your email for confirmation of registaration by clicking the link in it.");
				}
				else {
					System.out.println("Not Saved...");
					response.getWriter().write("Problem while registering the New user <b>" +advocate.getName()+" </b> Please write to admin@weblearning.com");
				}
			}
			else{
				System.out.println("Email Id already exists...");
				response.getWriter().write("Given Email already exists with AdvocatesOnline. Please choose another email or login to AdvocatesOnline.");
			}
			
    		
    	}catch(Exception e){
    		e.printStackTrace();
    		System.out.println(e.toString());
    		logger.debug(className + " doPost() ", e);
    	}
    	
    	logger.debug(className + " doPost() leave");
	}

}
