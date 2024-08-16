package techblog.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	private static Connection connection;
	private static String url = "jdbc:mysql://localhost:3306/techblog";
	private static String username = "root";
	private static String password = "sanket@sql";
	
	public static Connection getConnection() {
		try {
			if(connection == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(url,username,password);
			}
		} 
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
}
