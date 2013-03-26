<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="tableCSSURL" value="/resources/css/table.css" />
<link rel="stylesheet" type="text/css" href="${tableCSSURL}" media="screen" />
<c:url var="mainCSSURL" value="/resources/css/main.css" />
<link rel="stylesheet" type="text/css" href="${mainCSSURL}" media="screen" />
<c:url var="registerNewUser" value="/saveNewRegistration" />

<head>
<script type="text/javascript" src="resources/js/hint.js"></script>	

<script>
     function getSelectedOption(id){
    	var node = document.getElementById(id);
     	var ListValue = node.options[node.selectedIndex].value;
     	//alert(ListValue);
     	 if (ListValue == 'advocate'){
     		document.getElementById('membershipDetailsLabel').style.display = 'block';
     		document.getElementById('stateBarConcil').style.display = 'block';
     		document.getElementById('stateConcilBarLabel').style.display = 'block';
     		document.getElementById('barConcilNumberLabel').style.display = 'block';
     		document.getElementById('barConcilNumber').style.display = 'block';
     		document.getElementById('barEnrolledYearLabel').style.display = 'block';
     		document.getElementById('barEnrolledYear').style.display = 'block';
     	 }
     	 if(ListValue == 'client'){
     		document.getElementById('membershipDetailsLabel').style.display = 'none';
     		document.getElementById('stateBarConcil').style.display = 'none';
     		document.getElementById('stateConcilBarLabel').style.display = 'none';
     		document.getElementById('barConcilNumberLabel').style.display = 'none';
     		document.getElementById('barConcilNumber').style.display = 'none';
     		document.getElementById('barEnrolledYearLabel').style.display = 'none';
     		document.getElementById('barEnrolledYear').style.display = 'none';
     	 }
     }
     
function doThis(){
	document.getElementById('membershipDetailsLabel').style.display = 'none';
	document.getElementById('stateBarConcil').style.display = 'none';
	document.getElementById('stateConcilBarLabel').style.display = 'none';
	document.getElementById('barConcilNumberLabel').style.display = 'none';
	document.getElementById('barConcilNumber').style.display = 'none';
	document.getElementById('barEnrolledYearLabel').style.display = 'none';
	document.getElementById('barEnrolledYear').style.display = 'none';
}
</script>
</head>
<body onload="doThis();">

<jsp:include page="headerWiithoutLoginInfo.jsp"></jsp:include>
<div class="colmask leftmenu">
	<div class="colleft">
		<div class="col1">
			<!-- Column 1 start -->
			<h2>New User Registration</h2><br>
			<form action="${registerNewUser}">
			<!-- <input type="hidden" name="salutation" value="Mr."> -->
				<table class="tableDetailWithoutBorder">
					<tbody>
						<tr>
					   		<td class="leftTextTD" style="width:150px">
					   			User Type:
					   		</td>
					   		<td>
					   			<select id="userType" style="width: 120px" onchange="getSelectedOption('userType')">
					   				<option value="client">Client</option>
					   				<option value="advocate">Advocate</option>
					   			</select><a href="#" class="hintanchor" onMouseover="showhint('If you are a normal user then select client else if you are an advocate then select Advocate.', this, event, '150px')">?</a>
					   		</td>
					   	</tr>
					   	<tr>
					   		<td class="leftTextTD">
					   			First Name:
					   		</td>
					   		<td>
					   			<input type="text" name="firstName">
					   		</td>
					   	</tr>
					   	<tr>
					   		<td class="leftTextTD">
					   			Middle Name:
					   		</td>
					   		<td>
					   			<input type="text" name="middleName">
					   		</td>
					   	</tr>
					   	<tr>
					   		<td class="leftTextTD">
					   			Last Name:
					   		</td>
					   		<td>
					   			<input type="text" name="lastName">
					   		</td>
					   	</tr>
					   	<tr>
					   		<td class="leftTextTD">
					   			Email:
					   		</td>
					   		<td>
					   			<input type="text" name="email">
					   			<a href="#" class="hintanchor" onMouseover="showhint('You will be getting a verification email to this email Id. You need to confirm this email inorder to use AdvocatesOnline. <br>We will also be using this email address to communicate important AdvocatesOnline product updates, any planned system maintenance periods and critical status bulletins.', this, event, '150px')">?</a>
					   		</td>
					   	</tr>
					   	<tr>
					   		<td class="leftTextTD">
					   			Mobile:
					   		</td>
					   		<td>
					   			<input type="text" name="mobile">
					   		</td>
					   	</tr>
					   	<tr>
					   		<td class="leftTextTD">
					   			Address:
					   		</td>
					   		<td>
					   			<textarea rows="4" cols="25" name="address"></textarea>
					   		</td>
					   	</tr>
					   	<tr>
					   		<td class="leftTextTD">
					   			City:
					   		</td>
					   		<td>
					   			<input type="text" name="city">
					   		</td>
					   	</tr>
					   	<tr>
					   		<td class="leftTextTD">
					   			Pincode:
					   		</td>
					   		<td>
					   			<input type="text" name="pincode">
					   		</td>
					   	</tr>
					   	<tr>
					   		<td>
					   		<div id="membershipDetailsLabel">
					   			<span style="font-size:14px; font-weight:bold"></span><b>Membership Details</b>
					   			</div>
					   		</td>
					   		<td>
					   		</td>
					   	</tr>
					   	<tr>
					   		<td class="leftTextTD">
					   			<div id="stateConcilBarLabel">
					   				State Council Bar:
					   			</div>
					   		</td>
					   		<td>
					   			<input type="text" name="stateBarConcil" id="stateBarConcil">
					   		</td>
					   	</tr>
					   	<tr>
					   		<td class="leftTextTD">
					   			<div id="barConcilNumberLabel">
					   				State Council Bar Number:
					   			</div>
					   		</td>
					   		<td>
					   			<input type="text" name="barConcilNumber" id="barConcilNumber">
					   		</td>
					   	</tr>
					   	<tr>
					   		<td class="leftTextTD">
					   			<div id="barEnrolledYearLabel">
					   				Bar Enrolled Year:
					   			</div>
					   		</td>
					   		<td>
					   			<input type="text" name="barEnrolledYear" id="barEnrolledYear">
					   		</td>
					   	</tr>
					   	<tr>
					   		<td>&nbsp;
					   		</td>
					   		<td>
					   			<input type="submit" name="submit" value="Register" class="button">
					   			<input type="reset" name="reset" value="Reset" class="button">
					   		</td>
					   	</tr>
					</tbody>
				</table>
			</form>
			<!-- Column 1 end -->
		</div>
		 <jsp:include page="leftPanelWithoutLoginInfo.jsp"></jsp:include>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
