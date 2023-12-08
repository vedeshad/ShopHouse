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
	position:absolute;
	top:55%;
	left:50%;
	transform: translate(-50%,-50%);
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
	padding-top:10px;
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
	margin-left: 75px;
	font-size: large;
	color: aliceblue;
	width: 375px;
	height: 29px;
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
	<nav>
		<span>Admin : <%=admin.getAdminName()%></span> <a class="btn" href="logout"><span>Log
				Out</span></a> <a class="btn" href="admindash.jsp"><span>DashBoard</span></a>


	</nav>

	<main>

		<form action="addproduct" enctype="multipart/form-data" method="post"
			style="display: block;">
			<fieldset>
				<legend>Add Product</legend>
				<div id="grid-container">
					<div class="label">
						<label for="id">Product ID</label>
					</div>
					<div class="input">
						<input type="number" id="id" name="product_id" required>
					</div>
					<div class="label">
						<label for="name">Product Name</label>
					</div>
					<div class="input">
						<input type="text" id="name" name="product_name" required>
					</div>
					<div class="label">
						<label for="brand">Product Brand</label>
					</div>
					<div class="input">
						<input type="text" id="brand" name="product_brand" required>
					</div>
					<div class="label">
						<label for="price">Product Price</label>
					</div>
					<div class="input">
						<input type="text" id="price" name="product_price" required>
					</div>
					<div class="label">
						<label for="discount">Product Discount</label>
					</div>
					<div class="input">
						<input type="text" id="discount" name="product_discount" required>
					</div>
					<div class="label">
						<label for="image">Product Image</label>
					</div>
					<div class="input">
						<input type="file" id="image" name="product_image" required>
					</div>
					<div >
						<input id="submit" type="submit">
					</div>
				</div>

			</fieldset>

		</form>



	</main>

</body>
</html>