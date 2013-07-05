<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 28-Jun-2013 3:16:29 PM
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
<%@ page import="com.advocatesOnline.entity.User" %>
	<jsp:include page="AppUserHeader.jsp"></jsp:include>
		<br>
		<div class="mainDiv">
			<div class="title"> 
				View Profile
			</div>
			<form id="form" name="form" method="post" action="../userProfile?edit">
				<div class="row">
					<div class="lable">
						Name:
					</div>
					<div class="contentText">
						${requestScope.VIEW_USER_PROFILE.name }
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Email:
					</div>
					<div class="contentText">
						${requestScope.VIEW_USER_PROFILE.email }
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Gender:
					</div>
					<div class="contentText">
						${requestScope.VIEW_USER_PROFILE.gender }
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Date of Birth:
					</div>
					<div class="contentText">
						${requestScope.VIEW_USER_PROFILE.dateOfBirth }
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Mobile:
					</div>
					<div class="contentText">
						${requestScope.VIEW_USER_PROFILE.dateOfBirth }
					</div>
				</div>
				<div class="addressRow">
					<div class="lable">
						Address:
					</div>
					<div class="contentText"><table>
						<c:forEach items="${requestScope.VIEW_USER_PROFILE.address}" var="address">
						
							<tr>
								<td>
									<c:out value="${address.addressLine1 }"></c:out>		
								</td>
							</tr>
							<tr>
								<td>
									<c:out value="${address.addressLine2 }"></c:out>
								</td>
							</tr>
							<tr>
								<td>
									<c:out value="${address.city }"></c:out>
								</td>
							</tr>
							<tr>
								<td>
									<c:out value="${address.state }"></c:out>
								</td>
							</tr>
							<tr>
								<td>
									<c:out value="${address.country }"></c:out>
								</td>
							</tr>
							<tr>
								<td>
									<c:out value="${address.pincode }"></c:out>
								</td>
							</tr>
							<tr>
								<td>
								</td>
							</tr>
							<tr>
								<td>
								</td>
							</tr>
						</c:forEach></table>					
					</div>
				</div>
				
				<div class="buttonRow">
					<div class="button1">
						<button type="button" onclick="return ajaxFunction()">Edit Profile</button>
					</div>
				</div>
				<div class="spacer"></div>
				<br>
				<div>
					<div id="responseDiv" class="responsiveDiv"> </div>
					<div class="error" id="error"></div>
				</div>
			</form>
		</div>
	<jsp:include page="Footer.jsp"></jsp:include>