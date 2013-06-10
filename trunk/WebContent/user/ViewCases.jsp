<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 31-May-2013 11:10:56 AM
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
<%@ page import ="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/main.css" />
		<script type="text/javascript" src="../resources/js/showhint.js"></script>
	</head>
	
	<body>
		<%@ include file="UserMenuBar.jsp" %>
		Created on : 
  		<% 
  			String s ="";
  			Format formatter;	
  			 Date now = new Date();
  			 formatter = new SimpleDateFormat("dd.MM.yyyy.hh.mm.ss a");
  			 s = formatter.format(now);
  			out.println("Now is -->>"+s );
  		%>
  		<br>
		<c:forEach items="${caseList}" var="cases">
    		<b><c:out value="${cases.getTitle()}" /></b><br><br>
    		<p><c:out value="${cases.getDetailDescription()}" /></p>
    		<c:out value="${cases.getCategory()}" /><br>
    		<c:out value="${cases.getCreatedOn()}" /><c:out value="${cases.getCreatedTime()}" /><br>
    		<c:choose>
  				<c:when test="${cases.getViewedBy()  == 'ALL_USERS'}">
   					<small>* This case is viewed by All Users</small> 
  				</c:when>
  				<c:when test="${cases.getViewedBy()  != 'ALL_USERS'}">
   					<small>* This case is viewed by only you.</small>
  				</c:when>
			</c:choose>
    		
    		<br><br>
  		</c:forEach>
  		
	</body>
</html>