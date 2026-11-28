import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class D6T7 {
    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/day5";
        String username = "root";
        String password = "Varshini@3080";

        try {

            Connection con = DriverManager.getConnection(url, username, password);
            System.out.println("connection successful");

            String query1 = "select * from employees";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ResultSet rs = ps1.executeQuery();

            while(rs.next()){
                System.out.println(
                        rs.getInt("employee_id") + " " +
                        rs.getString("employee_name") + " " +
                        rs.getString("department") + " " +
                        rs.getString("designation") + " " +
                        rs.getDouble("salary")
                );
            }

            Scanner sc = new Scanner(System.in);

            System.out.println("enter employee id");
            int employee_id = sc.nextInt();

            System.out.println("enter new salary");
            double salary = sc.nextDouble();

            String query2 = "update employees set salary=? where employee_id=?";
            PreparedStatement ps2 = con.prepareStatement(query2);

            ps2.setDouble(1, salary);
            ps2.setInt(2, employee_id);

            int rows = ps2.executeUpdate();

            if(rows > 0){

                String query3 = "select * from employees where employee_id=?";
                PreparedStatement ps3 = con.prepareStatement(query3);

                ps3.setInt(1, employee_id);

                ResultSet rs3 = ps3.executeQuery();

                while(rs3.next()){
                    System.out.println(
                            rs3.getInt("employee_id") + " " +
                            rs3.getString("employee_name") + " " +
                            rs3.getString("department") + " " +
                            rs3.getString("designation") + " " +
                            rs3.getDouble("salary")
                    );
                }

            } else {
                System.out.println("employee id does not exist");
            }

            sc.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}