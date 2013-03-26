<!-- Header being added! -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>Share@Once</title>
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
		<meta name="description" content="Share@Once" />
		<meta name="keywords" content="Share@Once" />
		<meta name="robots" content="index," />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<c:url var="screenCSSURL" value="/resources/css/screen.css" />
		<link rel="stylesheet" type="text/css" href="${screenCSSURL}" media="screen" />
	</head>
	
	<body>
		<div id="header">
			<c:url var="logOutURL" value="/" />
			<div style="text-align:right">Welcome ${loggedInUserFullName} |&nbsp;<a href="${logOutURL}">Logout</a>&nbsp;&nbsp; </div>
			<h1>Share@Once</h1>
			<ul>
				<li><a href="http://matthewjamestaylor.com/blog/perfect-3-column.htm" class="active">Home</a></li>
				<li><a href="http://matthewjamestaylor.com/blog/perfect-3-column-blog-style.htm">About</a></li>
				<li><a href="http://matthewjamestaylor.com/blog/perfect-2-column-left-menu.htm" >Blog</a></li>
				<li><a href="http://matthewjamestaylor.com/blog/perfect-stacked-columns.htm">Contact</a></li>
			</ul>
			<p id="layoutdims">
				<strong> Users:</strong> 
				<a href="http://matthewjamestaylor.com/blog/ultimate-2-column-left-menu-pixels.htm">Add User</a> | 
				<a href="http://matthewjamestaylor.com/blog/ultimate-2-column-left-menu-ems.htm">Edit User</a> | 
				<a href="">Delete User</a> <!--<strong> Percentage widths</strong>-->
			</p>
		</div>

<!-- Header ends.. -->

