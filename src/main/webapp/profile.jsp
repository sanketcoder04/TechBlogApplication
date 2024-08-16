<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="techblog.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>Your Profile</title>
</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	//String profile = (String) request.getAttribute("profile");
	%>
	<c:set var="session" value="${user}"></c:set>
	<c:choose>
		<c:when test="${session == null}">
			<%
			response.sendRedirect("signup.jsp");
			%>
		</c:when>
		<c:otherwise>
			<%@include file="navbar_session.jsp"%>

			<!-- Profile View -->

			<div class="container mar-top bg-white border rounded-lg">
				<div class="row display-flex bg-light pad-icon-bottom pad-icon-top">
					<div class="col-md display-flex">
						<img alt="Profile pic" src="profiles/<%=user.getProfile()%>"
							class="img-fluid img-thumbnail rounded mx-auto d-block">
					</div>
					<div class="col-md ">
						<h4 class="primary-text-color">
							<b><%=user.getName()%></b>
						</h4>
						<h5>ABOUT :</h5>
						<p><%=user.getAbout()%></p>
					</div>
				</div>
				<div class="row display-flex bg-light pad-icon-bottom pad-icon-top">
					<div class="col-md">
						<button type="button"
							class="container btn btn-lg btn-primary primary-background"
							data-toggle="modal" data-target="#profile-modal"><span class="fa fa-gear pad-icon-right"></span>Edit
							Profile</button>
					</div>
					<div class="col-md">
						<button type="button" class="container btn btn-lg btn-danger"
							data-toggle="modal" data-target="#profile-modal"><span class="fa fa-trash pad-icon-right"></span>Delete
							Profile</button>
					</div>
				</div>
			</div>
			<hr>

			<!--Profile Modal -->
			<div class="modal fade" id="profile-modal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div id="profile-details">
								<table class="table table-hover">
									<thead class="thead-dark">
										<tr>
											<th scope="col">Your Info</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">Email</th>
											<td><%=user.getEmail()%></td>
										</tr>
										<tr>
											<th scope="row">Gender</th>
											<td><%=user.getGender().toUpperCase()%></td>
										</tr>
										<tr>
											<th scope="row">About</th>
											<td><%=user.getAbout()%></td>
										</tr>
										<tr>
											<th scope="row">Time</th>
											<td><%=user.getDatetime()%></td>
										</tr>
									</tbody>
								</table>
							</div>

							<!-- Profile Details Edit -->

							<div id="profile-edit" style="display: none;">
								<h4 class="mt-2">Please Edit Carefully...</h4>
								<form action="EditServlet" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label for="exampleInputPassword1">Name </label> <input
											type="text" class="form-control" id="exampleInputPassword1"
											name="name">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">Email </label> <input
											type="email" class="form-control" id="exampleInputEmail1"
											aria-describedby="emailHelp" name="email">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Password </label> <input
											type="password" class="form-control"
											id="exampleInputPassword1" name="password">
									</div>
									<div class="form-group">
										<label for="exampleFormControlTextarea1">About </label>
										<textarea class="form-control"
											id="exampleFormControlTextarea1" rows="3" name="about"></textarea>
									</div>
									<div class="form-group">
										<label for="exampleFormControlFile1">Profile Picture</label> <input
											type="file" class="form-control-file"
											id="exampleFormControlFile1" name="image">
									</div>
									<button type="submit" class="btn btn-success">Save
										Changes</button>
								</form>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button id="edit-profile-button" type="button"
								class="btn btn-primary">Edit</button>
							<form action="DeleteServlet" method="post">
								<input type="hidden" name="action">
								<button type="submit" class="btn btn-danger">Delete</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>


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
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>