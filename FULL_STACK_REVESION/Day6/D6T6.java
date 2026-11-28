import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class D6T6 {
    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/day5";
        String username = "root";
        String password = "Varshini@3080";

        try {

            Connection con = DriverManager.getConnection(url, username, password);
            System.out.println("connection successful");

            String query = "insert into bank_accounts values(?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, 101);
            ps.setString(2, "Kishore");
            ps.setString(3, "Savings");
            ps.setDouble(4, 10000);

            ps.executeUpdate();

            String query1 = "select * from bank_accounts";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ResultSet rs = ps1.executeQuery();

            while(rs.next()){
                System.out.println(
                        rs.getInt("account_id") + " " +
                        rs.getString("customer_name") + " " +
                        rs.getString("account_type") + " " +
                        rs.getDouble("balance")
                );
            }

            String query2 = "select * from bank_accounts where account_id=101";
            PreparedStatement ps2 = con.prepareStatement(query2);
            ResultSet rs2 = ps2.executeQuery();

            while(rs2.next()){
                System.out.println(
                        rs2.getInt("account_id") + " " +
                        rs2.getString("customer_name") + " " +
                        rs2.getString("account_type") + " " +
                        rs2.getDouble("balance")
                );
            }

            String query3 = "update bank_accounts set balance=balance+5000 where account_id=101";
            PreparedStatement ps3 = con.prepareStatement(query3);
            ps3.executeUpdate();

            String query4 = "select balance from bank_accounts where account_id=101";
            PreparedStatement ps4 = con.prepareStatement(query4);
            ResultSet rs4 = ps4.executeQuery();

            double balance = 0;

            while(rs4.next()){
                balance = rs4.getDouble("balance");
            }

            if(balance >= 3000){
                String query5 = "update bank_accounts set balance=balance-3000 where account_id=101";
                PreparedStatement ps5 = con.prepareStatement(query5);
                ps5.executeUpdate();
                System.out.println("withdraw successful");
            }
            else{
                System.out.println("insufficient balance");
            }

            String query6 = "select balance from bank_accounts where account_id=101";
            PreparedStatement ps6 = con.prepareStatement(query6);
            ResultSet rs6 = ps6.executeQuery();

            while(rs6.next()){
                System.out.println("updated balance : " + rs6.getDouble("balance"));
            }

            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}