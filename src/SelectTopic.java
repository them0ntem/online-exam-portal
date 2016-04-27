import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet("/SelectTopic")
public class SelectTopic extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        int topic_id = Integer.parseInt(request.getParameter("topic"));

        HttpSession session = request.getSession();
        session.setAttribute("topic_id", topic_id);
        out.print(session.getAttribute("topic_id"));
        response.sendRedirect("/Quiz");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultSet topic = ExecuteQuery.exeQuery("select * from topic");
        try {
            ArrayList<Topic> topic_l = new ArrayList<>();
            while (topic.next()) {
                Topic temp = new Topic();
                temp.setName(topic.getString(2));
                temp.setId(topic.getInt(1));
                topic_l.add(temp);
            }
            request.setAttribute("topic_list", topic_l);

            RequestDispatcher rd = request.getRequestDispatcher("/select_topic.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println("User.java [Error] Exception");
            e.printStackTrace();
        }

    }
}
