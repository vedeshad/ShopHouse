<%@page import="shophouse.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/main.css">
<title>Admin Dash</title>
<style>
main {
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#grid-container {
	min-width: 500px;
	display: grid;
	background-color: #ffff;
	border-radius: 30px;
	grid-template-columns: auto;
	gap: 10px;
	padding: 30px;
	box-shadow: 10px 20px 40px #018c8c, -10px -20px 40px #018c8c;
}

#grid-container>div {
	background-color: #73f8f8;
	border-radius: 15px;
	border: 2px solid black;
	font-size: 30px;
	text-align: center;
	padding: 10px;
	
}
#grid-container>div>a
{text-decoration: none;
color: #000000;
}

.dropdown {
  display: inline-block;
 
}
.dropdown-content {
  display: none;
  position: absolute;
  width: 27%;
  overflow: auto;
  box-shadow: 0px 10px 10px 0px rgba(0,0,0,0.4);
}
.dropdown:hover .dropdown-content {

  display: block;
  background-color: #ffff;
}
.dropdown-content a {
  display: block;
  padding: 2px;
  text-decoration: none;
}
.dropdown-content a:hover {
  color: #FFFFFF;
  background-color: #00A4BD;
}
input {
	width: 100px;
	height: 20px;
	padding-left: 10px;
	font-size: 15px;
	border-radius: 10px;
	border: 2px solid #006E6E;
}
label
{
	font-size: 18px;
	font-weight:700;
}
#submit
{
color: aliceblue;
	background-color: #006E6E;
	border: 2px solid #000000;
}
#submit:hover
{
    background-color: #83D3D3;
    color: #000000;
}

</style>
</head>

<body>
	<%
	Admin admin = (Admin) request.getSession().getAttribute("admin");
	%>
	<h1 style="text-align: center;">Welcome To Shop House</h1>
	<nav>
		<span>Admin : <%=admin.getAdminName()%></span> <a class="btn"
			href="logout"><span>Log Out</span></a>
	</nav>
	<main>

		<div id="grid-container">
			<div class="container">
				<a href="admindetails.jsp">Admin Details</a>
			</div>
			<div class="container">
				<a href="addproduct.jsp">Add Product</a>
			</div>
			<div class="container">
				<div class="dropdown">
					<a>Edit Product</a>
					<div class="dropdown-content">
						<form action="edit">
							<label for="id">Enter Product ID</label><br>
							<input type="number" name="id" required><br>
							<input id="submit" type="submit"><br>
						</form>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="dropdown">
					<a>Delete Product</a>
					<div class="dropdown-content" style="width: 32%;">
						<form action="delete">
							<label for="id">Enter Product ID</label><br>
							<input type="number" name="id" required><br>
							<input id="submit" type="submit"><br>
						</form>
					</div>
				</div>
			</div>
			<div class="container">
				<a href="listproducts.jsp">List All Product</a>
			</div>
		</div>
	</main>
	
</body>

</html>