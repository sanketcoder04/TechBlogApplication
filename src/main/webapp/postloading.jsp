<%@ page import="java.util.ArrayList"%>
<%@ page import="techblog.entity.Categories"%>
<%@ page import="techblog.entity.Posts"%>
<%@ page import="techblog.helper.ConnectionProvider"%>
<%@ page import="techblog.dao.BlogDao"%>

<div class="row">

<% 
	BlogDao blogdbs = new BlogDao(ConnectionProvider.getConnection());
	ArrayList<Posts> posts = blogdbs.getAllPosts(); 
	
	for(Posts post : posts) {
		String category = blogdbs.getCategoryNameById(post.getCatgory_id());
		String author = blogdbs.getUserByEmail(post.getUser_email());
%>
	<div class="col-md-12">
		<div class="card mar bg-light">
			<div class="card-body">
				<h4><%= post.getTitle() %></h4>
				<b>Author : </b><%= author %><hr>
				<p><%= post.getContent() %></p>
				<b><%= post.getCode() %></b>
				<a href="<%= post.getLinks() %>"><%= post.getLinks() %></a><hr>
				<p><%= post.getDate() %></p>
				<b>Category : </b><%= category %>
				
			</div>
		</div>
	</div>

<%
	}
%>
</div>