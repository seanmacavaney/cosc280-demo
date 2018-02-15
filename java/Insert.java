import java.sql.*;

public class Insert {
    public static void main(String[] args) {
        String database = "project280";
        String user = "user280";
        String password = "p4ssw0rd";

        String url = "jdbc:mysql://localhost:3306/" + database;

        try {
            Connection con = DriverManager.getConnection(url, user, password);
            Statement st = con.createStatement();

            if (args.length != 4) {
                System.err.println("error: invalid arguments\nusage: <first name> <last name> <phone> <age>");
                System.exit(1);
            }

            PreparedStatement pst = con.prepareStatement("INSERT INTO people (first_name, last_name, phone, age, time_added) VALUES (?,?,?,?,NOW())");

            for (int i=1; i <= 4; i++)
                pst.setString(i, args[i - 1]);

            pst.executeUpdate();

        } catch (SQLException ex) {
            System.err.println("SQL error: " + ex.getMessage());
        }
    }
}
