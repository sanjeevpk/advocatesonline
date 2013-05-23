<!-- 
/**
 *<pre>
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * File             : RegisterUser.jsp
 * Created On       : 16-May-2013 11:05:17 AM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 16-May-2013 11:05:17 AM      | Initial Version
 *</pre>
 */
 -->
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
	
	<link rel="shortcut icon" type="image/x-icon" href="../resources/image/AdvocatesOnlineFavicon.ico">
	
	<title>AdvocatesOnline-Leading professional networking platform for Advocates</title>
	
	<link rel="stylesheet" type="text/css" href="../resources/css/main.css" />
	
	<!-- <script type="text/javascript" src="resources/js/ajax.js"></script> -->
	
	
	<!-- <style type="text/css">
		* { 
				font-family: Verdana; 
				font-size: 96%; 
			}
		
		label { 
				width: 10em; 
				float: left; 
		}
		
		label.error { 
			float: none; 
			color: red; 
			padding-left: .5em; 
			vertical-align: top; 
		}

		p { 
			clear: both; 
		}

		.submit { 
			margin-left: 12em; 
		}

		em { 
			font-weight: bold; 
			padding-right: 1em; 
			vertical-align: top; 
		}
		.error
		{
			font-family: Verdana; 
			font-size: 96%; 
			color : red;
			background-color: #FFDFDF;
		}
</style> -->
	
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
		  	var name = document.getElementById("nameTextField");
		  	var email = document.getElementById("emailTextField");
		  	var password = document.getElementById("passwordTextField");
		  	var rePassword = document.getElementById("rePasswordTextField");
		  	var gender = document.getElementById("genderRadioField");
		  	var userType = document.getElementById("userTypeHiddenField");
		  	
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
		  	
		    xmlhttp.open("POST","../registerUser",true); //getname will be the servlet name
		    xmlhttp.onreadystatechange  = handleServerResponse;
		    xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		    var params = "nameTextField="+name.value+"&emailTextField="+email.value+"&userTypeHiddenField="+userType.value+"&genderRadioField="+gender.value+"&passwordTextField="+password.value;
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
		     }
		     else {
		        alert("Error during AJAX call. Please try again");
		     }
		   }
		} 
	
		/* function makeRequest() {
		  var xmlHttpRequest = getXMLHttpRequest();
		  var name = document.getElementById("nameTextField");
		  var email = document.getElementById("emailTextField");
		  xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
		  xmlHttpRequest.open("POST", "registration", true);  
		  //xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		  xmlHttpRequest.send("name=" + name.value+"&email="+email.value);
		} */
		
		/* function loadXMLDoc()
		{
			var xmlhttp;
			if (window.XMLHttpRequest)
		  		{// code for IE7+, Firefox, Chrome, Opera, Safari
		  			xmlhttp=new XMLHttpRequest();
		  		}
			else
		  		{// code for IE6, IE5
		  			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  		}
			
			xmlhttp.onreadystatechange=function()
		  	{
		  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    		{
		  				alert("Updating");
		    			document.getElementById("hello").innerHTML=xmlhttp.responseText;
		    		}
		  	}
			xmlhttp.open("POST","registration",true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("nameTextField=Henry&emailTextField=Ford");
		} */
	</script>
	</head>
	<%-- getServletContext().getContextPath() --%>
	<body>
		<!-- <center><h2>Welcome to AdvocatesOnline</h2></center> -->
		<div id="outerDiv">
		<form class="form" method="POST" action="../registerUser" name ="myForm" id="myForm">
			<input type="hidden" name = "userTypeHiddenField" id = "userTypeHiddenField" value = "USER">
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
			
			
			<!-- <table>
				<tr>
					<td>
						Name:
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="nameTextField" id="nameTextField" class="required">
					</td>
				</tr>
				<tr>
					<td>
						Email:
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="emailTextField" id="emailTextField">
					</td>
				</tr>
				<tr>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="Register" onclick="return ajaxFunction()">
					</td>
				</tr>
			</table> -->
			
		</form> 
		</div>
	</body>
</html>