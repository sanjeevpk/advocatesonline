<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Registration:</h1>
<form action="SaveNewRegistration" method="post">
<table>
	<tr>
		<td>
			First Name
		</td>
		<td>
			<input type="text" name="fNameTextField">
		</td>
	</tr>
	<tr>
		<td>
			Last Name
		</td>
		<td>
			<input type="text" name="lNameTextField">
		</td>
	</tr>
	<tr>
		<td>
			Email:
		</td>
		<td>
			<input type="text" name="emailTextField">
		</td>
	</tr>
	<tr>
		<td>
		
		</td>
		<td>
			<input type="submit" value="Save">
		</td>
	</tr>
</table>
</form>
</body>
</html>