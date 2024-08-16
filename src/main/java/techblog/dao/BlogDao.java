package techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import techblog.entity.Categories;
import techblog.entity.Posts;

public class BlogDao {
	Connection connection;

	public BlogDao(Connection connection) {
		this.connection = connection;
	}

	public ArrayList<Categories> getCategories() throws SQLException {
		ArrayList<Categories> list = new ArrayList<Categories>();
		String query = "SELECT * FROM categories";
		Statement statement = connection.createStatement();
		ResultSet result = statement.executeQuery(query);

		while (result.next()) {
			int category_id = result.getInt("category_id");
			String category_name = result.getString("name");
			String category_description = result.getString("description");

			Categories category = new Categories(category_id, category_name, category_description);
			list.add(category);
		}
		return list;
	}

	public void savePost(Posts blog) throws SQLException {
		String query = "INSERT INTO posts(post_title, post_content, post_code, post_link, user_email, category_id) VALUES (?,?,?,?,?,?)";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, blog.getTitle());
		statement.setString(2, blog.getContent());
		statement.setString(3, blog.getCode());
		statement.setString(4, blog.getLinks());
		statement.setString(5, blog.getUser_email());
		statement.setInt(6, blog.getCatgory_id());

		statement.executeUpdate();
	}

	public ArrayList<Posts> getAllPosts() throws SQLException {
		ArrayList<Posts> list = new ArrayList<Posts>();
		String query = "SELECT * FROM posts";
		Statement statement = connection.createStatement();
		ResultSet result = statement.executeQuery(query);

		while (result.next()) {
			int post_id = result.getInt("post_id");
			String post_title = result.getString("post_title");
			String post_content = result.getString("post_content");
			String post_code = result.getString("post_code");
			String post_link = result.getString("post_link");
			Timestamp post_time = result.getTimestamp("post_time");
			String user_email = result.getString("user_email");
			int category_id = result.getInt("category_id");

			Posts blog = new Posts(post_id, post_title, post_content, post_code, post_link, post_time, category_id,
					user_email);
			list.add(blog);
		}
		return list;
	}

	public ArrayList<Posts> getPostsByCategory(int category_id) throws SQLException {
		ArrayList<Posts> list = new ArrayList<Posts>();
		String query = "SELECT * FROM posts WHERE category_id = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setInt(1, category_id);
		ResultSet result = statement.executeQuery();

		while (result.next()) {
			int post_id = result.getInt("post_id");
			String post_title = result.getString("post_title");
			String post_content = result.getString("post_content");
			String post_code = result.getString("post_code");
			String post_link = result.getString("post_link");
			Timestamp post_time = result.getTimestamp("post_time");
			String user_email = result.getString("user_email");

			Posts blog = new Posts(post_id, post_title, post_content, post_code, post_link, post_time, category_id,
					user_email);
			list.add(blog);
		}
		return list;
	}

	public int getIdByCategoryName(String category_name) throws SQLException {
		String query = "SELECT category_id FROM categories WHERE name = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, category_name);
		ResultSet result = statement.executeQuery();
		result.next();
		int id = result.getInt("category_id");
		return id;
	}

	public String getCategoryNameById(int category_id) throws SQLException {
		String query = "SELECT name FROM categories WHERE category_id = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setInt(1, category_id);
		ResultSet result = statement.executeQuery();
		result.next();
		String name = result.getString("name");
		return name;
	}
	
	public String getUserByEmail(String user_email) throws SQLException {
		String query = "SELECT name FROM users WHERE email = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, user_email);
		ResultSet result = statement.executeQuery();
		result.next();
		String name = result.getString("name");
		return name;
	}
}
