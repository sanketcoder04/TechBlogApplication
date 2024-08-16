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
public class DeleteServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		String email = user.getEmail();
		
		UserDao usedb = new UserDao(ConnectionProvider.getConnection());
		try {
			usedb.deleteUser(user, email);
			session.invalidate();
			resp.sendRedirect("home.jsp");
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
