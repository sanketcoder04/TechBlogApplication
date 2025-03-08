package techblog.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import techblog.dao.UserDao;
import techblog.entity.User;
import techblog.helper.ConnectionProvider;

@SuppressWarnings("serial")
public class EditServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//fetch all data to update
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String about = req.getParameter("about");
		
		// Session Data Fetching
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			resp.sendRedirect("login.jsp");
		}
		String oldEmail = user.getEmail();
		
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);
		
		// Update data into DataBase 
		
		UserDao userdb = new UserDao(ConnectionProvider.getConnection());
		try {
			userdb.updateUser(user, oldEmail);
			
			session.setAttribute("user", user);
			resp.sendRedirect("profile.jsp");
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
	}
}
