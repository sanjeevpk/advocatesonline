<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 27-Jun-2013 10:47:44 PM
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 15-May-2013 8:46:11 PM      | Initial Version
 * 
 *
-->


<%@page import="com.advocatesOnline.entity.Case" %>

<script>
	function resetForm(){
		document.getElementById("oldPasswordTextField").value = "";
		document.getElementById("oldPasswordTextField").focus();
		document.getElementById("newPasswordTextField").value = "";
		document.getElementById("confirmNewPasswordTextField").value = "";
		document.getElementById("responseDiv").innerHTML = "";
		document.getElementById("error").innerHTML = "";
	}
	
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


	<jsp:include page="AppUserHeader.jsp"></jsp:include>
		<br>
		<div class="mainDiv">
			<div class="title"> 
				Change Password
			</div>
			<form id="form" name="form" method="post" action="../changeUserPassword">
				<div class="row">
					<div class="lable">
						Current Password:
					</div>
					<div class="contentText">
						<input type="password" name="oldPasswordTextField" id="oldPasswordTextField" size=50>
					</div>
				</div>
				<div class="row">
					<div class="lable">
						New Password:
					</div>
					<div class="contentText">
						<input type="password" name="newPasswordTextField" id="newPasswordTextField" size=50>
					</div>
				</div>
				<div class="row">
					<div class="lable">
						Confirm New Password:
					</div>
					<div class="contentText">
						<input type="password" name="confirmNewPasswordTextField" id="confirmNewPasswordTextField" size=50>
					</div>
				</div>
				<div class="buttonRow">
					<div class="button1">
						<button type="button" onclick="return ajaxFunction()">Change Password</button>
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