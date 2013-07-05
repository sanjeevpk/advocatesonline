package com.advocatesOnline.servlet;

import java.io.IOException;

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
 * Servlet implementation class UserLogout
 */
@WebServlet("/UserLogout")
public class UserLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(UserLogout.class);
	private String className = UserLogout.class.getName();
	UserService userService;
	
    @Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		WebApplicationContext factory = WebApplicationContextUtils.getRequiredWebApplicationContext(config.getServletContext());
		userService = factory.getBean(UserService.class); 
	}

	/**
     * @see HttpServlet#HttpServlet()
     */
    public UserLogout() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	/**
	 * @param request
	 * @param response
	 * As soon as user clicks on logout link  update the user table, make logged_in column set to false, 
	 * with this if we want to show the list of logged in users directly we can query like 
	 * select * from user where logged_in=true;
	 * Also update the last_logOnDate & last_logOnTime with the current values when the user clicked logout link.
	 */
	private void processRequest(HttpServletRequest request, HttpServletResponse response) {
		String methodName = " :: processRequest() ";
		logger.info(className + methodName + "enter");
		HttpSession session = request.getSession(false);
		
		try{
			if(request.getParameter("logout") != null){
				if(session != null){
					User user = (User)session.getAttribute("USER_DETAILS");
					if(user != null){
						userService.logoutUser(user);
						session.removeAttribute("USER_DETAIL");
						session.invalidate();
						response.getWriter().write("LoggedOut.");
						response.sendRedirect("/AdvocatesOnline/UserLogin.jsp");
						return;
					}
					
				}else{
					response.getWriter().write("NotLoggedOut.");
					response.sendRedirect("/user/UserLogin.jsp");
					return;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			logger.info(className + methodName + "Exception", e);
		}
		logger.info(className + methodName + "leave");
	}

}
