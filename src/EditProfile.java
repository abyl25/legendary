
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.api.jdbc.Statement;

@WebServlet("/editprofile")
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/se_project"+"?verifyServerCertificate=false"+ 
	 	     "&useSSL=false"+"&requireSSL=false"+ 
	 	     "&useLegacyDatetimeCode=false"+ "&amp"+"&serverTimezone=UTC";
    
    public EditProfile() {
        super();     
        conn = DbConnection.getConnection();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String age = request.getParameter("profile-age");
		String profession = request.getParameter("profile-profession");
		String education = request.getParameter("profile-education");
		String skills = request.getParameter("profile-skills");
		String salary = request.getParameter("profile-salary");
		String availability = request.getParameter("profile-availability");
		String links = request.getParameter("profile-links");
		String phone = request.getParameter("profile-phone");
		
		String message = "";
		
		if (conn == null) {
			out.append("Database connection error");
			return;
		}
		
		try {
			HttpSession session = request.getSession(true);
			String fname = (String) session.getAttribute("first_name");
			Integer user_id_obj = (Integer) session.getAttribute("user_id");
			int user_id = 0;
			if (user_id_obj != null) {
				user_id = user_id_obj.intValue();
			} else {
				return;
			}
			
			String query = "INSERT INTO profile (user_id, age, profession, education, major, skills, work_link, phone, photo) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement prepStatement = conn.prepareStatement(query);
			prepStatement.setInt(1, user_id);
			prepStatement.setString(2, age);
			prepStatement.setString(3, profession);
			prepStatement.setString(4, education);
			prepStatement.setString(5, skills);
			prepStatement.setString(6, salary);
			prepStatement.setString(7, availability);
			prepStatement.setString(8, links);
			prepStatement.setString(9, phone);
			prepStatement.execute();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("profile.jsp");
	}

}
