package com.advocatesOnline.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterNewUser
 */
public class RegisterNewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in doget() mamu...");
		//response.sendRedirect("view/registerNewUser.jsp");
		ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/view/registerNewUser.jsp");
        dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("helloooooooo in doPost mamu...");
		System.out.println(request);
		doGet(request, response);
	}

}
