/**
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 */

package com.advocatesOnline.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

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
import com.advocatesOnline.entity.User;
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
 *<b> Sl No.  | Changed By                    | Date & Time          		 | Remarks                                                                     
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
		HttpSession session = request.getSession(false);
		
		if(request.getParameter("editCase") != null){
			String caseId = request.getParameter("editCase") != null ? request.getParameter("editCase") : ""; 
			Case caseDetails = caseService.getCase(caseId);
			if(caseDetails != null){
				session.setAttribute("caseDetails", caseDetails);
				response.sendRedirect(request.getContextPath()+"/user/EditCase.jsp");
				return;
			}
		}else if(request.getParameter("updateCase") != null){
			String caseId = request.getParameter("updateCase") != null ? request.getParameter("updateCase") : "0";
			response.setContentType("text/html"); 
			
	    	try{
				String caseTitle = "";
				String caseCategory = "";
				String caseDescription = "";
				String caseSubmissionUserType = "";
				String caseViewedBy = "";
				
				User user = (User)session.getAttribute("USER_DETAILS");
				
				caseTitle = request.getParameter("title") != null ? request.getParameter("title") : "";
						
				caseCategory = request.getParameter("category") != null ? request.getParameter("category") : ""; 
					
				caseDescription = request.getParameter("description") != null ? request.getParameter("description") : "";
				
				caseSubmissionUserType = request.getParameter("submittedAs") != null ? request.getParameter("submittedAs") : "";
				
				caseViewedBy = request.getParameter("caseViewedBy") != null ? request.getParameter("caseViewedBy") : "";
					 				
				Case userCase = new Case();
				userCase.setId(caseId !="" ? Integer.parseInt(caseId) : 0);
				userCase.setTitle(caseTitle);
				userCase.setCategory(caseCategory);
				userCase.setDetailDescription(caseDescription);
				
				if(caseSubmissionUserType.equalsIgnoreCase("PARTICULAR_USER")){
					userCase.setSubmittedBy(user != null ? String.valueOf(user.getId()) : "0" );
				}else{
					userCase.setSubmittedBy(caseSubmissionUserType);
				}
				
				userCase.setViewedBy(caseViewedBy);
				
				/*if(!caseViewedBy.equalsIgnoreCase("ALL_USERS")){
					
					userCase.setViewedBy(userId != null ? userId : "" );
				}else{
					userCase.setViewedBy(caseViewedBy);
				}*/
				
				userCase.setUpdatedBy(user != null ? String.valueOf(user.getId()) : "0");
				userCase.setUpdatedOn(new Date());
				userCase.setUpdatedTime(new Date());
				
				logger.debug("Values from Case object..");
				logger.debug("Title -->> "+userCase.getTitle());
				
				Case caseDetails = caseService.updateCase(userCase);
				if(caseDetails != null){
					session.setAttribute("caseDetails", caseDetails);
					System.out.println("Updated-->>"+caseDetails.getTitle());
					System.out.println(request.getAttribute("caseDetails"));
					response.getWriter().write("Updated");
					return;
				}else{
					response.getWriter().write("Case has not been updated. Please try later.");
					return;
				}
				
	    	}catch(Exception e){
	    		e.printStackTrace();
	    		System.out.println(e);
	    		logger.error(e.getMessage(), e);
	    	}
		}else if(request.getParameter("deleteCase") != null){
			response.setContentType("text/html");
			String caseId = request.getParameter("deleteCase") != null ? request.getParameter("deleteCase") : "0";
			
			try{
				int caseIdInt = caseId != "0" ? Integer.parseInt(caseId) : 0;
				boolean deleted = caseService.deleteCase(caseIdInt);
				if(deleted){
					response.getWriter().write("Case has been deleted");
					return;
				}else{
					response.getWriter().write("Case has not deleted. Please try later.");
					return;
				}
				
			}catch(Exception e){
				System.out.println(e.toString());
				e.printStackTrace();
			}
		}
		
		try{
			User userDetails = (User)session.getAttribute("USER_DETAILS");
			if(userDetails != null){
				List<Case> caseList = caseService.getViewAllCases(String.valueOf(userDetails.getId()));
				//if(caseList != null && caseList.size() > 0){
					session.setAttribute("caseList", caseList);
					//RequestDispatcher dispatcher = request.getRequestDispatcher("/user/ViewCases.jsp");
					//dispatcher.forward(request, response);
					response.sendRedirect(request.getContextPath()+"/user/ViewCases1.jsp");
				/*}else {
					System.out.println("No results to display!");
				}*/
			}
			
		}catch(Exception e){
			e.printStackTrace();
			logger.debug(className +" Exception in doPost() ", e);
		}
		logger.debug(className + " doPost() leave");
	}
}
