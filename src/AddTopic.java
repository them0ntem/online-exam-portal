import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddTopic")
public class AddTopic extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("add_topic.jsp");
        rd.forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        {
            HttpSession session = request.getSession(false);
            int user_id = (int) session.getAttribute("id");
            String topicname = request.getParameter("topicname");
            String topicdesc = request.getParameter("topicdesc");

            String topid_adds = "insert into topic values(NULL , '"+topicname+"', '"+user_id+"',0,'"+topicdesc+"',NULL)";
            int i = UpdateQuery.updQuery(topid_adds);

            RequestDispatcher rd = request.getRequestDispatcher("/Admin");
            rd.forward(request, response);
        }
    }

}
