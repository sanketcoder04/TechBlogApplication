package techblog.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import techblog.dao.UserDao;
import techblog.entity.User;
import techblog.helper.ConnectionProvider;
import techblog.helper.HelperToManageFiles;

@SuppressWarnings("serial")
@MultipartConfig
public class EditServlet extends HttpServlet{

	@SuppressWarnings("deprecation")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//fetch all data to update
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String about = req.getParameter("about");
		Part part = req.getPart("image");
		String imageName = part.getSubmittedFileName();
		
		// Session Data Fetching
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			resp.sendRedirect("login.jsp");
		}
		String oldEmail = user.getEmail();
		String oldProfile = user.getProfile();
		
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);
		user.setProfile(imageName);
		
		// Update data into DataBase 
		
		UserDao userdb = new UserDao(ConnectionProvider.getConnection());
		try {
			userdb.updateUser(user, oldEmail);
			
			String path = req.getRealPath("/") + "profiles" + File.separator + user.getProfile();
			String oldPath = req.getRealPath("/") + "profiles" + File.separator + oldProfile;
			if(!oldProfile.equals("default.png")) {
				HelperToManageFiles.deleteFile(oldPath);
			}
			HelperToManageFiles.saveFile(part.getInputStream(), path);
			
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
