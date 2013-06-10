<!-- 
/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * File             : RegisterAdvocate.jsp
 * Created On       : 27-May-2013 10:48:17 AM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          			| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 27-May-2013 10:48:17 AM      	| Initial Version
 *</pre>
 */
 -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/main.css" />
		<script type="text/javascript" src="../resources/js/showhint.js"></script>
		
		<script type="text/javascript">
			function getXMLObject()  //XML OBJECT
			{
			   var xmlHttp = false;
			   try 
			   {
			     xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");  // For Old Microsoft Browsers
			   }
			   catch (e) {
			   		try {
			       		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");  // For Microsoft IE 6.0+
			   		}
			   		catch (e2) {
			       		xmlHttp = false;   // No Browser accepts the XMLHTTP Object then false
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
				  	var name = document.getElementById("nameTextField");
				  	var email = document.getElementById("emailTextField");
				  	var password = document.getElementById("passwordTextField");
				  	var rePassword = document.getElementById("rePasswordTextField");
				  	var gender = document.getElementById("genderRadioField");
				  	var userType = document.getElementById("userTypeHiddenField");
				  	var barCouncilNo = document.getElementById("barCouncilTextField");
				  	
				  	if(name.value == '')
				  	{
				  	document.getElementById('error').innerHTML="Please Enter Username";
				  	document.getElementById("nameTextField").focus();
				  	return false;
				  	}
				  	
				  	if(email.value == '')
				  	{
				  	document.getElementById('error').innerHTML="Please Enter Email";
				  	document.getElementById("emailTextField").focus();
				  	return false;
				  	}
				  	
				  	if(email.value.indexOf('@') == -1 || email.value.indexOf('.') == -1) {
				  		document.getElementById('error').innerHTML="Please Enter a valid Email";
					  	document.getElementById("emailTextField").focus();
						return false;
					} 
				  	
				  	if(password.value == '')
				  	{
				  	document.getElementById('error').innerHTML="Please Enter Password";
				  	document.getElementById("passwordTextField").focus();
				  	return false;
				  	}else if(password.value.length == 0){
				  		document.getElementById('error').innerHTML="Password cannot be empty.";
					  	document.getElementById("passwordTextField").focus();
					  	return false;
				  	}else if(password.value.length < 6){
				  		document.getElementById('error').innerHTML="Password must be minimum of six characters.";
					  	document.getElementById("passwordTextField").focus();
					  	return false;
				  	}
				  	
				  	if(rePassword.value == '')
				  	{
				  	document.getElementById('error').innerHTML="Please Enter Retype Password";
				  	document.getElementById("rePasswordTextField").focus();
				  	return false;
				  	}
				  	
				  	if(password.value != rePassword.value){
				  		document.getElementById('error').innerHTML="Passwords do not match.Please make sure that both passwords are same.";
					  	return false;
				  	}
				  	
				  	if(barCouncilNo.value == '')
				  	{
				  	document.getElementById('error').innerHTML="Please Enter Bar Council Number";
				  	document.getElementById("barCouncilNoTextField").focus();
				  	return false;
				  	}
				  	
				    xmlhttp.open("POST","../registerAdvocate",true); //getname will be the servlet name
				    xmlhttp.onreadystatechange  = handleServerResponse;
				    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				    var params = "nameTextField="+name.value+"&emailTextField="+email.value+"&userTypeHiddenField="+userType.value+"&genderRadioField="+gender.value+"&passwordTextField="+password.value+"&barCouncilTextField="+barCouncilNo.value;
				    //alert(params);
				    xmlhttp.send(params);//"nameTextField="+name.value+"&emailTextField="+email.value); //Posting txtname to Servlet
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
			    	 document.getElementById("barCouncilNoTextField").innerHTML = "";
			     }
			     else {
			        alert("Error during AJAX call. Please try again");
			     }
			   }
			}
		</script>
	</head>

	<body>
		<!-- <center><h2>Welcome to AdvocatesOnline</h2></center> -->
		<div id="outerDiv">
		<form class="form" method="POST" action="../registerAdvocate" name ="myForm" id="myForm">
			<input type="hidden" name = "userTypeHiddenField" id = "userTypeHiddenField" value = "ADVOCATE">
			<div class="formtitle">New User Registration</div> 
			<div class="input">
				<div class="inputtext">Name: </div>
				<div class="inputcontent">
					<input type="text" name="nameTextField" id="nameTextField" class="required" size="35"/>
				</div>
			</div>
			
			<div class="input">
				<div class="inputtext">Email: </div>
				<div class="inputcontent">
					<input type="text" name="emailTextField" id="emailTextField" size="35"/>
					<% 
					String hooverMsg = "Please provide a valid email. Because you will be getting a verification email to this email Id." +
			    			   " You need to confirm that email in order to use AdvocatesOnline.</p>" +
			    			   " We will also be using this email address to communicate important" +
			    			   " AdvocatesOnline product updates, any planned system maintenance periods" +
			    			   " and critical status bulletins. " +
			    			   " </br><b>We dont spam your mailbox nor we share your email.</b>";
					 %>
					<a href="#" class="hintanchor" onMouseover="showhint('<%=hooverMsg%>', this, event, '300px')">[?]</a>
				</div>
			</div>
			
			<div class="input">
				<div class="inputtext">Password: </div>
				<div class="inputcontent">
					<input type="password" name="passwordTextField" id="passwordTextField" size="35"/>
				</div>
			</div>
			
			<div class="input">
				<div class="inputtext">Retype Password: </div>
				<div class="inputcontent">
					<input type="password" name="rePasswordTextField" id="rePasswordTextField" size="35"/>
				</div>
			</div>
			
			<div class="input">
				<div class="inputtext">BAR Council ID: </div>
				<div class="inputcontent">
					<input type="text" name="barCouncilTextField" id="barCouncilTextField" size="35"/>
				</div>
			</div>
			
			<div class="input">
				<div class="inputtext">Gender: </div>
				<div class="inputcontent">
					<input type="radio" name="genderRadioField" id="genderRadioField" value="MALE" checked="checked"/>Male
					<input type="radio" name="genderRadioField" id="genderRadioField" value="FEMALE"/>Female
				</div>
			</div>
						
			<div class="buttons">
				<input class="orangebutton" type="reset" value="Reset" />
				<input class="orangebutton" type="button" value="Register" onclick="return ajaxFunction()"/>
			</div>
			
			<div class="input">
				<div class="inputtext"></div>
				<div class="inputcontent">
					<a href = "<%=getServletContext().getContextPath()%>/index.jsp">Already registered? Click here to login</a>
				</div>
			</div>
			
			<div class="input">
				<div id="responseDiv"> 
				</div>
				<div class="error" id="error" ></div>
			</div>			
		</form> 
		</div>
	</body>
</html>