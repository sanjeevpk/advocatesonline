/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.servlet;

import java.io.IOException;
import java.util.List;

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

import com.advocatesOnline.entity.Case;
import com.advocatesOnline.service.CaseService;

/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Package          : com.advocatesOnline.servlet
 * File             : ViewCases.java
 * Created On       : 31-May-2013 11:14:37 AM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 31-May-2013 11:14:37 AM      | Initial Version
 *</pre>
 */

/**
 * Servlet implementation class ViewCases
 */
@WebServlet("/ViewCases")
public class ViewCases extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CaseService caseService;
	private static final Logger logger = Logger.getLogger(ViewCases.class);
	private String className = ViewCases.class.getName();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewCases() {
        super();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		WebApplicationContext factory = WebApplicationContextUtils.getWebApplicationContext(config.getServletContext());
		caseService = factory.getBean(CaseService.class);
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
		
		try{
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("USERID") != null ? (String)session.getAttribute("USERID") : "";
			if(!userId.equalsIgnoreCase("")){
				List<Case> caseList = caseService.getViewAllCases(userId);
				if(caseList != null && caseList.size() > 0){
					session.setAttribute("caseList", caseList);
					//RequestDispatcher dispatcher = request.getRequestDispatcher("/user/ViewCases.jsp");
					//dispatcher.forward(request, response);
					response.sendRedirect(request.getContextPath()+"/user/ViewCases.jsp");
				}else if(caseList.size() == 0){
					System.out.println("No results to display!");
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
			logger.debug(className +" Exception in doPost() ", e);
		}
		
		logger.debug(className + " doPost() leave");
	}

}
