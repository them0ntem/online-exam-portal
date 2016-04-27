import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Upgrade")
public class UpgradeUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);

        if (session != null) {
            int id = (int) session.getAttribute("id");
            String upgrade_reqs = "insert into upgrade_request values(NULL,'" + id + "',NULL)";
            try {
                int i = UpdateQuery.updQuery(upgrade_reqs);
                System.out.println(i);
                if (i > 0) {
                    request.setAttribute("info", "true");
                    request.setAttribute("info_msg", "Your upgradation request has been sent.");
                    request.getRequestDispatcher("/User").forward(request, response);
                }
            } catch (Exception e) {
                System.out.println("UpgradeUser.java [Error] Exception");
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("upgrade_request", "true");
        request.getRequestDispatcher("/User").forward(request, response);
    }
}
