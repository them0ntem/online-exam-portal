import java.sql.*;
import java.util.ArrayList;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/User")
public class User extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int score = 0;
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        int id = (int) session.getAttribute("id");
        try {
            ResultSet prev_result = ExecuteQuery.exeQuery("SELECT r.*, t.name from result r, topic t WHERE r.user_id='" + id + "' AND r.topic_id = t.id\n");

            ResultSet user_detail = ExecuteQuery.exeQuery("SELECT * FROM user WHERE id='" + id + "'");
            user_detail.first();

            ArrayList<Result> prev_result_l = new ArrayList<>();
            while (prev_result.next()) {
                Result temp = new Result();
                temp.setId(prev_result.getInt(1));
                temp.setUser_id(prev_result.getInt(2));
                temp.setTopic_id(prev_result.getInt(3));
                temp.setTopic_name(prev_result.getString(7));
                temp.setNo_of_question(prev_result.getInt(4));
                temp.setNo_of_correct_question(prev_result.getInt(5));
                temp.setCreated_at(prev_result.getTimestamp(6));
                prev_result_l.add(temp);
                score += prev_result.getInt(5);
            }
            request.setAttribute("name", user_detail.getString(3));
            request.setAttribute("email", user_detail.getString(4));
            request.setAttribute("average_score", (float) (score * 5) / prev_result_l.size());
            request.setAttribute("total_quiz", prev_result_l.size());
            request.setAttribute("resultset", prev_result_l);

            request.getRequestDispatcher("/user.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("User.java [Error] Exception");
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
