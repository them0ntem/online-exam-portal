import java.text.SimpleDateFormat;
import java.util.Date;

public class Result {
    protected int id;
    protected int user_id;
    protected int topic_id;
    protected String topic_name;
    protected int no_of_question;
    protected int no_of_correct_question;
    protected String created_at;

    public Result() {
        this.id = 0;
        this.user_id = 0;
        this.topic_id = 0;
        this.topic_name = "";
        this.no_of_question = 0;
        this.no_of_correct_question = 0;
        this.created_at = "";
    }

    public String getTopic_name() {
        return topic_name;
    }

    public void setTopic_name(String topic_name) {
        this.topic_name = topic_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public int getNo_of_question() {
        return no_of_question;
    }

    public void setNo_of_question(int no_of_question) {
        this.no_of_question = no_of_question;
    }

    public int getNo_of_correct_question() {
        return no_of_correct_question;
    }

    public void setNo_of_correct_question(int no_of_correct_question) {
        this.no_of_correct_question = no_of_correct_question;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        SimpleDateFormat date_format = new SimpleDateFormat ("E yyyy-MM-dd hh:mm:ss");
        this.created_at = date_format.format(created_at);
    }
}
