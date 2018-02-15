import java.sql.*;

public class Select {
    public static void main(String[] args) {
        String database = "project280";
        String user = "user280";
        String password = "p4ssw0rd";

        String url = "jdbc:mysql://localhost:3306/" + database;

        try {
            Connection con = DriverManager.getConnection(url, user, password);
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("SELECT first_name, last_name FROM People");

            while (rs.next()) {
                System.out.println(rs.getString(1) + " " + rs.getString(2));
            }

        } catch (SQLException ex) {
            System.err.println("SQL error: " + ex.getMessage());
        }
    }
}
