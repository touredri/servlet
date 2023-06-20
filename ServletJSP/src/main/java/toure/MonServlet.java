package toure;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/Login")
public class MonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MonServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet?useSSL=false", "root", "");
            PreparedStatement pst = con.prepareStatement("select * from users where pseudo = ? and pass = ?");
            pst.setString(1, username);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            
            PreparedStatement result = con.prepareStatement("select * from users");
            ResultSet resultat = result.executeQuery();
            List<String> usersList = new ArrayList<String>();
            while (resultat.next()) {
                //Users user = new Users(resultat.getString("pseudo"), resultat.getString("email"));
               // usersList.add(user.getUser());
            }
            request.setAttribute("listUsers", usersList);

            if (rs.next()) {
                session.setAttribute("name", rs.getString("name"));
                request.getRequestDispatcher("Acceuil.jsp").forward(request, response);
            } else {
                request.setAttribute("status", "failed");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
