<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 07-Jun-2013 11:22:13 PM
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.advocatesOnline.entity.User" %>

<!DOCTYPE html>

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
		
		<link rel="stylesheet" type="text/css" href="../resources/css/ddsmoothmenu.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/ddsmoothmenu.css" />
		<link rel="stylesheet" type="text/css" href="../resources/css/ddsmoothmenu-v.css" />
		<link rel="stylesheet" type="text/css" href="../resources/css/mainPageLayout.css" />
		<link rel="stylesheet" type="text/css" href="resources/css/mainPageLayout.css" />
		
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
		<script type="text/javascript" src="../resources/js/jquery-1.8.2.js"></script>
		<script type="text/javascript" src="resources/js/jquery-1.8.2.js"></script>
		<script type="text/javascript" src="../resources/js/ddsmoothmenu.js"></script>
		<script type="text/javascript" src="resources/js/ddsmoothmenu.js"></script>
		<script type="text/javascript" src="../resources/js/ajaxBasicScript.js"></script>
		<script type="text/javascript" src="resources/js/ajaxBasicScript.js"></script>
		<script type="text/javascript">
			
			ddsmoothmenu.init({
				mainmenuid: "smoothmenu1", //menu DIV id
				orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
				classname: 'ddsmoothmenu', //class added to menu's outer DIV
				//customtheme: ["#1c5a80", "#18374a"],
				contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
			});
			
			ddsmoothmenu.init({
				mainmenuid: "smoothmenu2", //Menu DIV id
				orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
				classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
				method: 'toggle', // set to 'hover' (default) or 'toggle'
				arrowswap: true, // enable rollover effect on menu arrow images?
				//customtheme: ["#804000", "#482400"],
				contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
			});

		</script>
	</head>
	
	<body>
		<div id="page">
			<div id="header"> 
				<div>
					<div class="topRightContent" align="right" >
						<a href=""><img src="../resources/image/facebook.png" height="20px" width="20px"></a>&nbsp; 
						<a href=""><img src="../resources/image/twitter.png" height="20px" width="20px"></a>&nbsp;  
						<a href=""><img src="../resources/image/linkedin.png" height="20px" width="20px"></a>&nbsp;
						<a href=""><img src="../resources/image/blogger.png" height="20px" width="20px"></a>&nbsp;
					</div>
					<!--<div class = "topRightContent" align="right">
						<img src="images/Hungup.png" height="20px" width="20px">9742708244
					</div></div>-->
					<div class="topLeftContent">
						<img src="../resources/image/AdvocatesOnline1.png" height="120px" width="120px">&nbsp;
					</div>
					<div class="topCenterContent">
						Welcome <b>${sessionScope.USER_DETAILS.name }. </b> 
						<c:if test="${ sessionScope.USER_DETAILS.lastLogonDate != null}">
							Your last login was on : 
							<fmt:setLocale value="en"/>
							<fmt:setLocale value="en_US"/>
							<c:set var="date" value="${sessionScope.USER_DETAILS.lastLogonDate }" />
							<c:set var="time" value="${sessionScope.USER_DETAILS.lastLogonTime }" />
							<fmt:formatDate type="date" value="${date}" />
							<fmt:formatDate type="time" value="${time}" />
						</c:if>
					</div>	
				</div>
				
			</div>
			
			<!--Menu Bar-->
			<div id="smoothmenu1" class="ddsmoothmenu">
				<ul>
					<li>
						<a href="<%=getServletContext().getContextPath() %>"><b>Home</b></a>
					</li>
					<li>
						<a href="ViewMessages.jsp"><b>Messages</b></a>
					  <ul>
						  <li>
						  	<a href="NewMessage.jsp">Create new message</a>
						  </li>
						  <li>
						  	<a href="ViewMessages.jsp">Inbox</a>
						  </li>
						  <li>
						  	<a href="ArchievedMessages.jsp">Archieved</a>
						  </li>
					  </ul>
					</li>
					<li>
						<a href="ViewCases.jsp"><b>Cases</b></a>
					  <ul>
						  <li>
						  	<a href="PostNewCase.jsp">Post new case</a>
						  </li>
						  <li>
						  	<a href="../viewCases">View cases</a>
						  </li>
						  <!-- <li>
						  	<a href="DeleteCase.jsp">Delete case</a>
						  </li> -->
					  </ul>
					</li>
					<li>
						<a href=""><b>Profile</b></a>
					  <ul>
						  <li>
						  	<a href="../userProfile?view">Edit profile</a>
						  </li>
						  <li>
						  	<a href="">View profile</a>
					  	</li>
					  </ul>
					</li>
					<li>
						<a href=""><b>Settings</b></a>
						<ul>
						  <li>
						  	<a href="">Preference</a>
						  </li>
						  <li>
						  	<a href="ChangeUserPassword.jsp">Change password</a>
					  	</li>
					  </ul>
					</li>
					<li>
						<a href="../logoutUser?logout"><b>Logout</b></a>
					</li>
				</ul>
				<br style="clear: left" />
			</div>
			<!--End of Menubar-->
