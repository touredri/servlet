package toure;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class MonServlet2
 */
@WebServlet("Inscription")
public class MonServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MonServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String name = request.getParameter("name");
	    String lastname = request.getParameter("lastname");
	    String pseudo = request.getParameter("pseudo");
	    String email = request.getParameter("email");
	    String pass = request.getParameter("pass");
	    String re_pass = request.getParameter("re_pass");
	    Connection con = null;
	    RequestDispatcher dispatcher = null;
	    if(name !="" || lastname !="") {
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet?useSSL=false", "root", "");
	        PreparedStatement pst = con.prepareStatement("insert into users(name,lastname,pseudo,email,pass) values(?,?,?,?,?)");
	        pst.setString(1, name);
	        pst.setString(2, lastname);
	        pst.setString(3, pseudo);
	        pst.setString(4, email);
	        pst.setString(5, pass);
	        
	        int rowCount = pst.executeUpdate();
	        dispatcher = request.getRequestDispatcher("Inscription.jsp");
	        if (rowCount > 0) {
	            request.setAttribute("status", "succes");
	        } else {
	            request.setAttribute("status", "failed");
	        }
	        dispatcher.forward(request, response);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	  } else if(pass != re_pass) {
		  request.setAttribute("status", "pass");
	  }
	  else request.setAttribute("status", "failed");           
	}

}
