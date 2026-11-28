import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class D6T9 {
    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/day6";
        String username = "root";
        String password = "Varshini@3080";

        try {

            Connection con = DriverManager.getConnection(url, username, password);
            System.out.println("connection successful");
             String query = "insert into orders values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, 101);
            ps.setString(2, "Kishore");
            ps.setString(3, "Laptop");
            ps.setInt(4, 2);
            ps.setDouble(5, 90000);
            ps.setString(6, "Pending");

            ps.executeUpdate();

            String query1 = "select * from orders";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ResultSet rs1 = ps1.executeQuery();

                System.out.println(

                        rs1.getInt("order_id") + " " +

                        rs1.getString("customer_name") + " " +

                        rs1.getString("product_name") + " " +

                        rs1.getInt("quantity") + " "+

                        rs1.getDouble("total_amount") + " " +

                        rs1.getInt("order_status") +" " +

                );
        }
          String query2 = "select * from orders where order_id=101";
            PreparedStatement ps2 = con.prepareStatement(query2);
            ResultSet rs2 = ps2.executeQuery();

            while(rs2.next()){
                System.out.println(
                        rs2.getInt("order_id") + " " +
                        rs2.getString("customer_name") + " " +
                        rs2.getString("product_name") + " " +
                        rs2.getInt("quantity") + " " +
                        rs2.getDouble("total_amount") + " " +
                        rs2.getString("order_status")
                );
            }

            String query3 = "select * from orders where customer_name='Kishore'";
            PreparedStatement ps3 = con.prepareStatement(query3);
            ResultSet rs3 = ps3.executeQuery();

            while(rs3.next()){
                System.out.println(
                        rs3.getInt("order_id") + " " +
                        rs3.getString("customer_name")
                );
            }

            String query4 = "update orders set order_status='Delivered' where order_id=101";
            PreparedStatement ps4 = con.prepareStatement(query4);
            ps4.executeUpdate();

            String query5 = "select * from orders where order_status='Pending'";
            PreparedStatement ps5 = con.prepareStatement(query5);
            ResultSet rs5 = ps5.executeQuery();

            while(rs5.next()){
                System.out.println(
                        rs5.getInt("order_id") + " " +
                        rs5.getString("customer_name")
                );
            }

            String query6 = "delete from orders where order_status='Cancelled'";
            PreparedStatement ps6 = con.prepareStatement(query6);
            ps6.executeUpdate();

            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

