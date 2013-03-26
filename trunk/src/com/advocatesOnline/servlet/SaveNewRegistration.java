/**
* Copyright 2012 Sanjeev Kulkarni
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/


package com.advocatesOnline.servlet;

/**
 * <pre>
 * -------------------------------------------------------------------------------------
 * Author............: Sanjeev Kulkarni
 * Creation Date.....: 25-Feb-2013
 * Project...........: AdvocatesOnline
 * Package...........: com.advocatesOnline.servlet
 * Filename..........: SaveNewRegistration.java
 * Description.......:					    
 * 
 * Revision History..:
 *
 * Date             Changed By              Version         Reason
 * ---------------------------------------------------------------------------------------
 * 25-Feb-2013     	Sanjeev Kulkarni		 	1.0				NewFile
 * ---------------------------------------------------------------------------------------
 * </pre>
 */

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.advocatesOnline.dto.UserDto;
import com.advocatesOnline.service.RegistrationService;

/**
 * Servlet implementation class SaveNewRegistration
 */
@WebServlet("/SaveNewRegistration")
public class SaveNewRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	RegistrationService rigistrationService;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDto userDto = new UserDto();
		
		//userDto = rigistrationService.saveNewRegistration(request,response);
		
		/*Map<?, ?> params = request.getParameterMap();
		Set<?> set = params.entrySet();
		Iterator<?> it = set.iterator();
		while (it.hasNext()) {
			Map.Entry<String, String[]> entry = (Entry<String, String[]>) it.next();
            String paramName = entry.getKey();
            System.out.println("Parameter Name-->>"+paramName);
            String[] paramValues = entry.getValue();
            if (paramValues.length == 1) {
                String paramValue = paramValues[0];
                if (paramValue.length() == 0)
                    System.out.println("<b>No Value</b>");
                else
                    System.out.println(paramValue);
            } else {
                System.out.println("<ul>");
                for (int i = 0; i < paramValues.length; i++) {
                    System.out.println("<li>" + paramValues[i] + "</li>");
                }
                System.out.println("</ul>");
            }
            System.out.print("</td></tr>");
        }
		
		if(userDto != null){
			request.setAttribute("userDto", userDto);
		}*/
		
		userDto.setFirstName(request.getParameter("fNameTextField"));
		userDto.setLastName(request.getParameter("lNameTextField"));
		userDto.setEmail(request.getParameter("emailTextField"));
		
		System.out.println("First Name -->>"+userDto.getFirstName());
		System.out.println("Last Name-->>"+userDto.getLastName());
		System.out.println("Email-->>"+userDto.getEmail());
		
		userDto = rigistrationService.saveNewRegistration(userDto);
		if(userDto != null){
			request.setAttribute("userDto", userDto);
		}
		
		ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/view/userAdded.jsp");
        dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
