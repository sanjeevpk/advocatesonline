<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 16-Jun-2013 12:55:10 AM
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
				Your case has been saved and it will be posted to appropriate advocates. 
				You will get message in your inbox once as soon as advocates starts responding to your post.
				<br>Below are your case details:  
			</p>
			<br>
			<table border="1">
        		<tr>
		            <th width="200px">Case Id</th>
		            <th width="400px">Title</th>
		            <th width="400px">Category</th>
        		</tr>
        		<c:choose>
	            	<c:when test="${Case != null}">
	                	<tr>
	                		<td>${Case.id}</td>
			                <td>${Case.title}</td>
			                <td>${Case.category}</td>
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