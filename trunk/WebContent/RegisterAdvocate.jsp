<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 10-Jun-2013 10:57:37 PM
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
			  	var name = document.getElementById("nameTextField");
			  	var email = document.getElementById("emailTextField");
			  	var password = document.getElementById("passwordTextField");
			  	var rePassword = document.getElementById("rePasswordTextField");
			  	var gender = document.getElementsByName("genderRadioField");
			  	var selectedGender;
			  	for (var i = 0; i < gender.length; i++) {       
			        if (gender[i].checked) {
			            //alert(gender[i].value);
			            selectedGender = gender[i].value;
			            //alert(selectedGender);
			            break;
			        }
			    }
			  	var userType = document.getElementById("userTypeHiddenField");
			  	var barCouncilNo = document.getElementById("barCouncilTextField");
			  	
			  	if(name.value == '')
			  	{
				  	document.getElementById('error').innerHTML="* Please Enter Username";
				  	document.getElementById("nameTextField").focus();
				  	return false;
			  	}
			  	
			  	if(email.value == '')
			  	{
				  	document.getElementById('error').innerHTML="* Please Enter Email";
				  	document.getElementById("emailTextField").focus();
				  	return false;
			  	}
			  	
			  	if(email.value.indexOf('@') == -1 || email.value.indexOf('.') == -1) {
			  		document.getElementById('error').innerHTML="* Please Enter a valid Email";
				  	document.getElementById("emailTextField").focus();
					return false;
				} 
			  	
			  	if(password.value == '')
			  	{
				  	document.getElementById('error').innerHTML="* Please Enter Password";
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
			  	
			  	if(rePassword.value == '')
			  	{
				  	document.getElementById('error').innerHTML="* Please Enter Retype Password";
				  	document.getElementById("rePasswordTextField").focus();
				  	return false;
			  	}
			  	
			  	if(password.value != rePassword.value){
			  		document.getElementById('error').innerHTML="* Passwords do not match.Please make sure that both passwords are same.";
				  	return false;
			  	}
			  	
			  	if(barCouncilNo.value == '')
			  	{
				  	document.getElementById('error').innerHTML="* Please Enter Bar Council Number";
				  	document.getElementById("barCouncilNoTextField").focus();
				  	return false;
			  	}
			  	
			  	 xmlhttp.open("POST","registerAdvocate",true); //getname will be the servlet name
				 xmlhttp.onreadystatechange  = handleServerResponse;
				 xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				 var params = "nameTextField="+name.value+"&emailTextField="+email.value+"&userTypeHiddenField="+userType.value+"&genderRadioField="+selectedGender+"&passwordTextField="+password.value+"&barCouncilTextField="+barCouncilNo.value;
				 //alert(params);
				 xmlhttp.send(params);
			  }
			}
			 
			function handleServerResponse() {
			   if (xmlhttp.readyState == 4) {
				   alert(xmlhttp.status);
			     if(xmlhttp.status == 200) {
			    	 //alert("writing result"+xmlhttp.responseText);
			    	 document.getElementById("responseDiv").innerHTML = xmlhttp.responseText; //Update the HTML Form element
			    	 document.getElementById("nameTextField").value = "";
			    	 document.getElementById("nameTextField").focus();
			    	 document.getElementById("emailTextField").value = "";
			    	 document.getElementById("passwordTextField").value = "";
			    	 document.getElementById("rePasswordTextField").value = "";
			    	 document.getElementById("error").innerHTML = "";
			    	 document.getElementById("password").innerHTML = "";
			    	 document.getElementsByName("genderRadioField").value = "MALE";
			    	 document.getElementById("barCouncilNoTextField").innerHTML = "";
			     }
			     else {
			        alert("Error during AJAX call. Please try again");
			     }
			   }
			} 
	</script>

	<jsp:include page="NoLoginHeader.jsp"></jsp:include>
		<div id="main">
			<div style="padding-left: 10px">
				<!-- <h2>AdvocatesOnline - Advocate Registration</h2> -->
					<p>
						Advocates can register themselves by providing the below details. 
						Upon clicking Register button an email will be sent to the email Id provided while registration,
						you need to confirm your registration by clicking hyperlink or copy pasting the hyperlink provided
						in the confirmation email.
						
					</p>
			</div>
			<div id="stylized" class="myCenterForm">
		
				<form id="form" name="form" method="post" action="registerAdvocate">
					<input type="hidden" name = "userTypeHiddenField" id = "userTypeHiddenField" value = "ADVOCATE">
 					
 					<div>
						<label>Name
							<span class="small">Enter your full name</span>
						</label>
						<input type="text" name="nameTextField" id="nameTextField" size="30"/>
					</div>
					
					<div>
						<label>Email
							<span class="small">Enter your valid email address</span>
						</label>
						<input type="text" name="emailTextField" id="emailTextField" size="30" />
					</div>

					<div>
						<label>Password
							<span class="small">Min. size 6 chars</span>
						</label>
						<input type="password" name="passwordTextField" id="passwordTextField" size="30" />
					</div>
					
					<div>
						<label>Retype Password
							<span class="small">Reenter the same password</span>
						</label>
						<input type="password" name="rePasswordTextField" id="rePasswordTextField" size="30" />
					</div>
					
					<div>
						<label>BAR Council No.
							<span class="small">Enter the BAR Council No.</span>
						</label>
						<input type="text" name="barCouncilTextField" id="barCouncilTextField" size="30" />
					</div>
					
					<div>
						<label>Gender
							<span class="small">Select your gender</span>
						</label>
						<input type="radio" name="genderRadioField" id="genderRadioField" value="MALE" checked="checked" /><label>Male</label>
						<input type="radio" name="genderRadioField" id="genderRadioField" value="FEMALE"/><label>Female</label>
					</div>
					
					<div>
						<button type="button" value="Register" onclick="return ajaxFunction()">Register</button>
						<button type="reset" value="Reset">Reset</button>
					</div>
					
					<div class="spacer"></div>
					<br>
					<div align="center">
						<span class="signInRegisterSmallLink">
							<a href = "<%=getServletContext().getContextPath()%>/AdvocatesLogin.jsp">Already registered? Click here to login</a>
						</span>
					</div>
									
					<div class="spacer"></div>
					<br>
					<div>
						<div id="responseDiv"> </div>
						<div class="error" id="error" ></div>
					</div>

				</form>
			</div>
	
		</div>

	<jsp:include page="Footer.jsp"></jsp:include>