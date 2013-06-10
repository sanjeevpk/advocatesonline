<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 28-May-2013 10:34:14 PM
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 15-May-2013 8:46:11 PM      | Initial Version
 * 
 *
-->


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
		
	<body>
		<form action="">
			<table>
				<tr>
					<td>
						Case Title:
					</td>
					<td>
						<%= request.getParameter("caseTitleTextField") != null ? request.getParameter("caseTitleTextField") : ""  %>	
					</td>
				</tr>
				<tr>
					<td>
						Detail case description:
					<td>
						<%= request.getParameter("caseDescriptionTextAreaField") != null ? request.getParameter("caseDescriptionTextAreaField") : ""  %>	
					</td>
				</tr>
				<tr>
					<td>
						Case category:
					</td>
					<td>
						<ul>
  							<c:forEach items="${paramValues['caseCategory']}" var="selectedValue">
    							<li><c:out value="${selectedValue}" /></li>
  							</c:forEach>
						</ul>
					</td>
				</tr>
				<tr>
					<td>
						Submitted as :
					</td>
					<td>
						<%= request.getParameter("userSubmitTypeRadioField") != null ? request.getParameter("userSubmitTypeRadioField") : ""  %>
					</td>
				</tr>	
				<tr>
					<td>
						Viewed By :
					</td>
					<td>
						<%= request.getParameter("userViewTypeRadioField") != null ? request.getParameter("userViewTypeRadioField") : ""  %>
					</td>
				</tr>	
			</table>	
		</form>
	</body>
</html>