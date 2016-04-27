import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ExecuteQuery extends DBConnection {

    public static ResultSet exeQuery(String query) {
        Connection con = createConnection();
        Statement st = null;

        try {
            st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        } catch (SQLException e) {
            System.out.println("ExecuteQuery.java [Error] SQL Exception");
            e.printStackTrace();
        } catch (NullPointerException e){
            System.out.println("ExecuteQuery.java [Error] Null Pointer Exception");
            e.printStackTrace();
        }

        ResultSet resultSet = null;

        try {
            resultSet = st.executeQuery(query);
        } catch (SQLException ex) {
            System.out.println("ExecuteQuery.java [Error] SQL Exception");
            ex.printStackTrace();
        }

        return resultSet;
    }
}
