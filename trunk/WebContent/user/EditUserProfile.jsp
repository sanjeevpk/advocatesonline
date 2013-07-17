<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 06-Jul-2013 6:11:54 PM
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
		<div style="border:1px solid; height:300px; width:200px;margin-left:300px; float: left" >
			<div class="title"> 
				Edit User Profile
			</div>
				<%
					User user = (User)session.getAttribute("USER_DETAILS");
		 			if(user == null){
		 				System.out.println("Null");
		 				%>
		 				<div style="height:150px; width:150px; background-color: linen;">
							<img alt="Profile Picture" src="../resources/image/AdvocatesOnline1.png" height="150px" width="150px">	
						</div>
						<%
		 			}else{ 
		 				%>
		 				<div style="height:150px; width:150px; background-color: linen; margin-left: 22px;">
							<img alt="Profile Picture" src="../displayImage?id=<%=user.getId() %>" height="150px" width="150px">	
						</div>
						<%		
		 			}
		 			//String userId = String.valueOf(user.getId()) != null ? String.valueOf(user.getId()) : "0";
		 		%>
				
				<form method="post" action="uploadImage" enctype="multipart/form-data">
				<div style="margin-top: 5px; margin-left: 10px;">
					<input type="file" name="photo" id="photo" style="border:none">
				</div><br>
				<div align="center">
					<input type="submit" value="Upload">
				</div>
				
				</form>
		</div>
		<div class="mainDiv" style="float: left">
			<br>
			<form id="form" name="form" method="post" action="../userProfile?update">
				<div class="title"> 
					Edit Personal Details
				</div>
				<div class="row">
					<div class="lable">
						Name:
					</div>
					<div class="contentText">
						<input type="text" name="nameTextField" id="nameTextField" size=50 value="${sessionScope.USER_DETAILS.name }">
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Email:
					</div>
					<div class="contentText">
						<input class="readOnly" type="text" name="emailTextField" id="emailTextField" size=50 readonly="readonly" value ="${sessionScope.USER_DETAILS.email }">
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Gender:
					</div>
					<div class="contentText">
						<input type="text" name="genderTextField" id="genderTextField" size=50>
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Date of Birth:
					</div>
					<div class="contentText">
						<input type="text" name="dobTextField" id="dobTextField" size=50 contenteditable="false">
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Mobile No.:
					</div>
					<div class="contentText">
						<input type="text" name="mobileNoTextField" id="mobileNoTextField" size=25 contenteditable="false">
					</div>
				</div>
				<div class="title"> 
					Edit Address Details
				</div>
				<c:forEach items="${sessionScope.USER_DETAILS.address != null ? sessionScope.USER_DETAILS.address : '' }" var="address">
				<div class="row">
					<div class="lable">
						Address:
					</div>
					
					<div class="contentText">
						<input type="text" name="nameTextField" id="nameTextField" size=50 value="${address.addressLine1 != null ? address.addressLine1 : '' }">
					</div>
				</div>
				<div class="row">
					<div class="lable">
						
					</div>
					<div style="margin-left:155px" class="contentText">
						<input type="text" name="nameTextField" id="nameTextField" size=50 value="${address.addressLine2 }">
					</div>
				</div>
				<div class="row">
					<div class="lable">
						City:
					</div>
					<div class="contentText">
						<input type="text" name="nameTextField" id="nameTextField" size=50 value="${address.city }">
					</div>
				</div>
				<div class="row">
					<div class="lable">
						State:
					</div>
					<div class="contentText">
						<input type="text" name="nameTextField" id="nameTextField" size=50 value="${address.state }">
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Country:
					</div>
					<div class="contentText">
						<input type="text" name="nameTextField" id="nameTextField" size=50 value="${address.country }">
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Pincode:
					</div>
					<div class="contentText">
						<input type="text" name="nameTextField" id="nameTextField" size=25 value="${address.pincode }">
					</div>
				</div>
				</c:forEach>
				<div class="buttonRow">
					<div class="button1">
						<button type="button" onclick="return ajaxFunction()">Update Profile</button>
					</div>
					<div class="button2">
						<button type="reset" onclick="resetForm()">Reset</button>
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