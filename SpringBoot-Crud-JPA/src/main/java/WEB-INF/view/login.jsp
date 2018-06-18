<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="css/bootstrap.min.css">
<script
	src="js/jquery.min.js"></script>
<script
	src="js/bootstrap.min.js"></script>

<link href="css/style.css" rel="stylesheet">
</head>
<style>
.txtColor {
	font-size: 40px;
	color: white;
}

.card {
	max-width: 400px;
	padding: 25px 13px 15px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	margin-top: 20px;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.text-center {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	padding: 5px 23px 15px;
	text-align: center;
}

.login-cust {
	min-height: 38px;
	border-radius: 2px;
}
</style>
<script>
	function validateEmail() {

		var email = document.getElementById("email").value;
		if (email.length < 1) {
			alert("Please Enter email Id");
			return false;
		}
		return true;
	}
</script>
<body>
	<%@ include file="bulk_header.jsp"%>

	<div class="container card">

		<h2 class="text-center">Log in</h2>
		<div style="align: center">

			<form action="/login" method="POST">
				<div class="form-group">
					<input type="email" placeHolder="Please Enter Email Id"
						class="form-control login-cust " id="email" name="email">
				</div>


				<div class="form-group">
					<input type="submit" class="btn btn-primary btn-block login-cust"
						value='Log In' onclick="return validateEmail()">

				</div>
			</form>
		</div>
	</div>
	<div class="footer navbar-fixed-bottom">&copy; Piramal
		Enterprises Ltd.</div>

</body>
</html>