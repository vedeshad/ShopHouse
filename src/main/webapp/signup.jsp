<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/adminsignup.css">
<title>Sign Up</title>
</head>
<body>
	<div id="maindiv">
		<fieldset>
			<legend style="text-align: center;">
				<h1>Admin SignUp</h1>
			</legend>
			<form action="signup" method="post">
				<table id="signuptab">

					<tr>
						<th><label for="mail">Email ID : </label><br>
						<br></th>
						<th><input class="inputField" type="email" name="email"
							id="mail" placeholder="email-id" required><br>
						<br></th>
					</tr>
					<tr>

						<th><label for="number">Number : </label> <br>
						<br></th>
						<th><input class="inputField" type="text" name="contact"
							id="number" placeholder="Phone number" required><br>
						<br></th>
					</tr>
					<tr>
						<th><label for="name">Name : </label><br>
						<br></th>
						<th><input class="inputField" type="text" id="name"
							name="name" placeholder="name" required><br>
						<br></th>
					</tr>
					<tr>
						<th><label for="password">Password : </label><br></th>
						<th><input class="inputField" type="password" name="password"
							id="password" placeholder="Password" required><br></th>
					</tr>
					<tr>
						<th colspan="2" id="showpass"><input type="checkbox"
							onclick="myFunction()">Show Password <br>
						<br></th>
					</tr>
				</table>
				<input id="signupbtn" type="submit" value="Sign Up">
			</form>
			<%
			String message = (String) request.getAttribute("message");
			%>
			<%
			if (message != null) {
			%>
			<p><%=message%></p>
			<%
			}
			%>

			<div id="h2head">
				<p id="or">or</p>
				<p>Already Have an account ?</p>
				<a href="login.jsp">Login</a>
			</div>



		</fieldset>
		<script>
			function myFunction() {
				var x = document.getElementById("password");
				if (x.type === "password") {
					x.type = "text";
				}

				else {
					x.type = "password";
				}
			}
		</script>
	</div>
</body>
</html>