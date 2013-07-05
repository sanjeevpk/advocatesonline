<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 20-Jun-2013 10:43:11 PM
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 15-May-2013 8:46:11 PM      | Initial Version
 * 
 *
-->


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.advocatesOnline.entity.Case" %>

	<jsp:include page="AppUserHeader.jsp"></jsp:include>
		<br>
		<div class="mainDiv1000">
			<div class="title"> 
				View Cases
			</div>
			<p>
				Your case has been updated and the updated case will be available for appropriate advocates. 
				You will get message in your inbox as soon as advocates starts responding to your post.
				<br><br>Below are your case details:  
			</p>
			<%
				Case caseDetails = (Case)session.getAttribute("caseDetails");
		 		//out.println("Case details="+caseDetails);
			%>
			<br>
			<table border="1">
        		<tr>
		            <th width="200px">Case ID</th>
		            <th width="600px">Case Title</th>
		            <th width="400px">Category</th>
        		</tr>
        		<c:choose>
	            	<c:when test="${caseDetails != null}">
	                	<tr>
			                <td>${caseDetails.id}</td>
			                <td>${caseDetails.title}</td>
			                <td>${caseDetails.category}</td>
		            	</tr>
	                </c:when>
	                <c:otherwise>
	                     <tr><td colspan="3">No results found</td></tr>
	                </c:otherwise>
	            </c:choose>
	            <tr>
	            	<td colspan="3" style="text-align:center">
	            		<a href="../viewCases">View all cases</a>
	            	</td>
	            </tr>
	        </table>
		</div>
	<jsp:include page="Footer.jsp"></jsp:include>