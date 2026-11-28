import java.sql.*;

public class D6T3 {
  public static void main(String[] args) {
    String url="jdbc:mysql://localhost:3306/day5";
    String name="root";
    String password="Varshini@3080";
    try{
    Connection con =DriverManager.getConnection(url,name,password);
    String query="insert into products values(?,?,?,?,?)";
    PreparedStatement ps =con.prepareStatement(query);
    ps.setInt(1, 101);
    ps.setString(2, "Laptop");
    ps.setString(3, "electronic");
    ps.setDouble(4, 20000);
    ps.setInt(5, 5);
    ps.executeUpdate();
    String query1="select product_name from products";
    PreparedStatement ps1 =con.prepareStatement(query1);
    ResultSet rs=ps1.executeQuery();
    while(rs.next()){
      System.out.println(rs.getString("product_name"));
    }

     String query2="select product_name from products where product_id=101";
    PreparedStatement ps2 =con.prepareStatement(query2);
    ResultSet rs2=ps2.executeQuery();
    while(rs2.next()){
      System.out.println(rs2.getString("product_name"));
    }
     String query3="select stock_quantity from products where stock_quantity<10";
    PreparedStatement ps3 =con.prepareStatement(query3);
    ResultSet rs3=ps3.executeQuery();
    while(rs3.next()){
      System.out.println(rs3.getInt("stock_quantity"));
    }
     
    String query4 = "select product_name from products where category='electronic' ";
     PreparedStatement ps4 =con.prepareStatement(query4);
    ResultSet rs4=ps4.executeQuery();
    while(rs4.next()){
      System.out.println(rs4.getString("product_name"));
    }

   String query5 = "select count(*) as total from products";

PreparedStatement ps5 = con.prepareStatement(query5);

ResultSet rs5 = ps5.executeQuery();

while(rs5.next()){
    System.out.println(rs5.getInt("total"));
}




    }catch(Exception e){
      System.out.println(e);
    }

  }
}