/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


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
 * File             : ViewCases.java
 * Created On       : 08-Jul-2013 11:14:37 AM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		 | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 08-Jul-2013 11:14:37 AM      | Initial Version
 *</pre>
 */

/**
 * Servlet implementation class UploadImage
 */
@WebServlet("/UploadImage")
@MultipartConfig(maxFileSize = 10177215)
public class UploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Logger logger = Logger.getLogger(UploadImage.class);
	UserService userService;
	final static String className = UploadImage.class.getName();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImage() {
        super();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
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
		String methodName = " : doPost() ";
		logger.info(className + methodName + "enter");
		InputStream inputStream = null;
		
		try{
			HttpSession session = request.getSession(false);
			User user = (User)session.getAttribute("USER_DETAILS");
			
			Part filePart = request.getPart("photo");
	        if (filePart != null && user != null) {
	        	System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	            
	            if(filePart.getSize() > 5952840){
	            	response.getWriter().write("File size is too big to upload.");
	            }
	            else{
	                inputStream = filePart.getInputStream();   
		            userService.uploadImage(user,inputStream);
		            request.setAttribute("USER", user);
		            //RequestDispatcher dispatcher = request.getRequestDispatcher("/user/EditUserProfile.jsp");
		            //dispatcher.forward(request, response);
		            response.sendRedirect("/AdvocatesOnline/user/EditUserProfile.jsp");//Need to check why getServletContxt() is giving NOP
		            return;
		        }
	        }
			
		}catch(Exception e){
			System.out.println(e);
			logger.info(className + methodName, e);
		}
		logger.info(className + methodName + "leave");
	}

}
