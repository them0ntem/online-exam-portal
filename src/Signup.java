import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Signup")
public class Signup extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String password = request.getParameter("password");
        String name = firstname + " " + lastname;
        String email = request.getParameter("email");
        String sex = request.getParameter("gender");
        String work_place = request.getParameter("workplace");
        try {
            String username_checkq = "select * from user where username='" + username + "'";
            ResultSet username_checkrs = ExecuteQuery.exeQuery(username_checkq);
            if (username.isEmpty() || firstname.isEmpty() || lastname.isEmpty() || password.isEmpty() || email.isEmpty() || sex.isEmpty() || work_place.isEmpty()) {
                request.setAttribute("error", "true");
                request.setAttribute("error_msg", "Please fill all the fields");
                doGet(request, response);
            } else if (username_checkrs.next()) {
                request.setAttribute("error", "true");
                request.setAttribute("error_msg", "Username already exists");
                doGet(request, response);
            } else {
                String s = "insert into user(`id`, `username`, `name`, `email`, `password_hash`, `level`, `workspace`, `created_at`, `sex`) values(NULL,'" + username + "','" + name + "','" + email + "','" + password + "',1,'" + work_place + "',NULL,'" + sex + "')";
                out.print(s);
                int i = UpdateQuery.updQuery(s);
                if (i > 0) {
                    String str = "SELECT id FROM user ORDER BY created_at DESC LIMIT 1";
                    ResultSet user_idrs = ExecuteQuery.exeQuery(str);
                    user_idrs.first();
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("id", user_idrs.getInt(1));
                    session.setAttribute("name", name);
                    session.setAttribute("login", "true");
                    response.sendRedirect("User");
                }
            }
        } catch (Exception e) {
            System.out.println("Signup.java [Error] Exception");
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
        rd.forward(request, response);
    }
}
