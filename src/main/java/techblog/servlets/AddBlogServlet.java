package techblog.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import techblog.dao.BlogDao;
import techblog.entity.Posts;
import techblog.entity.User;
import techblog.helper.ConnectionProvider;

@SuppressWarnings("serial")
public class AddBlogServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int category_id = Integer.parseInt(req.getParameter("category"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String code = req.getParameter("code");
		String links = req.getParameter("links");
		
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		String user_email = user.getEmail();
		
		Posts blog = new Posts(title,content,code,links,category_id,user_email);
		
		try {
			BlogDao blogdb = new BlogDao(ConnectionProvider.getConnection());
			blogdb.savePost(blog);
			resp.sendRedirect("blogs.jsp");
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
