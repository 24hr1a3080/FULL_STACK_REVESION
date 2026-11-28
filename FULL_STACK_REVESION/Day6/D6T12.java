import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;
public class D6T12 {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/day6";
        String username = "root";
        String password = "Varshini@3080";
        try {
            Connection con = DriverManager.getConnection(url, username, password);
            Scanner sc = new Scanner(System.in);
            String insertQuery ="INSERT INTO electricity_bills VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps1 = con.prepareStatement(insertQuery);
            System.out.print("Enter Bill ID: ");
            int id = sc.nextInt();
            sc.nextLine();
            System.out.print("Enter Customer Name: ");
            String name = sc.nextLine();
            System.out.print("Enter Units Consumed: ");
            int units = sc.nextInt();
            System.out.print("Enter Amount: ");
            double amount = sc.nextDouble();
            sc.nextLine();
            System.out.print("Enter Payment Status: ");
            String status = sc.nextLine();
            ps1.setInt(1, id);
            ps1.setString(2, name);
            ps1.setInt(3, units);
            ps1.setDouble(4, amount);
            ps1.setString(5, status);
            int rows = ps1.executeUpdate();
            if (rows > 0) {
                System.out.println("Bill inserted successfully!");
            }
            System.out.println("\n----- All Electricity Bills -----");
            String selectQuery = "SELECT * FROM electricity_bills";
            PreparedStatement ps2 = con.prepareStatement(selectQuery);
            ResultSet rs1 = ps2.executeQuery();
            while (rs1.next()) {
                System.out.println(
                    rs1.getInt("bill_id") + " " +
                    rs1.getString("customer_name") + " " +
                    rs1.getInt("units_consumed") + " " +
                    rs1.getDouble("amount") + " " +
                    rs1.getString("payment_status")
                );
            }
            System.out.print("\nEnter Bill ID to Search: ");
            int searchId = sc.nextInt();
            String searchQuery = "SELECT * FROM electricity_bills WHERE bill_id = ?";
            PreparedStatement ps3 = con.prepareStatement(searchQuery);
            ps3.setInt(1, searchId);
            ResultSet rs2 = ps3.executeQuery();
            if (rs2.next()) {
                System.out.println("Bill ID: " +
                    rs2.getInt("bill_id"));
                System.out.println("Customer Name: " +rs2.getString("customer_name"));
                System.out.println("Units: " + rs2.getInt("units_consumed"));
                System.out.println("Amount: " + rs2.getDouble("amount"));
                System.out.println("Status: " + rs2.getString("payment_status"));
            } else {
                System.out.println("Bill not found!");
            }
            System.out.println("\n----- Unpaid Bills -----");
            String unpaidQuery = "SELECT * FROM electricity_bills " + "WHERE payment_status = 'Unpaid'";
            PreparedStatement ps4 =con.prepareStatement(unpaidQuery);
            ResultSet rs3 = ps4.executeQuery();
            while (rs3.next()) {
                System.out.println(
                    rs3.getInt("bill_id") + " " +
                    rs3.getString("customer_name") + " " +
                    rs3.getDouble("amount")
                );
            }
            System.out.println("\n----- Customers Consuming More Than 200 Units -----");
            String unitsQuery = "SELECT * FROM electricity_bills WHERE units_consumed > 200";
            PreparedStatement ps5 = con.prepareStatement(unitsQuery);
            ResultSet rs4 = ps5.executeQuery();
            while (rs4.next()) {
                System.out.println(
                    rs4.getString("customer_name") + " " +
                    rs4.getInt("units_consumed") );
            }
            System.out.print("\nEnter Bill ID to Update Payment: ");
            int updateId = sc.nextInt();
            String updateQuery = "UPDATE electricity_bills " + "SET payment_status = 'Paid' WHERE bill_id = ?";
            PreparedStatement ps6 = con.prepareStatement(updateQuery);
            ps6.setInt(1, updateId);
            int updated = ps6.executeUpdate();
            if (updated > 0) {
                System.out.println("Payment status updated successfully!");
            } else {
                System.out.println("Bill ID not found!");
            }
            System.out.println("\n----- Total Unpaid Amount -----");
            String totalQuery = "SELECT SUM(amount) AS total FROM electricity_bills " + "WHERE payment_status = 'Unpaid'";
            PreparedStatement ps7 = con.prepareStatement(totalQuery);
            ResultSet rs5 = ps7.executeQuery();
            if (rs5.next()) {
                System.out.println("Total Unpaid Amount: " +rs5.getDouble("total"));
            }
            rs1.close();
            rs2.close();
            rs3.close();
            rs4.close();
            rs5.close();
            ps1.close();
            ps2.close();
            ps3.close();
            ps4.close();
            ps5.close();
            ps6.close();
            ps7.close();
            con.close();
            sc.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
