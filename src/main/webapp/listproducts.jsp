<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="shophouse.dao.Dao"%>
<%@page import="shophouse.dto.Product"%>
<%@page import="shophouse.dto.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./css/main.css">
<title>List Products</title>
<style>
main {
	position: absolute;
	top: 15%;
	left: 23%;
	min-width: 700px;
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

table {
	font-family: 'Times New Roman', Times, serif;
	font-size: x-large;
	text-align: center;
	padding: 10px;
	border-collapse: collapse;
	border-radius: 30px;
	border-style: hidden;
	box-shadow: 0 0 0 2px #006E6E;
	border-spacing: 10px;
}

th, td {
	padding: 10px;
	border-spacing: 10px;
	border-collapse: collapse;
	border: 2px solid #006E6E;
}
</style>
</head>

<body>
	<%
	Admin admin = (Admin) request.getSession().getAttribute("admin");
	Dao dao = (Dao) request.getSession().getAttribute("dao");
	List<Product> products = dao.findAll();
	%>
	<nav>
		<span>Admin : <%=admin.getAdminName()%></span> <a class="btn" href="logout"><span>Log
				Out</span></a> <a class="btn" href="admindash.jsp"><span>DashBoard</span></a>
	</nav>

	<main>
		<fieldset>
			<legend>List of Products</legend>
			<table>
				<tr>
					<th>ID</th>
					<th>Brand</th>
					<th>Name</th>
					<th>Price</th>
					<th>Discount</th>
					<th>Image</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>

				<%
				for (Product p : products) {
				%>
				<tr>
					<td><%=p.getProductId()%></td>
					<td><%=p.getProductBrand()%></td>
					<td><%=p.getProductName()%></td>
					<td><%=p.getProductPrize()%></td>
					<td><%=p.getProductDiscount()%></td>
					<%
					String base64img = new String(Base64.getEncoder().encode(p.getProductImage()));
					%>
					<td><img src="data:image/jpeg;base64,<%=base64img%>"
						width="100px" height="100px" alt="product_image"></td>
					<td><a href=edit?id=<%=p.getProductId()%>>Edit</a></td>
					<td><a href=delete?id=<%=p.getProductId()%>>Delete</a></td>
				</tr>
				<%
				}
				%>
			</table>
		</fieldset>
	</main>

</body>
</html>