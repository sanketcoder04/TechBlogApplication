package techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import techblog.entity.User;

public class UserDao {
	private Connection connection;

	public UserDao(Connection connection) {
		this.connection = connection;
	}

	// Insert User Data Method

	public void insertUserData(User user) throws SQLException {
		String query = "INSERT INTO users(name,email,password,gender,about) VALUES (?,?,?,?,?)";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, user.getName());
		statement.setString(2, user.getEmail());
		statement.setString(3, user.getPassword());
		statement.setString(4, user.getGender());
		statement.setString(5, user.getAbout());

		statement.executeUpdate();
	}

	// Get User Data Method

	public User getUserData(String email, String password) throws SQLException {
		User user = null;

		String query = "SELECT * FROM users WHERE email = ? AND password = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, email);
		statement.setString(2, password);

		ResultSet result = statement.executeQuery();
		if (result.next()) {
			user = new User();
			user.setName(result.getString("name"));
			user.setEmail(result.getString("email"));
			user.setPassword(result.getString("password"));
			user.setGender(result.getString("gender"));
			user.setAbout(result.getString("about"));
			user.setDatetime(result.getTimestamp("signupdate"));
			user.setProfile(result.getString("profile"));
		}
		return user;
	}
	
	public String getProfile(String email) throws SQLException {
		String query = "SELECT profile FROM users WHERE email = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, email);
		
		ResultSet result = statement.executeQuery();
		if(result.next()) {
			String profile = result.getString("profile");
			return profile;
		}
		return null;
	}
	
	public void updateUser(User user, String email) throws SQLException {
		String query = "UPDATE users SET name = ?, email = ?, password = ?, about = ?, profile = ? WHERE email = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, user.getName());
		statement.setString(2, user.getEmail());
		statement.setString(3, user.getPassword());
		statement.setString(4, user.getAbout());
		statement.setString(5, user.getProfile());
		statement.setString(6, email);
		
		statement.executeUpdate();
	}
	
	public void deleteUser(User user, String email) throws SQLException {
		String query = "DELETE FROM users WHERE email = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, email);
		
		statement.executeUpdate();
	}
}
