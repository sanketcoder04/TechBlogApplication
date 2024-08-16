<%@ page import="techblog.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<title>Home</title>
</head>
<body>
	<c:set var="session" value="${user}"></c:set>
	<c:choose>
		<c:when test="${session == null}"><%@include
				file="navbar_normal.html"%></c:when>
		<c:otherwise><%@include file="navbar_session.jsp"%></c:otherwise>
	</c:choose>

	<!-- Small Welcome div -->
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-text-color">
			<div class="container">
				<c:choose>
					<c:when test="${session == null}">
						<h3>Welcome Friends</h3>
					</c:when>
					<c:otherwise>
						<h3>
							Welcome
							<c:out value="${user.getName()}"></c:out>
						</h3>
					</c:otherwise>
				</c:choose>

				<h4>Get Your Blogging Journey Start with Tech Blog</h4>
				<p>Welcome to the World of Technical Blogs and get part into the
					world of technology</p>

				<c:if test="${session == null}">
					<a href="signup.jsp" class="btn btn-outline-primary">Get
						Started<span class="fa fa-arrow-right pad-icon-left"></span>
					</a>
					<a href="login.jsp" class="btn btn-outline-primary"><span
						class="fa fa-user pad-icon-right"></span>Login</a>
				</c:if>
			</div>
		</div>
	</div>
	
	<%@include file="aboutinfo.jsp" %>

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