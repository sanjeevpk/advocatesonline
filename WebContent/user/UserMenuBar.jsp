<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.

 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * File             : UserMenuBar.jsp
 * Created On       : 16-May-2013 11:05:17 AM
 *
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		 | Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 16-May-2013 11:05:17 AM      | Initial Version
 *
 *
 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="../resources/css/ddsmoothmenu.css" />
		
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
		<script type="text/javascript" src="../resources/js/jquery-1.8.2.js"></script>
		<script type="text/javascript" src="../resources/js/ddsmoothmenu.js">
		
		/***********************************************
		* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
		* This notice MUST stay intact for legal use
		* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
		***********************************************/
		
		</script>
	
		<script type="text/javascript">
		
			ddsmoothmenu.init({
				mainmenuid: "smoothmenu1", //menu DIV id
				orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
				classname: 'ddsmoothmenu', //class added to menu's outer DIV
				//customtheme: ["#1c5a80", "#18374a"],
				contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
			})
			
			ddsmoothmenu.init({
				mainmenuid: "smoothmenu2", //Menu DIV id
				orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
				classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
				method: 'toggle', // set to 'hover' (default) or 'toggle'
				arrowswap: true, // enable rollover effect on menu arrow images?
				//customtheme: ["#804000", "#482400"],
				contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
			})
		</script>
	</head>
	
	<body>
		<div id="smoothmenu1" class="ddsmoothmenu">
		<ul>
			<li><a href="http://www.dynamicdrive.com">Home</a></li>
			<li><a href="http://www.dynamicdrive.com">Cases</a>
			  	<ul>
				  <li><a href="NewCase.jsp">New Case</a></li>
				  <li><a href="<%=request.getContextPath()%>/viewCases">View cases</a></li>
				  <li><a href="http://www.dynamicdrive.com">Delete Case</a></li>
			 	</ul>
			</li>
			<li><a href="http://www.dynamicdrive.com">Messages</a>
			  	<ul>
				  <li><a href="http://www.dynamicdrive.com">Inbox</a></li>
				  <li><a href="http://www.dynamicdrive.com">Sent Items</a></li>
				  <li><a href="http://www.dynamicdrive.com">Drafts</a></li>
				  <li><a href="http://www.dynamicdrive.com">Archived</a></li>
			 	</ul>
			</li>
			<li><a href="http://www.dynamicdrive.com">Profile</a>
			  <ul>
				  <li><a href="http://www.dynamicdrive.com">Edit Profile</a></li>
				  <li><a href="http://www.dynamicdrive.com">View Profile</a></li>
				  <li><a href="ChangeUserPassword.jsp">Change Password</a></li>
				  <li><a href="http://www.dynamicdrive.com">Preference</a></li>
			  </ul>
			</li>
			<li><a href="http://www.dynamicdrive.com">Logout</a></li>
		</ul>
		<br style="clear: left" />
		</div>
	</body>
</html>