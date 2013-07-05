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
	
	function getXMLObject()  //XML OBJECT
	{
	   var xmlHttp = false;
	   try {
	     xmlHttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
	   }
	   catch (e) {
	     try {
	       xmlHttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
	     }
	     catch (e2) {
	       xmlHttp = false   // No Browser accepts the XMLHTTP Object then false
	     }
	   }
	   if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
	     xmlHttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
	   }
	   else{
		   alert("Bwroser not supported");
	   }
	   return xmlHttp;  // Mandatory Statement returning the ajax object created
	} 	
	
	var xmlhttp = new getXMLObject();
	
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
		    xmlhttp.send(params);//"nameTextField="+name.value+"&emailTextField="+email.value); //Posting txtname to Servlet
		  }
		}
		 
		function handleServerResponse() {
		   if (xmlhttp.readyState == 4) {
			   //alert(xmlhttp.status);
		     if(xmlhttp.status == 200) {
		    	 //alert(request.getAttribute("responseMsg"));
		    	 //alert("writing result"+document.getElementById("responseMsg").value);
		    	 
		    	 document.getElementById("responseDiv").innerHTML = xmlhttp.responseText; //Update the HTML Form element
		    	 document.getElementById("emailTextField").value = "";
		    	 document.getElementById("emailTextField").focus();
		    	 document.getElementById("passwordTextField").value = "";
		    	 document.getElementById("error").innerHTML = "";
		    	 if(xmlhttp.responseText == "Success"){
		    		 window.location='<%=getServletContext().getContextPath()%>/user/UserMenuBar.jsp';
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
	</script>
	
	<jsp:include page="NoLoginHeader.jsp"></jsp:include>
		<div id="main">
			<div style="padding-left: 10px">
				<!-- <h2>AdvocatesOnline - Advocates Login</h2> -->
			</div>
			<div id="stylized" class="myCenterForm">
		
				<form id="form" name="form" method="post" action="userLogin">
					<input type="hidden" name = "userTypeHiddenField" id = "userTypeHiddenField" value = "USER">
 					<p>Login by entering your email and password</p>
 					
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
						<button type="button" value="Login" onclick="return ajaxFunction()">Login</button>
						<button type="reset" value="Reset">Reset</button>
					</div>
					
					<div class="spacer"></div>
					<br>
					
					<div align="center">
						<span class="signInRegisterSmallLink">
								<a href = "<%=getServletContext().getContextPath()%>/RegisterAdvocate.jsp">New Advocate? Click here to register for FREE!</a>
						</span>
					</div>
									
					<div class="spacer"></div>
					<div>
						<div id="responseDiv"> </div>
						<div class="error" id="error" ></div>
					</div>
					
				</form>
			</div>
		</div>
	<jsp:include page="Footer.jsp"></jsp:include>