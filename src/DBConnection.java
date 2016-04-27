import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


public class DBConnection {

    private static String driver;
    private static String url;
    private static String user;
    private static String password;

    public static Connection createConnection() {
        Connection con = null;

        Properties prop = new Properties();

        InputStream inputStream = DBConnection.class.getClassLoader().getResourceAsStream("/db.properties");

        try {
            prop.load(inputStream);
        } catch (IOException e) {

            e.printStackTrace();
        }

        driver = prop.getProperty("driver");
        url = prop.getProperty("url");
        user = prop.getProperty("user");
        password = prop.getProperty("password");


        try {
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                System.out.println("DBConnection.java [Error] unable to load driver class!");
                System.exit(1);
            }
            con = DriverManager.getConnection(url, user, password);
            System.out.println("DBConnection.java [Info] Connection successful");
        } catch (SQLException sqe) {
            System.out.println("DBConnection.java [Error] While Creating connection to database");
            sqe.printStackTrace();
        }
        return con;
    }

}


