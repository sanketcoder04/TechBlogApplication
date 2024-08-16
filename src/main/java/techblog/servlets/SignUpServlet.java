package techblog.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import techblog.dao.UserDao;
import techblog.entity.User;
import techblog.helper.ConnectionProvider;

@SuppressWarnings("serial")
public class SignUpServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Fetching User Input Data from signup.jsp
		String name = req.getParameter("username");
		String email = req.getParameter("useremail");
		String password = req.getParameter("password");
		String gender = req.getParameter("gender");
		String about = req.getParameter("about");

		// Creating User object from these fields
		User user = new User(name, email, password, gender, about);

		// Insert User data at users table in TechBlog database
		UserDao userdb = new UserDao(ConnectionProvider.getConnection());
		
		try {
			userdb.insertUserData(user);
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			resp.sendRedirect("profile.jsp");
		} 
		catch (SQLException e) {
			String message = "You already have an Account, need to LogIn ";
			req.setAttribute("error", message);
			RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
			rd.forward(req, resp);
		}
	}
}
