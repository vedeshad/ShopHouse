<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/adminlogin.css">
<title>Login</title>
</head>
<body>
	<div id="maindiv">
		<fieldset>
			<legend style="text-align: center;">
				<h1>Admin Login</h1>
			</legend>
			<form action="login" method="post">
				<table id="logintab">
					<tr>
						<th><label for="mail">Email Id : </label><br> <br></th>
						<th><input class="inputField" type="text" id="mail"
							name="email" placeholder="Enter e-mail ID"><br> <br></th>
					</tr>
					<tr>
						<th><label for="pass">Password : </label><br></th>
						<th><input class="inputField" type="password" name="password"
							id="pass" placeholder="Enter password"><br></th>
					</tr>
					<tr>
						<th colspan="2" id="showpass"><input type="checkbox"
							onclick="myFunction()">Show Password <br> <br></th>
					</tr>
				</table>
				<input id="loginbtn" type="submit" value="Login"  >
			</form>

			<div id="h2head">
				<p id="or">or</p>
				<p>Don't have an account ?</p>
				<a href="signup.jsp">Signup</a>
				<button onclick="goBack()">Go Back</button>
			</div>
		</fieldset>
	</div>
	<%
	String msg = (String) request.getAttribute("msg");
	%>
	<p><%=msg %></p>
	<% 
	if (msg != null) 
	{	
		
	%>
	
	<h1 id="h11" style="visibility: hidden;"><%=msg%></h1>
	<script>
		
			var msg = document.getElementById("h11").value;
			if (msg == null)
			{
				
				alert("Invalid Credentials");
				event.stopPropagation();
				
			}
		
	</script>
	<%
	
	}
	
	%>

	
	<script>
		function goBack() {
			window.history.back();
		}
	</script>
	<script>
		function myFunction() {
			var x = document.getElementById("pass");
			if (x.type === "password") {
				x.type = "text";
			}

			else {
				x.type = "password";
			}
		}
	</script>
</body>
</html>