import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import RequestUtils.UsersRequest;

import com.google.gson.Gson;


@Path("/users")
public class Users_service {
	Connection conn = null;
    
    public Users_service() {
    	conn = DbConnection.getConnection();
    }
     
   
    @GET
    @Path("{searchText}")
    public Response getUsers(@PathParam("searchText") String searchText, @Context HttpServletRequest request) {
        Gson gson = new Gson();  
        String json = "";
        
//        Integer user_id_obj = (Integer) request.getSession().getAttribute("user_id");
//		int user_id = 0;
//		if (user_id_obj != null) {
//			user_id = user_id_obj.intValue();
//		}
        
//      UsersRequest usersRequest = gson.fromJson(searchText, UsersRequest.class);
//        int user_id = usersRequest.id;
//		String search_name = usersRequest.search_name;
		        
		System.out.print("search_name: " + searchText + ", id: ");
//		System.out.println(user_id);
		
        try {
			List<User> user_list = new ArrayList<User>();			 
			
			String query = "SELECT * FROM users WHERE first_name='"+ searchText +"'"; 
			PreparedStatement prepStatement = conn.prepareStatement(query);
			ResultSet rs = prepStatement.executeQuery(query);
			
			while (rs.next()) {
				User u = new User();
				u.id = rs.getInt("id");
				u.fname = rs.getString("first_name");
				u.lname = rs.getString("last_name");
				u.email = rs.getString("email");
				user_list.add(u);
				
//				System.out.print(rs.getInt("id") + " ");
//				System.out.print(rs.getString("first_name") + " ");
//				System.out.print(rs.getString("last_name") + " ");
//				System.out.println(rs.getString("email") + " ");
//				System.out.println("---");
			}
//			System.out.println("-----------------------");
			
			json = gson.toJson(user_list);
			System.out.println("json: " + json);
			
//			usersSession
			HttpSession session = request.getSession();
			session.setAttribute("users_json", json);
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
        
        return Response.ok(json).build();
    }
    
    @GET
    @Path("{id : \\d+}")
    public Response getUserProfileInfo(@PathParam("id") int id, @Context HttpServletRequest request) {
        Gson gson = new Gson();  
        String json = "";
        
        try {
//			List<User> user_list = new ArrayList<User>();			 
			
			String query = "SELECT * FROM users WHERE id='"+ id +"'"; 
			PreparedStatement prepStatement = conn.prepareStatement(query);
			ResultSet rs = prepStatement.executeQuery(query);
			
			User user = new User();
			while (rs.next()) {
//				User u = new User();
				user.id = rs.getInt("id");
				user.fname = rs.getString("first_name");
				user.lname = rs.getString("last_name");
				user.email = rs.getString("email");
//				user_list.add(u);
			}
			
			json = gson.toJson(user);
			System.out.println("user json: " + json);

			HttpSession session = request.getSession();
			session.setAttribute("user_profile_json", json);
			
        } catch(SQLException e) {
			e.printStackTrace();
		}
 
//        String uribase = "localhost:8080/jdbcexercise/userprofile.jsp"; 
//        URI uri = null;
//        uri = URI.create(uribase);       
//        return Response.seeOther(uri).build();
        
        return Response.ok(json).build();
    }
    
}
