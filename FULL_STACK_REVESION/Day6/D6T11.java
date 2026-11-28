
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class D6T11 {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/day6";
        String username = "root";
        String password = "your_password";

        try {
            Connection con = DriverManager.getConnection(
                url, username, password
            );

            Scanner sc = new Scanner(System.in);

            // Display all students
            String selectQuery = "SELECT * FROM students";

            PreparedStatement ps1 =
                con.prepareStatement(selectQuery);

            ResultSet rs = ps1.executeQuery();

            System.out.println("----- Student Records -----");

            while (rs.next()) {
                System.out.println(
                    rs.getInt("student_id") + " " +
                    rs.getString("student_name") + " " +
                    rs.getString("department") + " " +
                    rs.getInt("age") + " " +
                    rs.getDouble("marks")
                );
            }

            // Accept student ID
            System.out.print("Enter Student ID to delete: ");
            int id = sc.nextInt();

            // Delete student record
            String deleteQuery =
                "DELETE FROM students WHERE student_id = ?";

            PreparedStatement ps2 =
                con.prepareStatement(deleteQuery);

            ps2.setInt(1, id);

            int rows = ps2.executeUpdate();

            if (rows > 0) {
                System.out.println(
                    "Student record deleted successfully!"
                );
            } else {
                System.out.println(
                    "No record deleted. Student ID not found!"
                );
            }

            // Display remaining students
            System.out.println("----- Remaining Students -----");

            ResultSet rs2 = ps1.executeQuery();

            while (rs2.next()) {
                System.out.println(
                    rs2.getInt("student_id") + " " +
                    rs2.getString("student_name") + " " +
                    rs2.getString("department") + " " +
                    rs2.getInt("age") + " " +
                    rs2.getDouble("marks")
                );
            }

            rs2.close();
            rs.close();
            ps1.close();
            ps2.close();
            con.close();
            sc.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
