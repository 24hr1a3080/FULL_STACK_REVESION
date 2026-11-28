
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class D6T5 {
    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/day5";
        String username = "root";
        String password = "Varshini@3080";

        try {

            Connection con = DriverManager.getConnection(url, username, password);
            System.out.println("connection successful");

            String query = "insert into student_marks values(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, 1);
            ps.setInt(2, 101);
            ps.setString(3, "Java");
            ps.setInt(4, 85);
            ps.setString(5, "Pass");

            ps.executeUpdate();

            String query1 = "select * from student_marks";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ResultSet rs = ps1.executeQuery();

            while(rs.next()){
                System.out.println(
                        rs.getInt("mark_id") + " " +
                        rs.getInt("student_id") + " " +
                        rs.getString("subject") + " " +
                        rs.getInt("marks") + " " +
                        rs.getString("result")
                );
            }

            String query2 = "select * from student_marks where student_id=101";
            PreparedStatement ps2 = con.prepareStatement(query2);
            ResultSet rs2 = ps2.executeQuery();

            while(rs2.next()){
                System.out.println(
                        rs2.getInt("mark_id") + " " +
                        rs2.getInt("student_id") + " " +
                        rs2.getString("subject") + " " +
                        rs2.getInt("marks") + " " +
                        rs2.getString("result")
                );
            }

            String query3 = "select * from student_marks where marks > 80";
            PreparedStatement ps3 = con.prepareStatement(query3);
            ResultSet rs3 = ps3.executeQuery();

            while(rs3.next()){
                System.out.println(rs3.getInt("student_id"));
            }

            String query4 = "select * from student_marks where marks < 35";
            PreparedStatement ps4 = con.prepareStatement(query4);
            ResultSet rs4 = ps4.executeQuery();

            while(rs4.next()){
                System.out.println(rs4.getInt("student_id"));
            }

            String query5 = "update student_marks set marks=90 where student_id=101";
            PreparedStatement ps5 = con.prepareStatement(query5);
            ps5.executeUpdate();

            String query6 = "select max(marks) as highest_marks from student_marks";
            PreparedStatement ps6 = con.prepareStatement(query6);
            ResultSet rs6 = ps6.executeQuery();

            while(rs6.next()){
                System.out.println(rs6.getInt("highest_marks"));
            }

            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}