<%@ page import="java.util.ArrayList"%>
<%@ page import="techblog.entity.User"%>
<%@ page import="techblog.entity.Categories"%>
<%@ page import="techblog.helper.ConnectionProvider"%>
<%@ page import="techblog.dao.*"%>
<%@ page import="techblog.entity.Posts"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Font Awesome CSS Link-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<!-- BootStrap CSS Link -->
<title>Blogs Page</title>
</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<c:set var="session" value="${user}"></c:set>
	<c:choose>
		<c:when test="${session == null}"><%@include
				file="navbar_normal.html"%></c:when>
		<c:otherwise><%@include file="navbar_session.jsp"%></c:otherwise>
	</c:choose>

	<!-- Modal View Button -->

	<div class="mar container-md">
		<button type="button"
			class="btn btn-primary btn-lg btn-block primary-background"
			data-toggle="modal" data-target="#addblog">Add Blogs<span class="fa fa-plus-square pad-icon-left"></span></button>
	</div>

	<!-- Blog Post Modal -->

	<div class="modal fade" id="addblog" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Post
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AddBlogServlet" method="post" id="add-post-form">
						<div class="form-group">
							<select class="form-control" required="required" name="category">
								<option disabled="disabled" selected="selected">Select
									Blog Catagory</option>
								<%
								BlogDao blogdb = new BlogDao(ConnectionProvider.getConnection());
								ArrayList<Categories> list = blogdb.getCategories();
								for (Categories c : list) {
								%>
								<option value="<%=c.getId()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group">
							<input type="text" placeholder="Enter Blog Title"
								class="form-control" required="required" name="title" />
						</div>
						<div class="form-group">
							<textarea placeholder="Enter Content" class="form-control"
								style="height: 150px" name="content" required="required"></textarea>
						</div>
						<div class="form-group">
							<textarea placeholder="Enter Code (If required)"
								class="form-control" style="height: 150px" name="code"></textarea>
						</div>
						<div class="form-group">
							<textarea placeholder="Enter Links (If required)"
								class="form-control" style="height: 150px" name="links"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Discard</button>
							<button type="submit" class="btn btn-success">Post</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- Showing all Posts or Blogs -->

	<main>
		<div class="container">
			<div class="row mt-4">
				<!-- Column for catagories -->
				<div class="col-md-4">

					<ul class="list-group">
						<li class="list-group-item active primary-background" aria-current="true">All Categories</li>
						<%
						BlogDao blogs = new BlogDao(ConnectionProvider.getConnection());
						ArrayList<Categories> categories = blogs.getCategories();
						for (Categories category : categories) {
						%>
							<li class="list-group-item"><%= category.getName() %></li>
						<%
						}
						%>
					</ul>
				</div>
				<!--  Column for blogs -->
				<div class="col-md-8">
					<%@ include file="postloading.jsp"%>
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
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>