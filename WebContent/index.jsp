<!-- 
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.

 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * File             : index.jsp
 * Created On       : 16-May-2013 11:05:17 AM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 16-May-2013 11:05:17 AM      | Initial Version
 *
 -->

<!DOCTYPE html> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<meta name="keywords" content="attorney,find a lawyer,lawyers, attorneys,social network for advocates, advocates professional network, 
		social media for advocates, legal community, advocates community, advocate community, 
		advocate, legal consultants, lawyers association, bar council,lawyer,criminal lawyer,court,high court,session court,
		advocates online, online advocates, advocates in city, law, justice, law and order, kanoon,supreme court, judgment,
		local lawyer, local attorney, local law firm, personal injury lawyer, lawyer directory, law firm directory, immigration attorney, 
		personal injury attorney, immigration lawyer, attorneys, lawyers, immigration, mesothelioma, personal injury, divorce, family law, 
		real estate, bankruptcy, criminal law, child custody, general practice, labor and employment,  traffic violations, wills and probate, 
		general business, starting a business, corporate law, debit and credit, intellectual property, taxation, patents, 
		attorney client relationship, lexisnexis, martindale hubbell, reed elsevier">
		
	<meta name="description" content="AdvocatesOnline is a leading professional networking platform for legal practitioners 
		to meet, network and collaborate with global lawyers community.">
	
	<link rel="shortcut icon" type="image/x-icon" href="resources/image/AdvocatesOnlineFavicon.ico">
	
	<title>AdvocatesOnline-Leading professional networking platform for Advocates</title>
	
	<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
	
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
	
	</head>

	<body>
		<!-- <center><h2>Welcome to AdvocatesOnline</h2></center> -->
		
		<div id="outerDiv">
		<form class="form" method="POST" action="userLogin" name ="myForm" id="myForm">
			<input type="hidden" name = "userTypeHiddenField" id = "userTypeHiddenField" value = "USER">
			<div class="formtitle">Login to AdvocatesOnline</div> 
			
			<div class="input">
				<div class="inputtext">Email: </div>
				<div class="inputcontent">
					<input type="text" name="emailTextField" id="emailTextField" size="35"/>
				</div>
			</div>
			
			<div class="input">
				<div class="inputtext">Password: </div>
				<div class="inputcontent">
					<input type="password" name="passwordTextField" id="passwordTextField" size="35"/>
				</div>
			</div>
			
			<div class="buttons">
				<input class="orangebutton" type="reset" value="Reset"/>
				<input class="orangebutton" type="button" value="Login" onclick="return ajaxFunction()"/>
			</div>
			
			<div class="input">
				<div class="inputtext"></div>
				<div class="inputcontent">
					<a href = "<%=getServletContext().getContextPath()%>/user/RegisterUser.jsp">New Client? Click here to register for FREE!</a>
					<br><a href = "<%=getServletContext().getContextPath()%>/advocate/RegisterAdvocate.jsp">New Advocate? Click here to register for FREE!</a>
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