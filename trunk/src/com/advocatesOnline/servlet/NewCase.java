package com.advocatesOnline.servlet;

import java.io.IOException;
import java.util.Date;

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
 * Servlet implementation class NewCase
 */
@WebServlet("/NewCase")
public class NewCase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(NewCase.class);
	private String className = NewCase.class.getName();
	CaseService caseService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewCase() {
        super();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
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
		response.setContentType("text/html"); 
		
    	try{
			String caseTitle = "";
			String caseCategory = "";
			String caseDescription = "";
			String caseSubmissionUserType = "";
			String caseViewedBy = "";
			
			HttpSession session = request.getSession();
			String userId = (String)session.getAttribute("USERID");
			
			caseTitle = request.getParameter("caseTitleTextField") != null ? request.getParameter("caseTitleTextField") : "";
					
			caseCategory = request.getParameter("caseCategory") != null ? request.getParameter("caseCategory") : ""; 
				
			caseDescription = request.getParameter("caseDescriptionTextAreaField") != null ? request.getParameter("caseDescriptionTextAreaField") : "";
			
			caseSubmissionUserType = request.getParameter("userSubmitTypeRadioField") != null ? request.getParameter("userSubmitTypeRadioField") : "";
			
			caseViewedBy = request.getParameter("userViewTypeRadioField") != null ? request.getParameter("userViewTypeRadioField") : "";
				 
			log("Log4j logging starting...");
			
			Case userCase = new Case();
			userCase.setTitle(caseTitle);
			userCase.setCategory(caseCategory);
			userCase.setDetailDescription(caseDescription);
			
			if(caseSubmissionUserType.equalsIgnoreCase("PARTICULAR_USER")){
				userCase.setSubmittedBy(userId != null ? userId : "" );
			}else{
				userCase.setSubmittedBy(caseSubmissionUserType);
			}
			
			if(!caseViewedBy.equalsIgnoreCase("ALL_USERS")){
				
				userCase.setViewedBy(userId != null ? userId : "" );
			}else{
				userCase.setViewedBy(caseViewedBy);
			}
			
			userCase.setCreatedBy(userId);
			userCase.setCreatedOn(new Date());
			userCase.setCreatedTime(new Date());
			
			logger.debug("Values from Case object..");
			logger.debug("Title -->> "+userCase.getTitle());
			
			RequestDispatcher dispatcher;
			
			Case caseResult = caseService.saveCase(userCase);
			if(caseResult != null){
				System.out.println("Case object saved!");
				dispatcher = request.getRequestDispatcher("/user/CaseSaved.jsp");
				dispatcher.forward(request,response);
			}else{
				dispatcher = request.getRequestDispatcher("/user/CaseNotSaved.jsp");
				dispatcher.forward(request,response);
			}
				
    	}catch(Exception e){
    		e.printStackTrace();
    		System.out.println(e.toString());
    		logger.debug(className + " doPost() ", e);
    	}
    	
    	logger.debug(className + " doPost() leave");
	}
}
