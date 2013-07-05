<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 11-Jun-2013 5:50:53 PM
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
			function goToPreview(form){
				//alert("Previewing...");
				var title = document.getElementById("caseTitleTextField");
				if(title.value == '')
			  	{
			  		document.getElementById('error').innerHTML="* Please enter case title";
			  		document.getElementById("caseTitleTextField").focus();
			  		return false;
			  	}
			
				document.form.action = "PreviewCase.jsp";
				document.form.submit();  
			}
			
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
				  	//alert(selectedCategory);
				  	
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
					
					
					/* if(category.value == '' || category.value == 'Select'){
						document.getElementById('error').innerHTML="* Please select case category";
				  		document.getElementById("caseTitleTextField").focus();
				  		return false;
					} */
					
					if(description.value == '')
				  	{
				  		document.getElementById('error').innerHTML="* Please enter case description";
				  		document.getElementById("caseDescriptionTextAreaField").focus();
				  		return false;
				  	}
					
					xmlhttp.open("POST","../newCase",true);
					xmlhttp.onreadystatechange  = handleServerResponse;
					xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
					var params = "title="+title.value+"&category="+selectedCategory+"&description="+description.value+"&submittedAs="+selectedSubmittedAs+"&caseViewedBy="+selectedCaseViewBy;
					//alert(params);
					xmlhttp.send(params);	
				}
			}
			
			function handleServerResponse() {
				   if (xmlhttp.readyState == 4) {
					   //alert(xmlhttp.status);
				     if(xmlhttp.status == 200) {
				    	 //alert("writing result"+xmlhttp.responseText);
				    	 document.getElementById("responseDiv").innerHTML = xmlhttp.responseText; //Update the HTML Form element
				    	 document.getElementById("caseTitleTextField").value = "";
				    	 document.getElementById("caseTitleTextField").focus();
				    	 document.getElementById("caseCategory").value = "Select";
				    	 document.getElementById("caseDescriptionTextAreaField").value = "";
				    	 document.getElementById("error").innerHTML = "";
				    	 
				    	 if(xmlhttp.responseText == "Saved"){
				    		 window.location='<%=getServletContext().getContextPath()%>/user/CaseSaved.jsp';
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
	
	<jsp:include page="AppUserHeader.jsp"></jsp:include>
		<br>
		<div class="mainDiv800">
			<div class="title"> 
				Post new case
			</div>
			<form id="form" name="form" method="post" action="../newCase">
				<input type="hidden" name = "userTypeHiddenField" id = "userTypeHiddenField" value = "USER">
				<div class="row">
					<div class="lable">
						Case Title:
					</div>
					<div class="contentText">
						<input type="text" name="caseTitleTextField" id="caseTitleTextField" size=75>
					</div>
				</div>
				
				<div class="row">
					<div class="lable">
						Case Category:
					</div>
					<div class="contentText">
						<div>
						<select id="caseCategory" name="caseCategory"  size=8 style="width:465px;">
							<option value="Select" selected>Select Category</option>
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
							
						</select></div>
					</div>
				</div>
				<br><br><br><br><br><br>
				
				<div class="row">
					<div class="lable">
						Detailed Case Description:
					</div>
					<div class="contentText">
						<textarea rows="10" cols="75" name = "caseDescriptionTextAreaField" id="caseDescriptionTextAreaField"></textarea>
					</div>
				</div>
				<br><br><br><br><br><br><br><br><br>
				
				<div class="row">
					<div class="lable">
						Submit case as :
					</div>
					<div class="contentRadio">
						<input type="radio" name="caseSubmissionTypeRadioField" value="AN0NYMOUS" checked="checked" >Anonymous
						<input type="radio" name="caseSubmissionTypeRadioField" value="USER">User
					</div>
				</div>
				
				<div class="row">
					<div class="lable">
						Case viewed by :
					</div>
					<div class="contentRadio">
						<input type="radio" name="caseViewingTypeRadioField" value="ALL_USERS" checked="checked" >All users
						<input type="radio" name="caseViewingTypeRadioField" value="ONLY_ME">Only me
					</div>
				</div> 
				
				<div class="buttonRow">
					<div style="float: left; margin-left:150px;">
						<button type="button" value="Preview" onclick="goToPreview(this)">Preview Case</button>
					</div>
					<div style="float: left">
						<button type="button" value="Post Case" onclick="return ajaxFunction()">Post Case</button>
					</div>
					<div class="button">
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
		</div><!--Main div-->
		
	<jsp:include page="Footer.jsp"></jsp:include>