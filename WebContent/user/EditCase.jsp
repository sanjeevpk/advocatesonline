<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 19-Jun-2013 6:00:29 PM
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 15-May-2013 8:46:11 PM      | Initial Version
 * 
 *
-->

	<script type="text/javascript">
		function resetForm(){
			document.getElementById("caseTitleTextField").value = "";
			document.getElementById("caseTitleTextField").focus();
			document.getElementById("caseCategory").value = "";
			document.getElementById("caseDescriptionTextAreaField").value = "";
			document.getElementById("error").innerHTML = "";
		}
		
		function ajaxFunction(){
			if(xmlhttp){
				
				var title = document.getElementById("caseTitleTextField");
				var category = document.getElementById("caseCategory");
				var selectedCategory = [];//category.options[category.selectedIndex].text;
			  	
			  	for (var i = 0; i < category.options.length; i++) {
			        if (category.options[i].selected) {
			        	selectedCategory.push((category.options[i].value));
			        	//alert(selectedCategory);
			        }
			    }
			  	selectedCategory = selectedCategory.join(", ");
			  	alert(selectedCategory);
			  	
				var description = document.getElementById("caseDescriptionTextAreaField");
				var submittedAs = document.getElementsByName("caseSubmissionTypeRadioField");
				var selectedSubmittedAs;
				for (var i = 0; i < submittedAs.length; i++) {       
			        if (submittedAs[i].checked) {
			        	selectedSubmittedAs = submittedAs[i].value;
			            //alert(selectedSubmittedAs);
			            break;
			        }
			    }
				
				var caseViewedBy = document.getElementsByName("caseViewingTypeRadioField");
				var selectedCaseViewBy;
				for (var i = 0; i < caseViewedBy.length; i++) {       
			        if (caseViewedBy[i].checked) {
			        	selectedCaseViewBy = caseViewedBy[i].value;
			            //alert(selectedCaseViewBy);
			            break;
			        }
			    }
								
				if(title.value == '')
			  	{
			  		document.getElementById('error').innerHTML="* Please enter case title";
			  		document.getElementById("caseTitleTextField").focus();
			  		return false;
			  	}
				
				if(description.value == '')
			  	{
			  		document.getElementById('error').innerHTML="* Please enter case description";
			  		document.getElementById("caseDescriptionTextAreaField").focus();
			  		return false;
			  	}
				var url = "../viewCases?updateCase="+ ${sessionScope.caseDetails.id };
				alert(url);
				xmlhttp.open("POST",url,true);
				xmlhttp.onreadystatechange  = handleServerResponse;
				xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				var params = "title="+title.value+"&category="+selectedCategory+"&description="+description.value+"&submittedAs="+selectedSubmittedAs+"&caseViewedBy="+selectedCaseViewBy;
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
			    	 document.getElementById("caseTitleTextField").value = "";
			    	 document.getElementById("caseTitleTextField").focus();
			    	 document.getElementById("caseCategory").value = "Select";
			    	 document.getElementById("caseDescriptionTextAreaField").value = "";
			    	 document.getElementById("error").innerHTML = "";
			    	 
			    	 if(xmlhttp.responseText == "Updated"){
			    		 window.location='<%=getServletContext().getContextPath()%>/user/CaseUpdated.jsp';
			    	 }
			    	 else{
			    		 document.getElementById("responseDiv").innerHTML = "Case has not been saved. Please try later.";
			    	 }
			     }
			     else {
			        alert("Error during AJAX call. Please try again");
			     }
			   }
			} 
		
	</script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.advocatesOnline.entity.Case" %>

	<jsp:include page="AppUserHeader.jsp"></jsp:include>
		<br>
		<div class="mainDiv800">
			<div class="title"> 
				Edit case
			</div>
			
			<form id="form" name="form" method="post" action="../newCase">
				<input type="hidden" name = "userTypeHiddenField" id = "userTypeHiddenField" value = "USER">
				<% Case caseDetails = (Case)session.getAttribute("caseDetails"); %>
				<div class="row">
					<div class="lable">
						Case Id:
					</div>
					<div class="contentText">
						<b><c:out value="${sessionScope.caseDetails.id }"></c:out></b>
					</div>
				</div>
				
				<div class="row">
					<div class="lable">
						Case Title:
					</div>
					<div class="contentText">
						<input type="text" name="caseTitleTextField" id="caseTitleTextField" size=75 value="${sessionScope.caseDetails.title }" >
					</div>
				</div>
				
				<div class="row">
					<div class="lable">
						Case Category:
					</div>
					<div class="contentText">
						<div>
							<select name="caseCategory" id="caseCategory" class="span3" size=8 style="width:465px;" >
		  						<c:forEach items="${sessionScope.caseDetails.category}" var="operationType">
		    						<option ${operation.type == operationType ? 'selected="selected"' : ''} value="<c:out value="${operationType}"/>" selected >
		      							<c:out value="${operationType}" />
		    						</option>
		    						<option value="Select">Select Category</option>
									<option value="Administrative law">Administrative law</option>
									<option value="Admiralty law or Maritime law">Admiralty law or Maritime law</option>
									<option value="Advertising law">Advertising law</option>
									<option value="Agency law">Agency law</option>
									<option value="Alcohol law">Alcohol law</option>
									<option value="Animal law">Animal law</option>
									<option value="Advertising law">Advertising law</option>
									
		  						</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<br><br><br><br><br><br>
				
				<div class="row">
					<div class="lable">
						Detailed Case Description:
					</div>
					<div class="contentText">
						<textarea rows="10" cols="75" name = "caseDescriptionTextAreaField" id="caseDescriptionTextAreaField" >${sessionScope.caseDetails.detailDescription }</textarea>
					</div>
				</div>
				<br><br><br><br><br><br><br><br><br>
				
				<div class="row">
					<div class="lable">
						Submit case as :
					</div>
					<div class="contentRadio">
						<%
						
						if(caseDetails.getSubmittedBy().equalsIgnoreCase("AN0NYMOUS")){%>
							<input type="radio" name="caseSubmissionTypeRadioField" value="AN0NYMOUS" checked/>Anonymous
							<input type="radio" name="caseSubmissionTypeRadioField" value="USER" />User
						<% 
						}else{%>
							<input type="radio" name="caseSubmissionTypeRadioField" value="AN0NYMOUS" />Anonymous
							<input type="radio" name="caseSubmissionTypeRadioField" value="USER" checked/>User
						<%}%>
		  				
						<%-- <input type="radio" name="caseSubmissionTypeRadioField" value="AN0NYMOUS" checked="<c:if test="${sessionScope.caseDetails.submittedBy eq 'AN0NYMOUS'}"> true </c:if>" >Anonymous
						<input type="radio" name="caseSubmissionTypeRadioField" value="USER" checked="<c:if test="${sessionScope.caseDetails.submittedBy eq 'USER'}">true</c:if>">User --%>
					</div>
				</div>
				
				<div class="row">
					<div class="lable">
						Case viewed by :
					</div>
					<div class="contentRadio">
						<%
						
						if(caseDetails.getViewedBy().equalsIgnoreCase("ALL_USERS")){%>
							<input type="radio" name="caseViewingTypeRadioField" value="ALL_USERS" checked/>All users
							<input type="radio" name="caseViewingTypeRadioField" value="ONLY_ME" />Only me
						<% 
						}else{%>
							<input type="radio" name="caseViewingTypeRadioField" value="ALL_USERS" />All users
							<input type="radio" name="caseViewingTypeRadioField" value="ONLY_ME" checked/>Only me
						<%}%>
					</div>
				</div> 
				
				<div class="buttonRow">
					<div style="float: left; margin-left:160px; ">
						<button type="button" value="Post Case" onclick="return ajaxFunction()">Update Case</button>
					</div>
					<div class="button">
						<button type="reset" onclick="resetForm()" >Reset</button>
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