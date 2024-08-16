<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="error.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<!-- BootStrap CSS Link -->
<title>Sign Up</title>
</head>
<body>
	<!-- navbar - normal -->
	<%@include file="navbar_normal.html"%>

	<!-- SignUp Form -->
	<main class="d-flex align-items-center  primary-background"
		style="height: 110vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header bold font-weight-bold primary-text-color"
							style="font-size: 30px">Create Account</div>
						<div class="card-body">
							<form action="SignUpServlet" method="post">

								<div class="form-group font-weight-bold primary-text-color">
									<label for="username">Name</label> <input type="text"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter your Name"
										name="username" required="required">
								</div>

								<div class="form-group font-weight-bold primary-text-color">
									<label for="useremail">Email</label> <input type="email"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter your Email"
										name="useremail" required="required">
								</div>

								<div class="form-group font-weight-bold primary-text-color">
									<label for="password">Password</label> <input type="password"
										class="form-control" id="exampleInputPassword1"
										placeholder="Enter your Password" name="password" required="required">
								</div>

								<div class="form-group">
									<label for="gender" class="font-weight-bold primary-text-color">Select
										Gender</label>
									<br>
									<input type="radio" id="gender" name="gender" value="male" required="required">Male
									<input type="radio" id="gender" name="gender" value="female" required="required">Female
									<input type="radio" id="gender" name="gender" value="others" required="required">Others
								</div>

								<div class="form-group">
									<textarea class="form-control" rows="2" cols="30" name="about"
										placeholder="Enter about Yourself"></textarea>
								</div>

								<div class="form-check pad-icon-bottom">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1" name="check" required="required"> <label class="form-check-label"
										for="check">Agree to the <a href="#">terms
											and conditions</a></label>
								</div>
								<button type="submit"
									class="container btn btn-success font-weight-bold">Create
									Account</button>
							</form>
							<div class="pad-icon-top d-flex justify-content-center">
								Already an User? <a href="login.jsp" class="pad-icon-left">Sign
									In</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
		integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
		crossorigin="anonymous"></script>
</body>
</html>