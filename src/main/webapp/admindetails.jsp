<%@page import="shophouse.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/main.css">
<title>Add Product</title>
<style>
main {
	position: absolute;
	top: 55%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 550px;
	padding: 10px;
	background-color: #ffff;
	border-radius: 30px;
	box-shadow: 10px 20px 40px #018c8c, -10px -20px 40px #018c8c;
}

fieldset {
	border-radius: 30px;
	border: 2px solid #006E6E;
}

legend {
	text-align: center;
	font-family: 'Times New Roman', Times, serif;
	font-size: x-large;
	font-weight: 700;
}

#grid-container {
	display: grid;
	grid-template-columns: 60px 60px;
	gap: 8px;
	grid-column-gap: 200px;
}

.input, .label {
	width: 250px;
	height: 40px;
	background-color: #73f8f8;
	padding-top: 10px;
	font-size: 25px;
	text-align: center;
	border-radius: 10px;
	border: 2px solid #006E6E;
}

input {
	width: 225px;
	height: 25px;
	padding-left: 10px;
	font-size: 15px;
	border-radius: 10px;
	border: 2px solid #006E6E;
}

#submit {
	margin-left: 15px; font-size : large;
	color: aliceblue;
	width: 225px;
	height: 29px;
	background-color: #006E6E;
	border: 2px solid #000000;
	font-size: large;
}

#submit:hover {
	background-color: #83D3D3;
	color: #000000;
}

#goback {
	margin-left: 15px;
	font-size: large;
	color: aliceblue;
	width: 225px;
	height: 29px;
	border-radius: 10px;
	background-color: #006E6E;
	border: 2px solid #000000;
	display: block;
	text-align: center;
}

#goback>span
{
	margin-top: 20px;
}

#goback:hover {
	background-color: #83D3D3;
	color: #000000;
}
</style>
</head>

<body>
	<%
	Admin admin = (Admin) request.getSession().getAttribute("admin");
	%>
	<nav>
		<span>Admin : <%=admin.getAdminName()%></span> <a class="btn"
			href="logout"><span>Log Out</span></a> <a class="btn"
			href="admindash.jsp"><span>DashBoard</span></a>


	</nav>

	<main>

		<form action="" enctype="multipart/form-data" method="post"
			style="display: block;">
			<fieldset>
				<legend>Admin Details</legend>
				<div id="grid-container">
					<div class="label">
						<label for="id">Admin ID</label>
					</div>
					<div class="input">
						<input type="number" id="id" name="product_id"
							value="<%=admin.getAdminId()%>" readonly>
					</div>
					<div class="label">
						<label for="name">Admin Name</label>
					</div>
					<div class="input">
						<input type="text" id="name" name="product_name"
							value="<%=admin.getAdminName()%>" required>
					</div>
					<div class="label">
						<label for="brand">Admin Password</label>
					</div>
					<div class="input">
						<input type="password" id="brand" name="product_brand"
							value="<%=admin.getAdminPassword()%>" required>
					</div>
					<div class="label">
						<label for="price">Admin Email </label>
					</div>
					<div class="input">
						<input type="email" id="price" name="product_price"
							value="<%=admin.getAdminEmail()%>" required>
					</div>
					<div class="label">
						<label for="price">Admin Contact </label>
					</div>
					<div class="input">
						<input type="number" id="price" name="product_price"
							value="<%=admin.getAdminContact()%>" required>
					</div>
					<div>
						<input id="submit" type="submit">
					</div>
					<div>
						<a id="goback" onclick="goBack()"><span>Go Back</span></a>
					</div>
				</div>

			</fieldset>

		</form>



	</main>
	<script>
		function goBack() 
		{
			window.history.back();
		}
	</script>
</body>
</html>