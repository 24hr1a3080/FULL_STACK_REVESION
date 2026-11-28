import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class D6T4 {
  public static void main(String[] args) {
    String url="jdbc:mysql://localhost:3306/day5";
    String name="root";
    String password="Varshini@3080";
    try{
    Connection con =DriverManager.getConnection(url,name,password);
    System.out.println("connection succesful");
    String query="insert into customers values(?,?,?,?,?)";
    PreparedStatement ps =con.prepareStatement(query);
    ps.setInt(1, 101);
    ps.setString(2, "kishore");
    ps.setString(3, "regular");
    ps.setString(4, "9550963374");
    ps.setString(5, "kuppam");
    ps.executeUpdate();
    String query1="select * from customers ";
     PreparedStatement ps1 =con.prepareStatement(query1);
    ResultSet rs=ps1.executeQuery();

    while(rs.next()){
      System.out.println(rs.getInt("customer_id")+
    
              rs.getString("customer_name")+
              rs.getString("category")+
              rs.getString("phone")+
              rs.getString("city")
    );

    }

  

     String query2="select customer_id from customers where customer_id=101";
    PreparedStatement ps2 =con.prepareStatement(query2);
    ResultSet rs2=ps2.executeQuery();
    while(rs2.next()){
      System.out.println(rs2.getString("customer_id"));
    }
     String query3="select customer_name from customers where phone=9550963374";
    PreparedStatement ps3 =con.prepareStatement(query3);
    ResultSet rs3=ps3.executeQuery();
    while(rs3.next()){
      System.out.println(rs3.getString("customer_name"));
    }
     
    String query4 = "select customer_name from customers where city='kuppam' ";
     PreparedStatement ps4 =con.prepareStatement(query4);
    ResultSet rs4=ps4.executeQuery();
    while(rs4.next()){
      System.out.println(rs4.getString("customer_name"));
    }
      String query5="select customer_id from customers where customer_id=101";
    PreparedStatement ps5 =con.prepareStatement(query5);
    ResultSet rs5=ps5.executeQuery();
    while(rs5.next()){
      System.out.println(rs5.getString("customer_id"));
 

    }
    System.out.println("customer is not found");
    }catch (Exception e) {
      System.out.println(e);
    }
  }
}
