<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 28-May-2013 3:57:02 PM
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
		<link rel="stylesheet" type="text/css" href="../resources/css/main.css" />
		<script type="text/javascript" src="../resources/js/showhint.js"></script>
		
		<script type="text/javascript">
			function goToPreview(form){
				alert("Previewing...");
				document.passwordChangeForm.action = "PreviewCase.jsp";
				document.passwordChangeForm.submit();  
			}
		</script>
		
	</head>
	
	<body>
		<%@ include file = "UserMenuBar.jsp" %>
		<form name = "passwordChangeForm" action="../newCase" method ="post">
			<table>
				<tr>
					<td>
						Case Title:
					</td>
					<td>
						<input type="text" name = "caseTitleTextField" size=100>	
					</td>
				</tr>
				<tr>
					<td>
						Case Catagory:
					</td>
					<td>
						<select name="caseCategory" multiple size=10 style="width:300px;">
							<option value="Administrative law">Administrative law</option>
							<option value="Admiralty law or Maritime law">Admiralty law or Maritime law</option>
							<option value="Advertising law">Advertising law</option>
							<option value="Agency law">Agency law</option>
							<option value="Alcohol law">Alcohol law</option>
							<option value="Animal law">Animal law</option>
							<option value="Advertising law">Advertising law</option>
							<option value="Advertising law">Advertising law</option>
							<option value="Advertising law">Advertising law</option>
							<option value="Advertising law">Advertising law</option>
							<option value="Advertising law">Advertising law</option>
							<option value="Advertising law">Advertising law</option>
							
						</select>
					</td>
				</tr>
				<tr>
					<td>
						Detail case description:
					</td>
					<td>
						<textarea rows="10" cols="100" name = "caseDescriptionTextAreaField"></textarea>	
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<input type="radio" name="userSubmitTypeRadioField" id="userSubmitTypeRadioField" value="ANNONYMOUS_USER"/>Submit as annonymous user <br>
						<input type="radio" name="userSubmitTypeRadioField" id="userSubmitTypeRadioField" value="PARTICULAR_USER" checked="checked"/>Show my details to advocates 
							<a href="#" class="hintanchor" onMouseover="showhint('Your details like name, email, mobile, address will be displayed', this, event, '300px')">
								<img width="20" height="20" title="Hint" alt="Hint" align="top" src="../resources/image/help_icon.jpg">
							</a><br>	
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td>
						Viewed by:
					</td>
					<td>
						<input type="radio" name="userViewTypeRadioField" id="userViewTypeRadioField" value="ALL_USERS" checked="checked"/>Any user
						<a href="#" class="hintanchor" onMouseover="showhint('Your case details may be viewed by all users.', this, event, '300px')">
								<img width="20" height="20" title="Hint" alt="Hint" align="top" src="../resources/image/help_icon.jpg">
						</a><br>
						<input type="radio" name="userViewTypeRadioField" id="userViewTypeRadioField" value="ONLY_ME" />Only me 	
					</td>
				</tr>
				<tr>
					<td>
						
					</td>
					<td>
						<input type="submit" value="Preview Case" onclick = "goToPreview(this)">
						<input type="submit" value="Submit Case">		
						<input type="reset" value="Reset">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>