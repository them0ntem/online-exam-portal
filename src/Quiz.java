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
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;

@WebServlet("/Quiz")
public class Quiz extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int correct = 0;
        try {

            for (int i = 1; i <= 10; i++) {
                int ques_id = Integer.parseInt(request.getParameter("question" + i + "_id"));
                int option = Integer.parseInt(request.getParameter("question" + i + "_option"));

                ResultSet correct_ans = ExecuteQuery.exeQuery("select correct_answer from question where id='" + ques_id + "'");
                if (correct_ans.next()) {
                    request.setAttribute("question" + i + "_option", option);
                    request.setAttribute("question" + i + "_id", ques_id);
                    request.setAttribute("question" + i + "_correct_ans", correct_ans.getInt(1));
                    if (option == correct_ans.getInt(1)) {
                        correct++;
                        request.setAttribute("question" + i + "_correct", "true");
                    } else {
                        request.setAttribute("question" + i + "_correct", "false");
                    }
                }
            }
            HttpSession session = request.getSession(false);
            int user_id = (int) session.getAttribute("id");
            int topic_id = (int) session.getAttribute("topic_id");

            int i = UpdateQuery.updQuery("insert into result values(NULL,'"+user_id+"','"+topic_id+"',10,'"+correct+"',NULL)");

            if (i>0){
                response.sendRedirect("User");
            } else {
                System.out.println("Quiz.java [Error] SQLError");
            }

        } catch (Exception e) {
            System.out.println("Quiz.java [Error] Exception");
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();
            HttpSession session = request.getSession(false);
            if (session.getAttribute("topic_id") != null) {
                int topic_id = (int) session.getAttribute("topic_id");
                ResultSet quiz_ques = ExecuteQuery.exeQuery("select * from question where topic_id=" + topic_id);
                int no_of_ques = 0;
                if (quiz_ques.last()) {
                    no_of_ques = quiz_ques.getRow();
                    quiz_ques.beforeFirst();
                }
                ArrayList<Integer> numbers = new ArrayList<>();
                for (int i = 0; i < no_of_ques; i++) {
                    numbers.add(i + 1);
                }
                Collections.shuffle(numbers);

                ArrayList<Question> quiz_ques_l = new ArrayList<>();
                for (int j = 0; j < 10; j++) {
                    quiz_ques.absolute(numbers.get(j));
                    Question temp = new Question();
                    temp.setId(quiz_ques.getInt(1));
                    temp.setText(quiz_ques.getString(3));
                    temp.setOption1(quiz_ques.getString(4));
                    temp.setOption2(quiz_ques.getString(5));
                    temp.setOption3(quiz_ques.getString(6));
                    temp.setOption4(quiz_ques.getString(7));
                    temp.setCorrect_answer(quiz_ques.getInt(8));
                    quiz_ques_l.add(temp);
                }
                request.setAttribute("quiz_list", quiz_ques_l);

                ResultSet topic = ExecuteQuery.exeQuery("select name from topic where id=" + topic_id);
                topic.first();

                request.setAttribute("topic_name", topic.getString(1));
                request.getRequestDispatcher("/quiz.jsp").forward(request, response);
            } else {
                response.sendRedirect("/SelectTopic");
            }
        } catch (Exception e) {
            System.out.println("Quiz.java [Error] Exception");
            e.printStackTrace();
        }

    }
}
