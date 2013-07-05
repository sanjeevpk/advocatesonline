<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 19-Jun-2013 4:14:16 PM
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 15-May-2013 8:46:11 PM      | Initial Version
 * 
 *
-->

<jsp:include page="AppUserHeader.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.advocatesOnline.entity.Case" %>

	<script type="text/javascript">
		function checkDelete(id){
			//alert(id);
			var check = confirm("Are you sure you want to delete the case?");
			if(check){
				if(xmlhttp){
					//document.deleteCaseForm.submit();
					
					xmlhttp.open("POST","../viewCases",true);
					var e = window.event;
					xmlhttp.onreadystatechange  = function(e){
						
						if (xmlhttp.readyState == 4) {
							   //alert("Status-->> "+xmlhttp.status);
						     if(xmlhttp.status == 200) {
						    	 //alert("writing result"+xmlhttp.responseText);
						    	 document.getElementById("responseDiv").innerHTML = xmlhttp.responseText; //Update the HTML Form element
						    	 document.getElementById("error").innerHTML = "";
						    	 
						    	 //alert("response==>"+xmlhttp.responseText);
						    	 var res = "Case has been deleted";
						    	 if(xmlhttp.responseText.trim() == res.trim()){
						    		 //alert("deleted!"+id);
						    		 var rowToDelete = document.getElementById(id);
						    		 rowToDelete.parentNode.deleteRow(rowToDelete.rowIndex);
						    		 //alert("Done!");
						    	 }
						    	 else{
						    		 document.getElementById("responseDiv").innerHTML = "Case has not been deleted. Please try later.";
						    	 }
						     }
						     else {
						        alert("Error during AJAX call. Please try again");
						     }
						   }
					};
					xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
					var params = "deleteCase="+id;
					//alert(params);
					xmlhttp.send(params);	
					return true;	
				}
				
			}else{
				return false;
			}
		}
		
	</script>

	
		<br>
		<div class="mainDiv1000">
			<div class="title"> 
				View All Cases
			</div>
			<br>
			<form name="deleteCaseForm" method="post" action="../viewCases">
			<div id="responseDiv" class="responsiveDiv"></div>
			<div id="error" class="error"></div>
			
			<table border="1">
        		<tr>
		            <th width="200px">Case ID</th>
		            <th width="600px">Case Title</th>
		            <th width="400px">Category</th>
		            <th>Delete</th>
        		</tr>
        		<c:choose>
	            	<c:when test="${caseList != null}">
        				<c:forEach items="${caseList}" var="row">
        				<c:url var="deleteUrl" value= "../viewCases?deleteCase=${row.id}" />
        		<tr id ="${row.id}">
        			<td>
        				<a  href="../viewCases?editCase=${row.id } "><c:out value="${row.id}"/>
        				<c:set var="caseId" value="${row.id }"/>
        				</a>
        			</td>
        			<td>
        				<c:out value="${row.title}" />
        			</td>
        			<td>
        				<c:out value="${row.category}" />
        			</td>
        			<td style="text-align:center">
        				<%-- <input onclick="return checkDelete(${row.id})" type="button" value="Delete"> --%><!-- Delete</button> -->
        				<a onclick="return checkDelete(${row.id})" href="#"><img src="../resources/image/Erase.png" alt="X" height="16px" width="16px"></a>
        			</td>
        		</tr>
        		</c:forEach>
        		</c:when>
	                <c:otherwise>
	                     <tr><td colspan="4" style="text-align:center">No results found</td></tr>
	                </c:otherwise>
	            </c:choose>
	        </table>
	        </form>
	        <br>
		</div>
	<jsp:include page="Footer.jsp"></jsp:include>