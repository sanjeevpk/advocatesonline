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
 * File             : DisplayImage.java
 * Created On       : 10-Jul-2013 8:10:41 PM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 10-Jul-2013 8:10:41 PM      | Initial Version
 *</pre>
 */



import java.io.BufferedOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.advocatesOnline.entity.User;
import com.advocatesOnline.service.UserService;

/**
 * Servlet implementation class DisplayImage
 */
@WebServlet("/DisplayImage")
public class DisplayImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService;
	Logger logger = Logger.getLogger(DisplayImage.class);
	String className = DisplayImage.class.getName();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayImage() {
        super();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(config.getServletContext());
		userService = context.getBean(UserService.class);
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

		try{
			String imageId = request.getParameter("id");
			System.out.println(imageId);
			if (imageId == null) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404.
				return;
			}

			User user = userService.displayImaage(imageId);
			if(user != null){
				response.reset();
				response.setContentType("image/jpeg");
				BufferedOutputStream output = null;
	
			    try {
			    		output = new BufferedOutputStream(response.getOutputStream(), 1024000);
			    		output.write(user.getPhoto());
			    		request.setAttribute("USER", user);
			    		//RequestDispatcher dispatcher = request.getRequestDispatcher("/user/EditUserProfile.jsp");
			    		//dispatcher.forward(request, response);
			    		//getServletContext().getRequestDispatcher("/user/EditUserProfile.jsp").forward(request, response);
			    		//return;
			        } finally {
			            close(output);
			        }
			}

		}catch(Exception e){
			logger.info(className+methodName + "Exception", e);
		}

		logger.info(className + methodName + "leave");
	}
	
	private static void close(Closeable resource) {
        if (resource != null) {
            try {
                resource.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
