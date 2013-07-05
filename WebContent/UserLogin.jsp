<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 11-Jun-2013 3:57:36 PM
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
	
	<script type="text/javascript">
	
	function ajaxFunction() {
		if(xmlhttp) {
			var email = document.getElementById("emailTextField");
		  	var password = document.getElementById("passwordTextField");
		  	var userType = document.getElementById("userTypeHiddenField");
		  	
		  	if(email.value == '')
		  	{
		  	document.getElementById('error').innerHTML=" * Please Enter Email";
		  	document.getElementById("emailTextField").focus();
		  	return false;
		  	}
		  	
		  	if(email.value.indexOf('@') == -1 || email.value.indexOf('.') == -1) {
		  		document.getElementById('error').innerHTML=" * Please Enter a valid Email";
			  	document.getElementById("emailTextField").focus();
				return false;
			} 
		  	
		  	if(password.value == '')
		  	{
		  	document.getElementById('error').innerHTML=" * Please Enter Password";
		  	document.getElementById("passwordTextField").focus();
		  	return false;
		  	}else if(password.value.length == 0){
		  		document.getElementById('error').innerHTML="* Password cannot be empty.";
			  	document.getElementById("passwordTextField").focus();
			  	return false;
		  	}else if(password.value.length < 6){
		  		document.getElementById('error').innerHTML="* Password must be minimum of six characters.";
			  	document.getElementById("passwordTextField").focus();
			  	return false;
		  	}
		  			  	
		    xmlhttp.open("POST", "userLogin",true); //getname will be the servlet name
		    xmlhttp.onreadystatechange  = handleServerResponse;
		    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		    var params = "emailTextField="+email.value+"&userTypeHiddenField="+userType.value+"&passwordTextField="+password.value;
		    //alert(params);
		    xmlhttp.send(params);
		  }
		}
		 
		function handleServerResponse() {
		   if (xmlhttp.readyState == 4) {
			   //alert(xmlhttp.status);
		     if(xmlhttp.status == 200) {
		    	 
		    	 document.getElementById("responseDiv").innerHTML = xmlhttp.responseText; 
		    	 document.getElementById("emailTextField").value = "";
		    	 document.getElementById("emailTextField").focus();
		    	 document.getElementById("passwordTextField").value = "";
		    	 document.getElementById("error").innerHTML = "";
		    	 if(xmlhttp.responseText == "Success"){
		    		 window.location='<%=getServletContext().getContextPath()%>/user/MainPage.jsp';
		    	 }
		    	 else{
		    		 document.getElementById("responseDiv").innerHTML = "Incorrect username or password.";
		    	 }
		     }
		     else {
		        alert("Error during AJAX call. Please try again");
		     }
		   }
		}
		
		function resetForm(){
			document.getElementById("emailTextField").value = "";
	    	document.getElementById("emailTextField").focus();
	    	document.getElementById("passwordTextField").value = "";
	    	document.getElementById("error").innerHTML = "";
	    	document.getElementById("responseDiv").innerHTML = "";
		}
	</script>
	
	<jsp:include page="NoLoginHeader.jsp"></jsp:include>
		<br><%= (String) request.getAttribute("USER_SESSION_EXPIRED") != null ? (String)request.getAttribute("USER_SESSION_EXPIRED") : "" %>
		<div class="mainDiv">
			<div class="title"> 
				Login
			</div>
			<form id="form" name="form" method="post" action="userLogin">
				<input type="hidden" name = "userTypeHiddenField" id = "userTypeHiddenField" value = "USER">
				<div class="row">
					<div class="lable">
						Email:
					</div>
					<div class="contentText">
						<input type="text" size="40" name="emailTextField" id="emailTextField">
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Password:<span class="small">Min. size 6 chars</span>
					</div>
					<div class="contentText">
						<input type="password" size="40" name="passwordTextField" id="passwordTextField">
					</div>
				</div>
				<!-- <div class="row">
					<div class="lable">
						Post as :
					</div>
					<div class="contentRadio">
						<input type="radio" name="submissionType" value="Ananymous">Ananymous
						<input type="radio" name="submissionType" value="User">User
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Post viewed By :
					</div>
					<div class="contentRadio">
						<input type="radio" name="viewingType" value="Ananymous">Ananymous
						<input type="radio" name="viewingType" value="User">User
					</div>
				</div> -->
				
				<div class="buttonRow">
					<div class="button1">
						<button type="button" value="Login" onclick="return ajaxFunction()">Login</button>
					</div>
					<div class="button2">
						<button type="reset" onclick="resetForm()">Reset</button>
					</div>
				</div>
				
				<div class="row">
					<div class="smallHyperLink">
						<a href = "<%=getServletContext().getContextPath()%>/RegisterUser.jsp">New User? Click here to register for FREE!</a>
					</div>
				</div>
			
				<div class="spacer"></div>
				<br>
				<div>
					<div id="responseDiv" class="responsiveDiv"> </div>
					<div class="error" id="error"></div>
				</div>
			</form>
		</div><!--Main div-->
	<jsp:include page="Footer.jsp"></jsp:include>