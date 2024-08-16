package techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// Fetch User email and password
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDao userdb = new UserDao(ConnectionProvider.getConnection());
		User user;
		try {
			user = userdb.getUserData(email, password);
			if(user != null) {
				// To make User Logged In
				HttpSession session = req.getSession();
				session.setAttribute("user", user);
				resp.sendRedirect("profile.jsp");
			}
			else {
				String message = "User not found, You need to SignUp first then LogIn";
				req.setAttribute("error", message);
				RequestDispatcher rd = req.getRequestDispatcher("error.jsp");
				rd.forward(req, resp);
			}
		} 
		catch (SQLException e) {
			PrintWriter out = resp.getWriter();
			e.printStackTrace();
			out.println(e.getMessage());
		}
	}
}