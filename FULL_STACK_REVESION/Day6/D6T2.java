import java.sql.*;
public class D6T2 {
  public static void main(String[] args) {
    String url="jdbc:mysql://localhost:3306/day5";
    String name="root";
    String password="Varshini@3080";
    try{
    Connection con =DriverManager.getConnection(url,name,password);
    System.out.println("connection succesful");
    String query="insert into employee values(?,?,?,?,?)";
    PreparedStatement ps =con.prepareStatement(query);
    ps.setInt(1, 101);
    ps.setString(2, "kishore");
    ps.setString(3, "hr");
    ps.setDouble(4, 20000);
    ps.setString(5, "cse");
    ps.executeUpdate();
    String query1="select * from employee ";
     PreparedStatement ps1 =con.prepareStatement(query1);
    ResultSet rs=ps1.executeQuery();

    while(rs.next()){
      System.out.println(rs.getInt("employee_id")+
    
              rs.getString("employee_name")+
              rs.getString("designation")+
              rs.getDouble("salary")+
              rs.getString("department")
    );

    }

    }catch (Exception e) {
      System.out.println(e);
    }
  }
  
}