<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 30-May-2013 5:44:45 PM
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
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		
		<script type="text/javascript">
	
			
			function getXMLObject() //XML OBJECT
			{
				var xmlHttp = false;
				try {
					xmlHttp = new ActiveXObject("Msxml2.XMLHTTP") // For Old Microsoft Browsers
				} catch (e) {
					try {
						xmlHttp = new ActiveXObject("Microsoft.XMLHTTP") // For Microsoft IE 6.0+
					} catch (e2) {
						xmlHttp = false // No Browser accepts the XMLHTTP Object then false
					}
				}
				if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
					xmlHttp = new XMLHttpRequest(); //For Mozilla, Opera Browsers
				} else {
					alert("Bwroser not supported");
				}
				return xmlHttp; // Mandatory Statement returning the ajax object created
			}

			var xmlhttp = new getXMLObject();

			function ajaxFunction() {
				if (xmlhttp) {
					var oldPassword = document.getElementById("oldPasswordTextField");
					var newPassword = document.getElementById("newPasswordTextField");
					var reNewPassword = document.getElementById("confirmNewPasswordTextField");
					alert(oldPassword.value);
					
					if (oldPassword.value == '') {
						document.getElementById('error').innerHTML = "Please Enter old password";
						document.getElementById("oldPasswordTextField").focus();
						return false;
					} else if (newPassword.value.length == 0) {
						document.getElementById('error').innerHTML = "New password cannot be empty.";
						document.getElementById("newPasswordTextField").focus();
						return false;
					} else if (newPassword.value.length < 6) {
						document.getElementById('error').innerHTML = "New password must be minimum of six characters.";
						document.getElementById("newPasswordTextField").focus();
						return false;
					}

					if (reNewPassword.value == '') {
						document.getElementById('error').innerHTML = "Please Enter confirm password";
						document.getElementById("confirmNewPasswordTextField").focus();
						return false;
					}else if (reNewPassword.value.length < 6) {
						document.getElementById('error').innerHTML = "Confirm password must be minimum of six characters.";
						document.getElementById("confirmNewPasswordTextField").focus();
						return false;
					}

					if (reNewPassword.value != newPassword.value) {
						document.getElementById('error').innerHTML = "Passwords do not match.Please make sure that both passwords are same.";
						return false;
					}

					xmlhttp.open("POST", "../changeUserPassword", true);
					xmlhttp.onreadystatechange = handleServerResponse;
					xmlhttp.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
					var params = "oldPasswordTextField=" + oldPassword.value +
								 "&newPasswordTextField=" +newPassword.value +
								 "&confirmNewPasswordTextField="+reNewPassword.value;
					xmlhttp.send(params);
				}
			}

			function handleServerResponse() {
				if (xmlhttp.readyState == 4) {
					if (xmlhttp.status == 200) {
						document.getElementById("responseDiv").innerHTML = xmlhttp.responseText; //Update the HTML Form element
						document.getElementById("oldPasswordTextField").value = "";
						document.getElementById("oldPasswordTextField").focus();
						document.getElementById("newPasswordTextField").value = "";
						document.getElementById("confirmNewPasswordTextField").value = "";
						document.getElementById("error").innerHTML = "";
					} else {
						alert("Error during AJAX call. Please try again");
					}
				}
			}
		</script>
	</head>
	
	<body>
		<%@ include file = "UserMenuBar.jsp" %>
		<form action="../changeUserPassword" method = "post">
			<table>
					<tr>
						<td>
							Old Password:
						</td>
						<td>
							<input type="password" name="oldPasswordTextField" id="oldPasswordTextField">
						</td>
					</tr>
					<tr>
						<td>
							New Password:
						</td>
						<td>
							<input type="password" name="newPasswordTextField" id="newPasswordTextField">
						</td>
					</tr>
					<tr>
						<td>
							Confirm New Password:
						</td>
						<td>
							<input type="password" name="confirmNewPasswordTextField" id="confirmNewPasswordTextField">
						</td>
					</tr>
					<tr>
						<td>
						
						</td>
						<td>
							<input type = "button" value="Change Password" onclick="ajaxFunction()">
							<input type = "reset" value="Reset">
						</td>
					</tr>
					<tr>
						<td>
						<div id="responseDiv"> 
						</div>
						<div class="error" id="error" ></div>
						</td>
					</tr>
			</table>
		</form>
	</body>
</html>