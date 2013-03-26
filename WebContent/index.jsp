<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>*******Online</title>
</head>
<body>

<form action="RegisterNewUser" method="post">
<input type="submit" value="Register">
</form>
<form action="profileView" method = "post">
<input type="submit" value="Profile">
</form>

<form action="login" method = "post">
	<input type="text" name="emailTextField">
	<input type="password" name="passwordTextField">
	<input type="submit" value="Login">
	<input type="reset" value="Reset">
</form>
	
<form action="testSave">
	<input type="text" name="userNameTextField">
	<input type="submit" value="Save">
</form>
</body>
</html>